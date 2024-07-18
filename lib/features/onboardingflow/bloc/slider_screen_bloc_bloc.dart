// ignore_for_file: void_checks

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'slider_screen_bloc_event.dart';
part 'slider_screen_bloc_state.dart';

class SliderScreenBlocBloc
    extends Bloc<SliderScreenBlocEvent, SliderScreenBlocState> {
  SliderScreenBlocBloc() : super(SliderScreenBlocInitial()) {
    // emit(ZeroSlidePresent() as SliderScreenBlocState);
    on<PageChanged>(_pageChanged);
    on<GetPageIndex>(_getPageIndex);
    // on<GetPageIndex> ;
    // @override
    // Stream<SliderScreenBlocBloc> mapEventToState(GetPageIndex event) async* {
    //   if (event is GetPageIndex) {
    //     yield* _getPageIndex();
    //   }
    // }
  }

  FutureOr<void> _pageChanged(
      PageChanged event, Emitter<SliderScreenBlocState> emit) async {
    PageLoadSuccess(event.pageIndex);
  }

  FutureOr<void> _getPageIndex(
      GetPageIndex event, Emitter<SliderScreenBlocState> emit) async {
    if (event.indexCount == 0) {
      emit(ZeroSlidePresent());
    } else if (event.indexCount == 1) {
      emit(FirstSlidePresent());
    } else if (event.indexCount == 2) {
      emit(SecondSlidePresent());
    } else {
      emit(ZeroSlidePresent());
    }
  }
}

// SecondSlidePresent