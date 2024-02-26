const express = require("express");
const cors = require("cors");

const app = express();
const port = 8009;

app.use(cors());

app.use(express.static("public"));

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});