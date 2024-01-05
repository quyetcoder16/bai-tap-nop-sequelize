import { getFoodByFoodIdServices } from "../services/food.services.js";
import { getResByIdServices } from "../services/restaurant.services.js";
import { addRateResServices, getLikeByUserIdServices, getListRateByIdServices, getUserByIdServices, orderServices, userLikeServices, userUnlikeServices } from "../services/user.services.js";

const userLike = async (req, res) => {
    try {
        const { user_id, res_id } = req.body;
        const userExist = await getUserByIdServices(user_id);
        if (!userExist) {
            res.status(404).send("User not found!");
        } else {
            const resExist = await getResByIdServices(res_id);
            if (!resExist) {
                res.status(404).send("Restaurant not found!");
            } else {
                const newLike = await userLikeServices(user_id, res_id);
                if (newLike) {
                    res.status(201).send("like successful!")
                } else {
                    res.status(400).send("user liked!");
                }
            }
        }
    } catch (error) {
        res.status(500).send(error);
    }
}

const userUnlike = async (req, res) => {
    try {
        const { user_id, res_id } = req.body;
        const userExist = await getUserByIdServices(user_id);
        if (!userExist) {
            res.status(404).send("User not found!");
        } else {
            const resExist = await getResByIdServices(res_id);
            if (!resExist) {
                res.status(404).send("Restaurant not found!");
            } else {
                const unlike = await userUnlikeServices(user_id, res_id);
                if (unlike) {
                    res.status(200).send("unlike successful!")
                } else {
                    res.status(400).send("unlike failed!");
                }
            }
        }
    } catch (error) {
        res.status(500).send(error);
    }
}

const getLikeByUserId = async (req, res) => {
    try {
        const { user_id } = req.params;
        const userExist = await getUserByIdServices(user_id);
        if (!userExist) {
            res.status(404).send("User not found!");
        } else {
            const listLike = await getLikeByUserIdServices(user_id);
            if (listLike) {
                res.status(200).send(listLike);
            } else {
                res.status(404).send("Not Found!");
            }
        }
    } catch (error) {
        res.status(500).send(error);
    }
}

const addRateRes = async (req, res) => {
    try {
        const { user_id, res_id, amount } = req.body;
        const userExist = await getUserByIdServices(user_id);
        if (!userExist) {
            res.status(404).send("User not found!");
        } else {
            const resExist = await getResByIdServices(res_id);
            if (!resExist) {
                res.status(404).send("Restaurant not found!");
            } else {
                await addRateResServices(user_id, res_id, amount);
                res.status(201).send("rate restaurant successful!");
            }
        }
    } catch (error) {
        res.status(500).send(error);
    }
}

const getListRateByUserId = async (req, res) => {
    try {
        const { user_id } = req.params;
        console.log(user_id)
        const userExist = await getUserByIdServices(user_id);
        if (!userExist) {
            res.status(404).send("User not found!");
        } else {
            const listRate = await getListRateByIdServices(user_id);
            if (listRate) {
                res.status(200).send(listRate);
            } else {
                res.status(404).send("Not Found!");
            }
        }
    } catch (error) {
        res.status(500).send(error);
    }
}

const order = async (req, res) => {
    try {
        const { user_id, food_id, amount, code, arr_sub_id } = req.body;
        const userExist = await getUserByIdServices(user_id);
        if (!userExist) {
            res.status(404).send("User not found!");
        } else {
            const foodExist = await getFoodByFoodIdServices(food_id);
            if (foodExist) {
                orderServices(user_id, food_id, amount, code, arr_sub_id);
                res.status(200).send("order successful!");
            } else {
                res.status(404).send("Food not found!");
            }
        }
    } catch (error) {
        res.status(500).send(error);
    }
}

export {
    userLike,
    userUnlike,
    getLikeByUserId,
    addRateRes,
    getListRateByUserId,
    order,
}