import dotenv from "dotenv"
dotenv.config()
import mongoose from 'mongoose'
import postgres from 'postgres'
import { PrismaClient } from '../src/generated/prisma/client'
import { PrismaPg } from '@prisma/adapter-pg'
import { Redis } from '@upstash/redis'

const connectionString = process.env.DATABASE_URL
const connStringRedisUrl = process.env.UPSTASH_REDIS_REST_URL
const connStringRedisTkn = process.env.UPSTASH_REDIS_REST_TOKEN
const connStringAtlas = process.env.ATLAS_CL1_DISH

if (!connectionString) { //|| !connStringAtlas || !connStringRedisUrl || !connStringRedisTkn) {
     console.error('.ENV not set')
     process.exit(1)
}

export const prisma = new PrismaClient({
     adapter: new PrismaPg({
          connectionString
     })
})

export const redis = new Redis({
     url: connStringRedisUrl,
     token: connStringRedisTkn,
})

export async function connRedis() {
     try {
          const result = await redis.ping()
          console.log('REDIS--PING', result)
          return result
     } catch (e) {
          console.log("ERR--REDIS IS DOWN", e)
          process.exit(1)
     }
}

export const connPrisma = async () => {
     try {
          const result = await prisma.$connect()
          console.log("PRISMA--OK")
          return result
     } catch (err) {
          console.log("ERR PRISMA CONNECTION --01", err)
          process.exit(1)
     }
}

export const connAtlas = async () => {
     try {
          const result = await mongoose.connect(connStringAtlas!)
          console.log("ATLAS--OK")
          return result
     } catch (err) {
          console.log("ERR DB CONNECTION --01", err)
          process.exit(1) // exit with failure
     }
}


// doesnt work somehow
export const connSupabase = postgres(process.env.SUPABASE_URL!)