part of 'notes_bloc.dart';

@immutable
abstract class NotesState {
  final List<Note> notes;

  final ThemeData themeData;

  final double fontSizeMultiplier;

  final String password;

  final bool isLogin;

  NotesState(this.notes, this.themeData, this.fontSizeMultiplier, this.password,
      this.isLogin);
}

class NotesInitial extends NotesState {
  NotesInitial(super.notes, super.themeData, super.fontSizeMultiplier,
      super.password, super.isLogin);
}
