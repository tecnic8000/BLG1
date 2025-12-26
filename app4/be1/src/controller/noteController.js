import Note from '../model/Note.js'

export async function getAllNotes(_, res) {
     try {
          const notes = await Note.find().sort({createdAt: 1}) // latest first
          res.status(200).json(notes)
          console.log("ok")
     } catch (e) {
          console.log(e)
          res.status(500).json({ message: "INTERNAL ERR--01" })
     }
}

export async function getNote(req, res) {
     try {
          const readNote = await Note.findById(req.params.id)
          if (!readNote) return res.status(404).json({ message: "no note found" })
          return res.status(200).json(readNote)
     } catch (e) {
          console.log(e)
     }
}

export async function createNote(req, res) {
     try {
          const { submitTitle, submitContent } = req.body
          const newNote = new Note({ title: submitTitle, content: submitContent })
          const savedNote = await newNote.save()
          res.status(200).json({ savedNote })
          // console.log(title, content)
     } catch (e) {
          console.log(e)
          res.status(500).json({ message: "ERRcreateNote failed --01" })
     }
}

export async function updateNote(req, res) {
     try {
          const { newTitle, newContent } = req.body
          const updateNote = await Note.findByIdAndUpdate(
               req.params.id,
               { title: newTitle, content: newContent },
               { new: true })
          if (!updateNote) return res.status(404).json({ message: "no note found" })
          res.status(200).json(updateNote)
     } catch (e) {
          console.log(e)
          res.status(500).json({ message: "ERRupdateNote failed --01" })
     }
}

export async function deleteNote(req, res) {
     try {
          const deleteNote = await Note.findByIdAndDelete(req.params.id)
          if (!deleteNote) return res.status(404).json({ message: "no note found" })
          res.status(200).json({ message: "post deleted" })
     } catch (e) {
          console.log(e)
          res.status(500).json({ message: "ERRdeleteNote failed --01" })
     }
}