import  mongoose from 'mongoose'
import postgres from 'postgres'

export const connSupabase = postgres(process.env.SUPABASE_URL)


export const connAtlas = async (url:string) => {
     try {
          await mongoose.connect(url)
          console.log("MONGO ATLAS IS LIVE ..")
     } catch (err) {
          console.log("ERR DB CONNECTION --01", err)
          process.exit(1) // exit with failure
     }
}

