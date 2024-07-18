part of 'slider_screen_bloc_bloc.dart';

@immutable
sealed class SliderScreenBlocState extends Equatable {
  const SliderScreenBlocState();

  @override
  List<Object> get props => [];
}

class SliderScreenBlocInitial extends SliderScreenBlocState {}

class PageLoadSuccess extends SliderScreenBlocState {
  final int pageIndex;

  const PageLoadSuccess(this.pageIndex);

  @override
  List<Object> get props => [pageIndex];
}

class ZeroSlidePresent extends SliderScreenBlocState {}

class FirstSlidePresent extends SliderScreenBlocState {}

class SecondSlidePresent extends SliderScreenBlocState {}
