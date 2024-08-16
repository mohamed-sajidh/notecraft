const express = require("express");
const noteRoutes = require("./routes/noteRoutes");
const app = express();
const { connect } = require("./config/connection");
const dotenv = require("dotenv");

dotenv.config();

app.use(express.json());
app.use(express.urlencoded());

connect();

app.use("/api/", noteRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`server running on port: ${PORT}`);
});
