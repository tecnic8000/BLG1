import type { Request, Response } from 'express';
import Dish from '../model/Dish'

export async function getAllDishes(_: Request, res: Response) {
     try {
          const dishes = await Dish.find().sort({ createdAt: 1 })
          res.status(200).json(dishes)
     } catch (e) {
          console.log(e)
          res.status(500).json({ message: "INTERNAL ERR--01" })
     }
}

export async function getDish(req: Request, res: Response) {
     try {
          const dish = await Dish.findById(req.params.id)
          if (!dish) return res.status(404).json({ message: "no dish found--02" })
          return res.status(200).json(dish)
     } catch (e) {
          res.status(500).json({ message: "INTERNAL ERR--02" })
          console.log(e)
     }
}

export async function createDish(req: Request, res: Response) {
     try {
          const { dishName, dishDesc, dishServing, dishMeal } = req.body
          const newDish = new Dish({ name:dishName, desc:dishDesc, serving:dishServing, meal:dishMeal })
          const dish = await newDish.save()
          res.status(200).json({ dish })
     } catch (e) {
          console.log(e)
          res.status(500).json({ message: "createDish crashed--03" })
     }
}

export async function updateDish(req: Request, res: Response) {
     try {
          const { newName, newDesc, newServing, newMeal } = req.body
          const updatedDish = await Dish.findByIdAndUpdate(
               req.params.id,
               { newName, newDesc, newServing, newMeal },
               { new: true } // only update changed data
          )
          if (!updatedDish) return res.status(404).json({ message: "no dish found--04" })
          res.status(200).json(updatedDish)
     } catch (e) {
          console.log(e)
          res.status(500).json({ message: "updateDish crashes--04" })
     }
}

export async function deleteDish(req: Request, res: Response) {
     try {
          const deletedDish = await Dish.findByIdAndDelete(req.params.id)
     } catch (e) {
          console.log(e)
          res.status(500).json({ message: "INTERNAL ERR--05" })
     }
}