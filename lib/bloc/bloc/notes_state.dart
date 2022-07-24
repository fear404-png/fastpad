part of 'notes_bloc.dart';

@immutable
abstract class NotesState {
  List<Note> notesState;
  NotesState(this.notesState);
}

class NotesInitial extends NotesState {
  NotesInitial(super.notes);
}
