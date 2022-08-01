part of 'notes_bloc.dart';

@immutable
abstract class NotesState {
  final List<NoteModel> notes;

  final ThemeData themeData;

  final double fontSizeMultiplier;

  final String password;

  final bool isLogin;

  const NotesState(this.notes, this.themeData, this.fontSizeMultiplier,
      this.password, this.isLogin);
}

class NotesInitial extends NotesState {
  const NotesInitial(super.notes, super.themeData, super.fontSizeMultiplier,
      super.password, super.isLogin);
}
