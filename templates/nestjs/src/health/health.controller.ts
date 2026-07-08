import { Controller, Get } from '@nestjs/common';

import { AppConfigService } from '../config/app-config.service';

@Controller('health')
export class HealthController {
  constructor(private readonly config: AppConfigService) {}

  @Get()
  getHealth(): { status: string; app: string } {
    return {
      status: 'ok',
      app: this.config.name,
    };
  }
}
