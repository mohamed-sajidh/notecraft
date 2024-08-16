const express = require("express");
const noteController = require("../controllers/noteController");

const router = express.Router();

router.post('/add-notes', noteController.addNote);

router.get('/get-all-notes', noteController.getAllNotes);

router.get('/get-single-note/:id', noteController.getSingleNote);

router.post('/update-note/:id', noteController.updateNoteById);

router.post('/delete-note/:id', noteController.deleteNoteById);


module.exports = router;
