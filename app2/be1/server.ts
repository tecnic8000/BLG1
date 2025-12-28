import express from "express"
import dotenv from "dotenv"
import cors from "cors"

dotenv.config()
const app:any = express()
const PORT = process.env.PORT || 1122

// middleware
app.use(express.json())
app.use(cors())
app.use(express.urlencoded({ extended: true }));

app.get('/', (req:any, res:any) => {
  res.json({ message: 'Server is running' })
})

app.listen(PORT, () => {
  console.log('Server running on port:', PORT);
});
