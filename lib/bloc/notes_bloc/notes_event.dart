part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class NoteAddEvent extends NotesEvent {
  final NoteModel note;
  NoteAddEvent(this.note);
}

class NoteDeleteEvent extends NotesEvent {
  final int id;
  NoteDeleteEvent(this.id);
}

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

class ChangeSecureParam extends NotesEvent {
  final bool isSecure;

  ChangeSecureParam(this.isSecure);
}

class FuckItEvent extends NotesEvent {
  final bool fuckIt;

  FuckItEvent(this.fuckIt);
}

class ChangePassword extends NotesEvent {
  final String password;
  final String helpText;

  ChangePassword(this.password, this.helpText);
}

class PasswordRegistrationError extends NotesEvent {
  final String erorrText;

  PasswordRegistrationError(this.erorrText);
}

class PasswordRegistrationSuccessful extends NotesEvent {
  final String password;
  final String helpText;

  PasswordRegistrationSuccessful(this.password, this.helpText);
}

class ChangeStateBottomSheet extends NotesEvent {
  final bool isOpen;

  ChangeStateBottomSheet(this.isOpen);
}
