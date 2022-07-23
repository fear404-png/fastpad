import 'package:fastpad/widgets/notes/note/note.dart';
import 'package:fastpad/widgets/notes/notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.dark().copyWith(
          secondary: Colors.redAccent,
        ),
      ),
      routes: {
        "/notes": (context) => const NotesWidget(),
        "/notes/note": (context) => const NoteWidget()
      },
      initialRoute: "/notes",
    );
  }
}
