part of 'custom_bottom_sheet_bloc.dart';

@immutable
abstract class CustomBottomSheetEvent {}

class TitleChangesEvent extends CustomBottomSheetEvent {
  final String title;

  TitleChangesEvent(this.title);
}

class SubtitleChangesEvent extends CustomBottomSheetEvent {
  final String subtitle;

  SubtitleChangesEvent(this.subtitle);
}

class OpenEvent extends CustomBottomSheetEvent {
  final bool isOpen;

  OpenEvent(this.isOpen);
}

class FullScreenEvent extends CustomBottomSheetEvent {
  final bool isFullscreen;

  FullScreenEvent(this.isFullscreen);
}

class ClearEvent extends CustomBottomSheetEvent {}
