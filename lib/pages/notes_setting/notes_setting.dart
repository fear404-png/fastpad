import 'package:fastpad/bloc/notes_bloc/notes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesSettingPage extends StatelessWidget {
  const NotesSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> notesSettingWidgets = [
      ListTile(
        onTap: () {
          Navigator.pushNamed(context, "/notes/setting/change_theme");
        },
        title: const Text("Выбор темы"),
        leading: const Icon(Icons.theater_comedy),
        trailing: const Icon(Icons.arrow_right),
      ),
      ListTile(
        onTap: () {
          Navigator.pushNamed(context, "/notes/setting/change_font");
        },
        title: const Text("Выбор шрифта"),
        leading: const Icon(Icons.font_download_sharp),
        trailing: const Icon(Icons.arrow_right),
      ),
      BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          return ListTile(
            title: const Text("Изменить размер шрифта"),
            subtitle: Slider(
                value: state.fontSizeMultiplier,
                min: 0.6,
                max: 2.0,
                onChanged: (value) {
                  BlocProvider.of<NotesBloc>(context)
                      .add(ChangeTextSizeEvent(value));
                }),
            leading: const Icon(Icons.font_download_sharp),
          );
        },
      ),
      ListTile(
        onTap: () {
          Navigator.pushNamed(context, "/notes/setting/security");
        },
        title: const Text("Безопасность"),
        leading: const Icon(Icons.lock),
        trailing: const Icon(Icons.arrow_right),
      ),
    ];

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        appBar: AppBar(
          title: const Text("Настройки блокнота"),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return notesSettingWidgets[index];
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: Colors.black,
                height: 2,
              );
            },
            itemCount: notesSettingWidgets.length));
  }
}
