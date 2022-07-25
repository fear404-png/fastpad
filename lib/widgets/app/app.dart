import 'package:fastpad/bloc/bloc/notes_bloc.dart';
import 'package:fastpad/widgets/notes/note/note_edit.dart';
import 'package:fastpad/widgets/notes/note/note_view.dart';
import 'package:fastpad/widgets/notes/notes.dart';
import 'package:fastpad/widgets/notes/notes_setting/notes_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesBloc(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.dark().copyWith(
            secondary: Colors.redAccent,
            primary: Colors.redAccent,
          ),
        ),
        routes: {
          "/notes": (context) => const NotesWidget(),
          "/notes/note_edit": (context) => const NoteEditWidget(),
          "/notes/note_view": (context) => const NoteViewWidget(),
          "/notes/setting": (context) => const NotesSettingWidget(),
        },
        initialRoute: "/notes",
      ),
    );
  }
}
