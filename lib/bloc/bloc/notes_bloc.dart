import 'package:bloc/bloc.dart';

import 'package:fastpad/theme/app_themes.dart';
import 'package:fastpad/theme/app_fonts.dart';

import 'package:flutter/material.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  static List<Note> notes = [];
  static bool isEdit = true;

  static int currentFont = 1;
  static int currentTheme = 0;

//я устал писать это...
  static ThemeData themeApp = appThemeData[currentTheme].copyWith(
      textTheme: TextTheme(
    headline1: appFonts[currentFont].copyWith(
        fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: appFonts[currentFont].copyWith(
        fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: appFonts[currentFont].copyWith(
      fontSize: 48,
      fontWeight: FontWeight.w400,
    ),
    headline4: appFonts[currentFont].copyWith(
        fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headline5: appFonts[currentFont].copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
    headline6: appFonts[currentFont].copyWith(
        fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: appFonts[currentFont].copyWith(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: appFonts[currentFont].copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: appFonts[currentFont].copyWith(
        fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.5),
    bodyText2: appFonts[currentFont].copyWith(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    button: appFonts[currentFont].copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: appFonts[currentFont].copyWith(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: appFonts[currentFont].copyWith(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  ).apply(bodyColor: appThemeData[currentTheme].colorScheme.onError));

  NotesBloc() : super(NotesInitial(notes, isEdit, themeApp)) {
    on<NotesEvent>((event, emit) {
      if (event is NoteAddEvent) {
        notes.add(event.note);
      } else if (event is NoteDeleteEvent) {
        notes.removeAt(event.id);
      } else if (event is NoteEditEvent) {
        notes[event.note.id] = event.note;
      } else if (event is ChangeThemeEvent) {
        currentTheme = event.idTheme;
        themeApp = appThemeData[currentTheme].copyWith(
            textTheme: TextTheme(
          headline1: appFonts[currentFont].copyWith(
              fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          headline2: appFonts[currentFont].copyWith(
              fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          headline3: appFonts[currentFont].copyWith(
            fontSize: 48,
            fontWeight: FontWeight.w400,
          ),
          headline4: appFonts[currentFont].copyWith(
              fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headline5: appFonts[currentFont].copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
          headline6: appFonts[currentFont].copyWith(
              fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          subtitle1: appFonts[currentFont].copyWith(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          subtitle2: appFonts[currentFont].copyWith(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyText1: appFonts[currentFont].copyWith(
              fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.5),
          bodyText2: appFonts[currentFont].copyWith(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          button: appFonts[currentFont].copyWith(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          caption: appFonts[currentFont].copyWith(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          overline: appFonts[currentFont].copyWith(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ).apply(bodyColor: appThemeData[currentTheme].colorScheme.onError));
      } else if (event is ChangeFontEvent) {
        currentFont = event.idFont;
        themeApp = appThemeData[currentTheme].copyWith(
            textTheme: TextTheme(
          headline1: appFonts[currentFont].copyWith(
              fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          headline2: appFonts[currentFont].copyWith(
              fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          headline3: appFonts[currentFont].copyWith(
            fontSize: 48,
            fontWeight: FontWeight.w400,
          ),
          headline4: appFonts[currentFont].copyWith(
              fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headline5: appFonts[currentFont].copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
          headline6: appFonts[currentFont].copyWith(
              fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          subtitle1: appFonts[currentFont].copyWith(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          subtitle2: appFonts[currentFont].copyWith(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyText1: appFonts[currentFont].copyWith(
              fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.5),
          bodyText2: appFonts[currentFont].copyWith(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          button: appFonts[currentFont].copyWith(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          caption: appFonts[currentFont].copyWith(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          overline: appFonts[currentFont].copyWith(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ).apply(bodyColor: appThemeData[currentTheme].colorScheme.onError));
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
    timeEdit = timeEdit.toString().split(" ")[0] +
        "\n" +
        timeEdit.toString().split(" ")[1];
  }
}
