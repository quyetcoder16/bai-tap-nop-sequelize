import { sequelize } from "../models/connect.js";
import initModels from "../models/init-models.js";
import users from "../models/users.js";

const conn = initModels(sequelize);

const getListLikeByRes = async (res_id) => {
    await conn.like_res.findAll({
        include: [{
            model: users,
            attributes: ['full_name', 'email']
        }]
    }).then(res => {
        console.log(res);
    });
    // if ((!list_like) || (list_like.length == 0)) {
    //     return false;
    // } else {
    //     return list_like;
    // }
}

export {
    getListLikeByRes,
}