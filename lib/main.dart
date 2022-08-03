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

  const app = App();
  runApp(app);
}
