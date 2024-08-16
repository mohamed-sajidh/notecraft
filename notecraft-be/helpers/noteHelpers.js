const noteModel = require("../models/noteModel");
const NoteModel = noteModel();

const createNote = (note) => {
  return new Promise(async (resolve, reject) => {
    const newNote = await NoteModel.create(note);

    if (newNote.dataValues) {
      resolve(newNote.dataValues);
    } else {
      reject({ message: "Note didn't added" });
    }
  });
};

const getNotes = () => {
  return new Promise(async (resolve, reject) => {
    const notes = await NoteModel.findAll();

    if (notes) {
      resolve(notes);
    } else {
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

const updateNote = (noteId, noteData) => {
  return new Promise(async (resolve, reject) => {
    const note = await NoteModel.update(
      { title: noteData.title, content: noteData.content },
      { where: { id: noteId }, returning: true }
    );

    if (note) {
      resolve(note[1]);
    } else {
      reject({ message: "Note with the Provided id is not Updated" });
    }
  });
};

const deleteNote = (noteId) => {
  return new Promise(async (resolve, reject) => {
    const note = await NoteModel.destroy({ where: { id: noteId } });

    if (note) {
      resolve({ message: "Note deleted Successfully " });
    } else {
      reject({ message: "Note with the Provided id is not Deleted" });
    }
  });
};

module.exports = {
  createNote,
  getNotes,
  getNoteById,
  updateNote,
  deleteNote,
};
