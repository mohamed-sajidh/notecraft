const { createNote, getNotes, getNoteById } = require("../helpers/noteHelpers");

const addNote = async (req, res) => {
  try {
    const newNote = await createNote(req.body);
    res.status(200).json({ success: true, newNote });
  } catch (error) {
    res.status(404).json({ success: false, error });
  }
};

const getAllNotes = async (req, res) => {
  try {
    const notes = await getNotes();
    res.status(200).json({ success: true, notes });
  } catch (error) {
    res.status(404).json({ success: false, error });
  }
};

const getSingleNote = async (req, res) => {
  try {
    console.log("--------------------------------------------------------------------");
    
    const note = await getNoteById(req.params.id);
    res.status(200).json({ success: true, note });
  } catch (error) {
    res.status(404).json({ success: false, error });
  }
};

module.exports = {
  addNote,
  getAllNotes,
  getSingleNote,
};
