import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  static List<Note> notes = [];

  NotesBloc() : super(NotesInitial(notes)) {
    on<NotesEvent>((event, emit) {
      if (event is NoteAdd) {
        notes.add(event.note);
      }
      if (event is NoteDelete) {
        notes.remove(event.id);
      }
      if (event is NoteEdit) {
        notes[event.note.id] = event.note;
      }
      emit(NotesInitial(notes));
    });
  }
}

class Note {
  String title;
  String subtitle;
  String? timeEdit;

  int id;

  bool isLock = false;
  bool isEdit = true;

  Note(this.title, this.subtitle, this.id) {
    DateTime now = DateTime.now();
    timeEdit = DateTime(
      now.day,
      now.month,
      now.year,
    ).toString();
  }
}
