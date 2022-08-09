import 'package:fastpad/bloc/custom_bottom_sheet_bloc/custom_bottom_sheet_bloc.dart';

import 'package:fastpad/bloc/notes_bloc/notes_bloc.dart';
import 'package:fastpad/bloc/other_settings_bloc/other_settings_bloc.dart';
import 'package:fastpad/bloc/theme_bloc/theme_bloc.dart';

import 'package:fastpad/pages/note_edit/note_edit.dart';

import 'package:fastpad/pages/note_view/note_view.dart';
import 'package:fastpad/pages/notes/notes.dart';
import 'package:fastpad/pages/notes_setting/change_font.dart';
import 'package:fastpad/pages/notes_setting/change_theme.dart';
import 'package:fastpad/pages/notes_setting/notes_setting.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotesBloc>(create: (BuildContext context) => NotesBloc()),
        BlocProvider<CustomBottomSheetBloc>(
            create: (BuildContext context) => CustomBottomSheetBloc()),
        BlocProvider<OtherSettingsBloc>(
            create: (BuildContext context) => OtherSettingsBloc()),
        BlocProvider<ThemeBloc>(create: (BuildContext context) => ThemeBloc()),
      ],
      child: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeData,
            routes: {
              "/notes": (context) => const NotesWidget(),
              "/notes/note_edit": (context) => const NoteEditPage(),
              "/notes/note_view": (context) => const NoteViewPage(),
              "/notes/setting": (context) => const NotesSettingPage(),
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
