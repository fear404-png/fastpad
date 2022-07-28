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

class ChangeThemeEvent extends NotesEvent {
  final int idTheme;

  ChangeThemeEvent(this.idTheme);
}

class ChangeFontEvent extends NotesEvent {
  final int idFont;

  ChangeFontEvent(this.idFont);
}

class ChangeTextSizeEvent extends NotesEvent {
  final double size;

  ChangeTextSizeEvent(this.size);
}

class CheckPasswordEvent extends NotesEvent {
  final String password;

  CheckPasswordEvent(this.password);
}
