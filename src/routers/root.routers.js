import express from "express";
import userRouter from "./user.routers.js";
import restaurantRouters from "./restaurant.routers.js";

const rootRouters = express.Router();

rootRouters.use("/user", userRouter);
rootRouters.use("/restaurant", restaurantRouters);

export default rootRouters;