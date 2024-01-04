import express from "express";
import { getListLikeByResTaurant } from "../controllers/like.controllers.js";

const likeRouters = express.Router();

likeRouters.get("/get-list-like-by-restaurant/:res_id",getListLikeByResTaurant);

export default likeRouters;