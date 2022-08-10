import 'package:fastpad/bloc/notes_bloc/notes_bloc.dart';
import 'package:fastpad/theme/app_themes.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        title: const Text("Выбор Темы"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(appThemeName[index]),
              leading: const Icon(Icons.theater_comedy),
              onTap: () {
                BlocProvider.of<NotesBloc>(context)
                    .add(ChangeThemeEvent(index));
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Color.fromARGB(255, 3, 2, 2),
              height: 2,
            );
          },
          itemCount: appThemeData.length),
    );
  }
}
