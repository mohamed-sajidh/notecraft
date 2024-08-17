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
      month: {
        type: DataTypes.STRING,
        allowNull: false,
        defaultValue: () => {
          const months = [
            "jan",
            "feb",
            "mar",
            "apr",
            "may",
            "jun",
            "jul",
            "aug",
            "sep",
            "oct",
            "nov",
            "dec",
          ];
          const now = new Date();
          return months[now.getMonth()];
        },
      },
      date: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: () => { 
          const now = new Date();
          return now.getDate();
        },
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
