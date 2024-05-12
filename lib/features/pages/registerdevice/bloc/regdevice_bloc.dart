import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'regdevice_event.dart';
part 'regdevice_state.dart';

class RegdeviceBloc extends Bloc<RegdeviceEvent, RegdeviceState> {
  RegdeviceBloc() : super(RegdeviceInitial()) {
    on<RegdeviceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
