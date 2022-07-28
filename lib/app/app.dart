import 'package:fastpad/bloc/bloc/notes_bloc.dart';
import 'package:fastpad/pages/notes/note/note_edit.dart';
import 'package:fastpad/pages/notes/note/note_view.dart';
import 'package:fastpad/pages/notes/notes.dart';
import 'package:fastpad/pages/notes/notes_setting/change_font.dart';
import 'package:fastpad/pages/notes/notes_setting/change_theme.dart';
import 'package:fastpad/pages/notes/notes_setting/notes_setting.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesBloc(),
      child: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeData,
            routes: {
              "/notes": (context) => const NotesWidget(),
              "/notes/note_edit": (context) => const NoteEditWidget(),
              "/notes/note_view": (context) => const NoteViewWidget(),
              "/notes/setting": (context) => const NotesSettingWidget(),
              "/notes/setting/change_theme": (context) =>
                  const ChangeThemeWidget(),
              "/notes/setting/change_font": (context) =>
                  const ChangeFontWidget(),
            },
            initialRoute: "/notes",
          );
        },
      ),
    );
  }
}
