import { Injectable } from '@nestjs/common';

@Injectable()
export class AppConfigService {
  get name(): string {
    return process.env.APP_NAME ?? '__PROJECT_NAME__';
  }

  get port(): number {
    return Number(process.env.PORT ?? '3000');
  }
}
