import 'package:fastpad/bloc/notes_bloc/notes_bloc.dart';
import 'package:fastpad/pages/components/custom_separator.dart';
import 'package:fastpad/theme/app_fonts.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeFontWidget extends StatelessWidget {
  const ChangeFontWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        title: const Text("Выбор шрифта"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text(
                  appFonts[index].fontFamily.toString().split("_")[0],
                  style: appFonts[index],
                ),
                leading: const Icon(Icons.theater_comedy),
                onTap: () => BlocProvider.of<NotesBloc>(context)
                    .add(ChangeFontEvent(index)),
              ),
          separatorBuilder: (context, index) => const CustomSeparator(),
          itemCount: appFonts.length),
    );
  }
}
