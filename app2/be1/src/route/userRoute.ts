import express from 'express'
import { getAllUsers } from '../controller/userController'

const router = express.Router()

router.get('/admin', getAllUsers)

export default router