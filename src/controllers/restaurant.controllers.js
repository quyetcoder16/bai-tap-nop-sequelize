import { getListLikeByResIdServices, getListRateByResIdServices, getResByIdServices } from "../services/restaurant.services.js";

const getListLikeByResId = async (req, res) => {
    try {
        const { res_id } = req.params;
        const resExist = await getResByIdServices(res_id);
        if (resExist) {
            const listLike = await getListLikeByResIdServices(res_id);
            if (listLike) {
                res.status(200).send(listLike);
            } else {
                res.status(404).send("Not Found!");
            }
        } else {
            res.status(400).send("res_id not found!");
        }
    } catch (error) {
        res.status(500).send(error);
    }
}


const getListRateByResId = async (req, res) => {
    try {
        const { res_id } = req.params;
        const resExist = await getResByIdServices(res_id);
        if (resExist) {
            const listRate = await getListRateByResIdServices(res_id);
            if (listRate) {
                res.status(200).send(listRate);
            } else {
                res.status(404).send("Not Found!");
            }
        } else {
            res.status(400).send("res_id not found!");
        }
    } catch (error) {
        res.status(500).send(error);
    }
}

export {
    getListLikeByResId,
    getListRateByResId,
}