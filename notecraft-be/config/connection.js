const { Sequelize } = require("sequelize");

const sequelize = new Sequelize({
  database: process.env.DB_NAME || "notes",
  username: process.env.DB_USER || "postgres",
  password: process.env.DB_PASSWORD || "12345",
  host: process.env.DB_HOST || "localhost",
  dialect: "postgres",
});

async function connect() {
  try {
    await sequelize.authenticate();
    console.log("Connection has been established successfully.");
  } catch (error) {
    console.error("Unable to connect to the database:", error);
  }
}

module.exports = {
  connect,
  sequelize,
};
