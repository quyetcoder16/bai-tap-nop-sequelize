import express from "express";
import { addRateRes, getLikeByUserId, getListRateByUserId, order, userLike, userUnlike } from "../controllers/user.controllers.js";

const userRouter = express.Router();

userRouter.post("/like", userLike);
userRouter.post("/unLike", userUnlike);
userRouter.get("/getLikeByUserId/:user_id", getLikeByUserId);
userRouter.post("/addRateRes", addRateRes);
userRouter.get("/getListRateByUserId/:user_id", getListRateByUserId);
userRouter.post("/order", order);

export default userRouter;