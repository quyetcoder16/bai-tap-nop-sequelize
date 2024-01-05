import express from "express";
import { getListLikeByResId, getListRateByResId } from "../controllers/restaurant.controllers.js";

const restaurantRouters = express.Router();

restaurantRouters.get("/getListLikeByResId/:res_id", getListLikeByResId);
restaurantRouters.get("/getListRateByResId/:res_id", getListRateByResId);

export default restaurantRouters;