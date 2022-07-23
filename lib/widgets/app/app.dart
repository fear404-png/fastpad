import 'package:fastpad/widgets/notes/notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/notes": (context) => const NotesWidget()},
      initialRoute: "/notes",
    );
  }
}
