import dotenv from "dotenv"
dotenv.config()
import cors from "cors"
import express from "express"
import type { Request, Response, NextFunction } from "express"
import { connAtlas, connSupabase, connPrisma, connRedis } from "../config/db"
import { rateLimiter } from "../middleware/rateLimiter"
import dishRoute from './route/dishRoute'
import userRoute from './route/userRoute'



const app: any = express()
const PORT = process.env.PORT || 1122


// middleware
app.use(express.json())
app.use(cors())
app.use(rateLimiter)
app.use(express.urlencoded({ extended: true }));
app.use((req: Request, res: Response, next: NextFunction) => {
  console.log(`new req deteceted--${req.method}--${req.url}`) // log this before req execution

  // parse and validate JWT ...

  next()
})

app.get('/ping', (req: any, res: any) => {
  res.json({ message: 'Server is running' })
})

app.use("/v1/dish", dishRoute)
app.use("/v1/user", userRoute)
// app.use("/v1/profile", profileRoute)

// connAtlas(process.env.ATLAS_CL1_DISH!).then(() => {
//   app.listen(PORT, () => {
//     console.log('BLG1A2 running on port:', PORT);
//   });
// })
Promise.all([
  connAtlas(),
  connPrisma(),
  connRedis(),
  // connSupabase`SELECT 1`
]).then(() => {
  app.listen(PORT, () => {
    console.log('BLG1A2 running on port:', PORT);
  });
}).catch(err => {
  console.log("DB connection failed", err)
  process.exit(1)
})

