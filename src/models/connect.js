import { Sequelize } from "sequelize";
import { DB_SQL } from "../configs/db.config.js";

const sequelize = new Sequelize(DB_SQL.DATABASE, DB_SQL.USER, DB_SQL.PASSWORD, {
    host: DB_SQL.HOST,
    port: DB_SQL.PORT,
    dialect: DB_SQL.DIALECT
});

const checkConnected = async () => {
    try {
        await sequelize.authenticate();
        console.log("connected DB success!");
    } catch (error) {
        console.log(error);
    }
}

checkConnected();

export {
    sequelize,
}