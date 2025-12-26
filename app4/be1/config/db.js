import  mongoose from 'mongoose'


export const connectiondb = async (url) => {
     try {
          await mongoose.connect(url)
          console.log("MONGO ATLAS IS LIVE ..")
     } catch (err) {
          console.log("ERR DB CONNECTION --01", err)
          process.exit(1) // exit with failure
     }
}