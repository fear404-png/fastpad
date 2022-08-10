import 'package:fastpad/bloc/custom_bottom_sheet_bloc/custom_bottom_sheet_bloc.dart';

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
    return BlocBuilder<CustomBottomSheetBloc, CustomBottomSheetState>(
      builder: (context, state) {
        return AnimatedContainer(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              border: Border(
                  top: BorderSide(
                      width: 1, color: Theme.of(context).colorScheme.primary))),
          height: state.isOpenBottomSheet
              ? MediaQuery.of(context).size.height / 4
              : 0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: SingleChildScrollView(
            child: ListTile(
              title: TextField(
                onChanged: (value) =>
                    BlocProvider.of<CustomBottomSheetBloc>(context)
                        .add(TitleChangesEvent(title.text)),
                controller: title,
                maxLines: 1,
                decoration: const InputDecoration(hintText: "Заголовок"),
              ),
              subtitle: TextField(
                onChanged: (value) =>
                    BlocProvider.of<CustomBottomSheetBloc>(context)
                        .add(SubtitleChangesEvent(subtitle.text)),
                controller: subtitle,
                maxLines: null,
                decoration: const InputDecoration(
                    hintText: "Текст", border: InputBorder.none),
              ),
              style: ListTileStyle.list,
            ),
          ),
        );
      },
    );
  }
}
