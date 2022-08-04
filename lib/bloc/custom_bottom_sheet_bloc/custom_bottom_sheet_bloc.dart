import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'custom_bottom_sheet_event.dart';
part 'custom_bottom_sheet_state.dart';

class CustomBottomSheetBloc
    extends Bloc<CustomBottomSheetEvent, CustomBottomSheetState> {
  CustomBottomSheetBloc() : super(CustomBottomSheetInitial()) {
    on<CustomBottomSheetEvent>((event, emit) {});
  }
}
