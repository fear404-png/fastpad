import 'package:fastpad/app/app.dart';

import 'package:fastpad/hive/note_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(NoteModelAdapter());
  }
  await Hive.openBox<dynamic>("login");

  await Hive.openBox<dynamic>("settings");

  await Hive.openBox<NoteModel>("notes");

  if (Hive.box("login").isEmpty) {
    Hive.box("login").put(0, "");
    Hive.box("login").put(1, "");
  }

  if (Hive.box("settings").isEmpty) {
    Hive.box("settings").put(0, 6);
    Hive.box("settings").put(1, 0);
    Hive.box("settings").put(2, 1);
  }

  const app = App();
  runApp(app);
}
