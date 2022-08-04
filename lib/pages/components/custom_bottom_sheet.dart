
import 'package:fastpad/bloc/notes_bloc/notes_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomSheet extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();

  CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return AnimatedContainer(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              border: Border(
                  top: BorderSide(
                      width: 1, color: Theme.of(context).colorScheme.primary))),
          height: state.isOpenBottomSheet
              ? MediaQuery.of(context).size.height / 2
              : 0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: ListTile(
            title: TextField(
              controller: title,
              maxLines: 1,
              decoration: const InputDecoration(hintText: "Заголовок"),
            ),
            subtitle: TextField(
              controller: subtitle,
              maxLines: null,
              decoration: const InputDecoration(
                  hintText: "Текст", border: InputBorder.none),
            ),
            style: ListTileStyle.list,
          ),
        );
      },
    );
  }
}
