const Fastify = require('fastify');
const { PrismaClient } = require('@prisma/client');

const fastify = Fastify({ logger: true });
const prisma = new PrismaClient();

fastify.register(require('@fastify/cors'), { origin: '*' });

fastify.get('/tests', async (request, reply) => {
  const tests = await prisma.test.findMany();
  return tests;
});

fastify.post('/tests', async (request, reply) => {
  const { name } = request.body;
  const test = await prisma.test.create({
    data: { name },
  });
  reply.code(201);
  return test;
});

fastify.listen({ port: 3000 }, (err, address) => {
  if (err) throw err;
  fastify.log.info(`Server listening at ${address}`);
});
