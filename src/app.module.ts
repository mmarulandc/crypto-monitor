import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CoingeckoService } from './coingecko/coingecko.service';
import { UsersService } from './users/users.service';
import { CoingeckoModule } from './coingecko/coingecko.module';
import { PrismaModule } from './prisma/prisma.module';
import { UsersModule } from './users/users.module';
import { UsersController } from './users/users.controller';
import { PrismaService } from './prisma/prisma.service';

@Module({
  imports: [UsersModule, CoingeckoModule, PrismaModule],
  controllers: [UsersController],
  providers: [AppService, CoingeckoService, UsersService, PrismaService],
})
export class AppModule {}
