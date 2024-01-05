import { sequelize } from "../models/connect.js";
import initModels from "../models/init-models.js";

const conn = initModels(sequelize);

const getUserByIdServices = async (user_id) => {
    if (!user_id) return false;
    const user = await conn.users.findOne({
        where: {
            user_id
        }
    });
    if (user) {
        return user;
    } else {
        return false;
    }
}

const userLikeServices = async (user_id, res_id) => {
    const checkLike = await conn.like_res.findOne({
        where: {
            user_id,
            res_id
        }
    });
    if (checkLike) {
        return false;
    } else {
        await conn.like_res.create({
            user_id,
            res_id,
            date_like: new Date().getTime()
        })
        return true;
    }
}

const userUnlikeServices = async (user_id, res_id) => {
    const checkLike = await conn.like_res.findOne({
        where: {
            user_id,
            res_id
        }
    });
    if (checkLike) {
        await conn.like_res.destroy({
            where: {
                user_id,
                res_id
            }
        });
        return true;
    } else {
        return false;
    }
}

const getLikeByUserIdServices = async (user_id) => {
    const listLike = await conn.like_res.findAll({
        where: {
            user_id
        }
    });
    if (listLike) {
        return listLike;
    } else {
        return false;
    }
}

const addRateResServices = async (user_id, res_id, amount) => {
    return await conn.rate_res.create({
        user_id,
        res_id,
        amount,
        date_rate: new Date().getTime()
    });
}

const getListRateByIdServices = async (user_id) => {
    const listRate = await conn.rate_res.findAll({
        where: {
            user_id
        }
    });
    if (listRate) {
        return listRate;
    } else {
        return false;
    }
}

const orderServices = async (user_id, food_id, amount, code, arr_sub_id) => {
    return await conn.orders.create({
        user_id,
        food_id,
        amount,
        code,
        arr_sub_id
    });
}


export {
    getUserByIdServices,
    userLikeServices,
    userUnlikeServices,
    getLikeByUserIdServices,
    addRateResServices,
    getListRateByIdServices,
    orderServices,
}