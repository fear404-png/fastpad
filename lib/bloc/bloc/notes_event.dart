part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class NoteAddEvent extends NotesEvent {
  Note note;
  NoteAddEvent(this.note);
}

class NoteDeleteEvent extends NotesEvent {
  int id;
  NoteDeleteEvent(this.id);
}

class NoteEditEvent extends NotesEvent {
  Note note;
  NoteEditEvent(this.note);
}
