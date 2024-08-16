const express = require("express");
const noteController = require("../controllers/noteController");

const router = express.Router();

router.post('/add-notes', noteController.addNote);

router.get('/get-all-notes', noteController.getAllNotes);

router.get('/get-single-note/:id', noteController.getSingleNote);


module.exports = router;
