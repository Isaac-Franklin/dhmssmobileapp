import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottemnavigation_event.dart';
part 'bottemnavigation_state.dart';

class BottemnavigationBloc extends Bloc<BottemnavigationEvent, BottemnavigationState> {
  BottemnavigationBloc() : super(BottemnavigationInitial()) {
    on<BottemnavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
