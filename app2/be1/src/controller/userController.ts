import type { Request, Response } from 'express'
import { prisma } from '../../config/db'

export async function getAllUsers(_: Request, res: Response) {
     try {
          const users = await prisma.users.findMany()
          return res.status(200).json({message:users})
     } catch (e){
          console.log(e)
          return res.status(500).json({message:"INTERNAL SERVER ERR--01"})
     }
}