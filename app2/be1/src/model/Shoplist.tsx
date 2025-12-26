import mongoose from 'mongoose'

const ShoplistSchema = new mongoose.Schema(
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

const Shoplist =  mongoose.model("Shoplist", ShoplistSchema)

export default Shoplist