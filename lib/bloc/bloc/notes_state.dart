part of 'notes_bloc.dart';

@immutable
abstract class NotesState {
  final List<Note> notes;

  final ThemeData themeData;

  final double fontSizeMultiplier;

  NotesState(this.notes, this.themeData, this.fontSizeMultiplier);
}

class NotesInitial extends NotesState {
  NotesInitial(super.notesState, super.themeData, super.fontSizeMultiplier);
}
