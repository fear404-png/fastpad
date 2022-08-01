part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

// ignore: must_be_immutable
class NoteAddEvent extends NotesEvent {
  NoteModel note;
  NoteAddEvent(this.note);
}

// ignore: must_be_immutable
class NoteDeleteEvent extends NotesEvent {
  final int id;
  NoteDeleteEvent(this.id);
}

// ignore: must_be_immutable
class NoteEditEvent extends NotesEvent {
  final NoteModel note;
  final int id;
  NoteEditEvent(this.note, this.id);
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
