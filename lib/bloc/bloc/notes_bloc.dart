import 'package:bloc/bloc.dart';
import 'package:fastpad/widgets/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  static List<Note> notes = [];
  static bool isEdit = true;
  static ThemeData themeApp = appThemeData[0];

  NotesBloc() : super(NotesInitial(notes, isEdit, themeApp)) {
    on<NotesEvent>((event, emit) {
      if (event is NoteAddEvent) {
        notes.add(event.note);
      } else if (event is NoteDeleteEvent) {
        notes.removeAt(event.id);
      } else if (event is NoteEditEvent) {
        notes[event.note.id] = event.note;
      } else if (event is ChangeThemeEvent) {
        themeApp = appThemeData[event.idTheme];
      }
      emit(NotesInitial(notes, isEdit, themeApp));
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
    timeEdit = DateTime.now().toString().split(".")[0];
  }
}
