part of 'notes_bloc.dart';

@immutable
abstract class NotesState {
  List<Note> notesState;
  bool isEdit;

  NotesState(this.notesState, this.isEdit);
}

class NotesInitial extends NotesState {
  NotesInitial(super.notesState, super.isEdit);
}
