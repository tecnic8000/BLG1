import mongoose from 'mongoose'

const dishSchema = new mongoose.Schema(
     {
          name: {
               type: String,
               required: true
          },
          desc: {
               type: String,
               required: true
          },
          servings: {
               type: Number,
               required: false
          },
          meals: {
               type: Number,
               required: false
          }
     },
     { timestamps: true } // createdAt, updatedAt
)

const Dish = mongoose.model("Dish", dishSchema)

export default Dish