import 'package:fastpad/bloc/bloc/notes_bloc.dart';
import 'package:fastpad/theme/app_fonts.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeFontWidget extends StatelessWidget {
  const ChangeFontWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Выбор шрифта"),
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
          separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
                height: 2,
              ),
          itemCount: appFonts.length),
    );
  }
}
