import express from 'express'
import { createDish, deleteDish, getAllDishes, getDish, updateDish } from '../controller/dishController'

const router = express.Router()

router.get("/", getAllDishes)

router.get("/:id", getDish)

router.post("/", createDish)

router.put("/:id", updateDish)

router.delete("/:id", deleteDish)

export default router

