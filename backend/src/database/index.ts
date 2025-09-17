import { PrismaClient } from '@prisma/client/edge'
import { withAccelerate } from '@prisma/extension-accelerate'

let prisma: PrismaClient

const connectDB = async() => {
    return prisma = await new PrismaClient().$extends(withAccelerate())
}
export { prisma, connectDB }