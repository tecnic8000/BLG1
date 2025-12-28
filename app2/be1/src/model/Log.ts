import mongoose from 'mongoose'

const logSchema = new mongoose.Schema(
     {
          title: {
               type: String,
               required: true
          },
          content: {
               type: String,
               required: true
          }
     },
     { timestamps: true} // createdAt, updatedAt
)

const Log =  mongoose.model("Log", logSchema)

export default Log

