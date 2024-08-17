const express = require("express");
const noteRoutes = require("./routes/noteRoutes");
const app = express();
const { connect } = require("./config/connection");
const dotenv = require("dotenv");
var cors = require('cors');

dotenv.config();

app.use(express.json());
app.use(express.urlencoded());
app.use(cors());

connect();

app.use("/api/", noteRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`server running on port: ${PORT}`);
});
