import { sequelize } from "../models/connect.js";
import initModels from "../models/init-models.js";

const conn = initModels(sequelize);

const getResByIdServices = async (res_id) => {
    if (!res_id) return false;
    const restaurant = await conn.restaurants.findOne({
        where: {
            res_id,
        }
    });
    if (restaurant) {
        return restaurant;
    } else {
        return false;
    }
}

const getListLikeByResIdServices = async (res_id) => {
    const listLike = await conn.like_res.findAll({
        where: {
            res_id
        }
    });
    if (listLike) {
        return listLike;
    } else {
        return false;
    }
}

const getListRateByResIdServices = async (res_id) => {
    const listRate = await conn.rate_res.findAll({
        where: {
            res_id
        }
    });
    if (listRate) {
        return listRate;
    } else {
        return false;
    }
}

export {
    getResByIdServices,
    getListLikeByResIdServices,
    getListRateByResIdServices,
}