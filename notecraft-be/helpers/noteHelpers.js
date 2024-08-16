const noteModel = require("../models/noteModel");
const NoteModel = noteModel();

const createNote = (note) => {
  return new Promise(async (resolve, reject) => {
    const newNote = await NoteModel.create(note);
    resolve(newNote.dataValues);
  });
};

const getNotes = () => {
  return new Promise(async (resolve, reject) => {
    const notes = await NoteModel.findAll();
    resolve(notes);

    if (!notes) {
      reject({ message: "No Notes Found" });
    }
  });
};

const getNoteById = (noteId) => {
  return new Promise(async (resolve, reject) => {
    const note = await NoteModel.findOne({ where: { id: noteId } });
    if (note) {
      resolve(note);
    } else {
      reject({ message: "No Note found with the Provided id " });
    }
  });
};

module.exports = {
  createNote,
  getNotes,
  getNoteById,
};
