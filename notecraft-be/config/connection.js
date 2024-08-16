const { Sequelize } = require("sequelize");

const sequelize = new Sequelize({
  database: "notes",
  username: "postgres",
  password: "12345",
  host: "localhost",
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
