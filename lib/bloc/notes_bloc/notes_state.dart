part of 'notes_bloc.dart';

@immutable
abstract class NotesState {
  final List<NoteModel> notes;

  final ThemeData themeData;

  final double fontSizeMultiplier;

  final String password;

  final String erorrTextPasswordRegistration;

  final String helpText;

  final bool isLogin;

  final bool isSecure;

  final bool fuckIt;

  final bool isErrorInPasswordRegistration;



  const NotesState(
      this.notes,
      this.themeData,
      this.fontSizeMultiplier,
      this.password,
      this.isLogin,
      this.isSecure,
      this.fuckIt,
      this.helpText,
      this.erorrTextPasswordRegistration,
      this.isErrorInPasswordRegistration,
     );
}

class NotesInitial extends NotesState {
  const NotesInitial(
      super.notes,
      super.themeData,
      super.fontSizeMultiplier,
      super.password,
      super.isLogin,
      super.isSecure,
      super.fuckIt,
      super.helpText,
      super.erorrTextPasswordRegistration,
      super.isErrorInPasswordRegistration,
      );
}
