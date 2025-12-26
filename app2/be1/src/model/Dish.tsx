import mongoose from 'mongoose'

const dishSchema = new mongoose.Schema(
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

const Dish =  mongoose.model("Dish", dishSchema)

export default Dish