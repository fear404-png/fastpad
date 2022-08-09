part of 'notes_bloc.dart';

@immutable
abstract class NotesState {
  final List<NoteModel> notes;

  final ThemeData themeData;

  final double fontSizeMultiplier;





  const NotesState(
      this.notes,
      this.themeData,
      this.fontSizeMultiplier,

     );
}

class NotesInitial extends NotesState {
  const NotesInitial(
      super.notes,
      super.themeData,
      super.fontSizeMultiplier,
  
      );
}
