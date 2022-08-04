part of 'custom_bottom_sheet_bloc.dart';

@immutable
abstract class CustomBottomSheetState {
  final String title;
  final String subtitle;
  final bool isOpenBottomSheet;

  const CustomBottomSheetState(
      this.title, this.subtitle, this.isOpenBottomSheet);
}

class CustomBottomSheetInitial extends CustomBottomSheetState {
  const CustomBottomSheetInitial(
      super.title, super.subtitle, super.isOpenBottomSheet);
}
