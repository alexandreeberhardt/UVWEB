const { PrismaClient } = require('@prisma/client')
const fs = require('fs')
const prisma = new PrismaClient()

async function main() {
  const uvs = JSON.parse(fs.readFileSync('prisma/data/uvs.json', 'utf-8'))
  const semestres = JSON.parse(fs.readFileSync('prisma/data/semestres.json', 'utf-8'))
  const responsables = JSON.parse(fs.readFileSync('prisma/data/responsables.json', 'utf-8'))

  await prisma.uv.createMany({ data: uvs, skipDuplicates: true })
  await prisma.semestre.createMany({ data: semestres, skipDuplicates: true })
  await prisma.responsable.createMany({ data: responsables, skipDuplicates: true })

  const assurers = JSON.parse(fs.readFileSync('prisma/data/assurers.json', 'utf-8'))
  const statistiques = JSON.parse(fs.readFileSync('prisma/data/statistiques.json', 'utf-8'))
  const evaluations = JSON.parse(fs.readFileSync('prisma/data/evaluations.json', 'utf-8'))
  const avis = JSON.parse(fs.readFileSync('prisma/data/avis.json', 'utf-8'))

  await prisma.assurer.createMany({ data: assurers, skipDuplicates: true })
  await prisma.statistiques.createMany({ data: statistiques, skipDuplicates: true })
  await prisma.evaluation.createMany({ data: evaluations, skipDuplicates: true })
  await prisma.avis.createMany({ data: avis, skipDuplicates: true })

  console.log('Tous les jeux de données sont insérés !')
}

main()
  .catch(e => {
    console.error(e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
