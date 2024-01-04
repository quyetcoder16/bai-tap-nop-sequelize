import express from "express";
import likeRouters from "./like.routers.js";

const rootRouters = express.Router();

rootRouters.use("/like", likeRouters);

export default rootRouters;