part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class NoteAdd extends NotesEvent {
  Note note;
  NoteAdd(this.note);
}

class NoteDelete extends NotesEvent {
  int id;
  NoteDelete(this.id);
}

class NoteEdit extends NotesEvent {
  Note note;
  NoteEdit(this.note);
}
