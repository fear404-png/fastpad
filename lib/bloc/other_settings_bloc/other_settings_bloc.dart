import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'other_settings_event.dart';
part 'other_settings_state.dart';

class OtherSettingsBloc extends Bloc<OtherSettingsEvent, OtherSettingsState> {
  OtherSettingsBloc() : super(OtherSettingsInitial()) {
    on<OtherSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
