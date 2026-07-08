import { Test } from '@nestjs/testing';

import { AppModule } from '../src/app.module';
import { HealthController } from '../src/health/health.controller';

describe('HealthController', () => {
  it('returns healthy payload', async () => {
    const moduleRef = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    const controller = moduleRef.get(HealthController);

    expect(controller.getHealth()).toEqual({
      status: 'ok',
      app: '__PROJECT_NAME__',
    });
  });
});
