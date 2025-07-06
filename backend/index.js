const Fastify = require('fastify');
const { PrismaClient } = require('@prisma/client');

const fastify = Fastify({ logger: true });
const prisma = new PrismaClient();

fastify.register(require('@fastify/cors'), { origin: '*' });

/* --------- Routes UV --------- */
fastify.get('/uvs', async (req, reply) => {
  return await prisma.uv.findMany();
});

/* --------- Routes Semestre --------- */
fastify.get('/semestres', async (req, reply) => {
  return await prisma.semestre.findMany();
});

/* --------- Routes Responsable --------- */
fastify.get('/responsables', async (req, reply) => {
  return await prisma.responsable.findMany();
});

/* --------- Routes Assurer --------- */
fastify.get('/assurers', async (req, reply) => {
  return await prisma.assurer.findMany();
});

/* --------- Routes Statistiques --------- */
fastify.get('/statistiques', async (req, reply) => {
  return await prisma.statistiques.findMany();
});

/* --------- Routes Evaluation --------- */
fastify.get('/evaluations', async (req, reply) => {
  return await prisma.evaluation.findMany();
});

/* --------- Routes Avis --------- */
fastify.get('/avis', async (req, reply) => {
  return await prisma.avis.findMany();
});

/* --------- Routes Document --------- */
fastify.get('/documents', async (req, reply) => {
  return await prisma.document.findMany();
});

/* --------- Server --------- */
fastify.listen({ port: 3000 }, (err, address) => {
  if (err) throw err;
  fastify.log.info(`Server listening at ${address}`);
});


fastify.get('/uvs/:code_uv/details', async (req, reply) => {
  const { code_uv } = req.params;
  const uv = await prisma.uv.findUnique({
    where: { code_uv },
    include: {
      assurers: {
        include: {
          responsable: true,
          semestre: true
        }
      },
      evaluations: true,
      statistiques: true,
      avis: true,
      documents: true
    }
  });
  if (!uv) {
    reply.code(404).send({ error: "UV non trouvée" });
    return;
  }
  return uv;
});
