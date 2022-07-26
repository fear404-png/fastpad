part of 'notes_bloc.dart';

@immutable
abstract class NotesState {
  final List<Note> notes;
  final bool isEdit;
  final themeData;

  NotesState(this.notes, this.isEdit, this.themeData);
}

class NotesInitial extends NotesState {
  NotesInitial(super.notesState, super.isEdit, super.themeData);
}
