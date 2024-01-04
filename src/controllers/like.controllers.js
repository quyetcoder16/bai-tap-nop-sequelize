import { getListLikeByRes } from "../services/like.services.js";

const getListLikeByResTaurant = async (req, res) => {
    try {
        const { res_id } = req.params;
        const list_like = await getListLikeByRes(res_id);
        if (list_like) {
            res.status(200).send(list_like);
        } else {
            res.status(404).send("Not Found!");
        }
    } catch (error) {
        console.log("server error : ", error);
    }
}

export {
    getListLikeByResTaurant,
}