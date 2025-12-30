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
          serving: {
               type: Number,
               required: false
          },
          meal: {
               type: Number,
               required: false
          }
     },
     { timestamps: true } // createdAt, updatedAt
)

const Dish = mongoose.model("Dish", dishSchema)

export default Dish