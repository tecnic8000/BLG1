import express from "express"
import noteRoutes from './routes/noteRoutes.js'
import { connectiondb } from "../config/db.js"
import { rateLimiter } from "../middleware/rateLimiter.js"
import dotenv from 'dotenv'
dotenv.config()

const app = express()

// middleware
app.use(express.json())
app.use(rateLimiter)
app.use((req, res, next) => {
     console.log(`new req deteceted--${req.method}--${req.url}`) // log this before req execution
     // potential for JWT here
     next()
})

app.use("/v1/notes", noteRoutes)

connectiondb(process.env.DB_URL).then(() => {
     app.listen(4001, () => {
          console.log("BLG1A2BE running")
     })
})