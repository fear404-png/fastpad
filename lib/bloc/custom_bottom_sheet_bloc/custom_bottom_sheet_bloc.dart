import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'custom_bottom_sheet_event.dart';
part 'custom_bottom_sheet_state.dart';

class CustomBottomSheetBloc
    extends Bloc<CustomBottomSheetEvent, CustomBottomSheetState> {
  static String title = "";
  static String subtitle = "";
  static bool isOpen = false;

  CustomBottomSheetBloc()
      : super(CustomBottomSheetInitial(title, subtitle, isOpen)) {
    on<CustomBottomSheetEvent>((event, emit) {
      if (event is TitleChangesEvent) {
        title = event.title;
      } else if (event is SubtitleChangesEvent) {
        subtitle = event.subtitle;
      } else if (event is OpenEvent) {
        isOpen = event.isOpen;
      } else if (event is ClearEvent) {
        title = "";
        subtitle = "";
      }
      emit(CustomBottomSheetInitial(title, subtitle, isOpen));
    });
  }
}
