const { sequelize } = require("../config/connection");
const { DataTypes } = require("sequelize");

const noteModel = () => {
  const note = sequelize.define(
    "note",
    {
      id: {
        type: DataTypes.STRING,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
        allowNull: false,
      },
      title: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      content: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      createdAt: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW,
      },
    },
    {
      timestamps: true,
      tableName: "notes",
    }
  );
  sequelize.sync();
  return note;
};

module.exports = noteModel;