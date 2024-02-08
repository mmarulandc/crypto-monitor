import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  const user_1 = await prisma.user.upsert({
    where: { username: 'Felucho' },
    update: {},
    create: {
      name: 'Felix',
      lastname: 'Marulanda',
      username: 'Felucho',
      favoriteCurrency: {
        create: {
          name: 'USD',
        },
      },
    },
  });
  const crypto_user_1 = await prisma.crytocurrency.upsert({
    where: { symbol: 'TEST' },
    update: {},
    create: {
      symbol: 'TEST',
      name: 'TEST coin',
      image:
        'https://scontent.feoh3-1.fna.fbcdn.net/v/t1.6435-9/180978949_314228950059549_1005358403722529104_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=be3454&_nc_ohc=HWbWYquRBSwAX_dXNyE&_nc_ht=scontent.feoh3-1.fna&oh=00_AfD_tLRfLh8NprqU5NSfiIuaVInsT-AjXp0VyItoJQnobA&oe=65ECD04E',
      geckocoinId: "TEST",
      userId: 1
    },
  });
  console.log(user_1, crypto_user_1);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
