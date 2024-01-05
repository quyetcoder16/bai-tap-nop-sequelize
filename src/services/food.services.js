import { sequelize } from "../models/connect.js";
import initModels from "../models/init-models.js";

const conn = initModels(sequelize);


const getFoodByFoodIdServices = async (food_id) => {
    if (!food_id) return false;
    const food = await conn.food.findOne({
        where: {
            food_id
        }
    });
    if (food) {
        return food;
    } else {
        return false;
    }
}

export {
    getFoodByFoodIdServices,
}