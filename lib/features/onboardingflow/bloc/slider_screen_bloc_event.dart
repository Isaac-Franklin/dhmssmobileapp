part of 'slider_screen_bloc_bloc.dart';

@immutable
sealed class SliderScreenBlocEvent extends Equatable {
  const SliderScreenBlocEvent();

  @override
  List<Object> get props => [];
}

class PageChanged extends SliderScreenBlocEvent {
  final int pageIndex;

  const PageChanged(this.pageIndex);

  @override
  List<Object> get props => [pageIndex];
}

class GetPageIndex extends SliderScreenBlocEvent {
  const GetPageIndex(
    this.indexCount,
  );
  final int indexCount;
}

// class ZeroSlidePresent extends SliderScreenBlocEvent {}

// class FirstSlidePresent extends SliderScreenBlocEvent {}

// class SecondSlidePresent extends SliderScreenBlocEvent {}
