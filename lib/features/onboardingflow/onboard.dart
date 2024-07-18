import 'package:dhmsmobileapp/features/onboardingflow/bloc/slider_screen_bloc_bloc.dart';
import 'package:dhmsmobileapp/features/onboardingflow/select_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartSliderSection extends StatelessWidget {
  const StartSliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SliderIntroScreen(),
    );
  }
}

class SliderIntroScreen extends StatelessWidget {
  SliderIntroScreen({super.key});

  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    int indexValue = 0;
    // ignore: prefer_typing_uninitialized_variables
    // var index = 3;
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<SliderScreenBlocBloc, SliderScreenBlocState>(
            builder: (context, state) {
              // int pageIndex = 0;
              return PageView(
                controller: _controller,
                onPageChanged: (index) {
                  indexValue = index;
                  context.read<SliderScreenBlocBloc>().add(GetPageIndex(index));
                  context.read<SliderScreenBlocBloc>().add(PageChanged(index));
                  indexValue;
                },
                children: [
                  SlideScreenProper(
                    spacefromImgtoTop: const SizedBox(
                      height: 100,
                    ),
                    slideImage: Image(
                      width: MediaQuery.of(context).size.width * 0.8,
                      image: const AssetImage('assets/images/step1.png'),
                    ),
                    slideHeader: 'Keep your device running smoothly',
                    slideSubHeader:
                        'Ensure your devices run smoothly with regular check ups',
                  ),
                  SlideScreenProper(
                    spacefromImgtoTop: const SizedBox(
                      height: 30,
                    ),
                    slideImage: Image(
                        width: MediaQuery.of(context).size.width * 0.8,
                        image: const AssetImage('assets/images/step2.png')),
                    slideHeader: 'Get Notified about maintenance updates',
                    slideSubHeader:
                        'Receive timely alerts for all maintenance activities from request initiation  to completion',
                  ),
                  SlideScreenProper(
                    spacefromImgtoTop: const SizedBox(
                      height: 100,
                    ),
                    slideImage: Image(
                        width: MediaQuery.of(context).size.width * 0.8,
                        image: const AssetImage('assets/images/step3.png')),
                    slideHeader: 'Find Technicians nearby',
                    slideSubHeader:
                        'Easily locate and connect with nearby technicians for quick and reliable support',
                  )
                ],
              );
            },
          ),

          // Slider indicator controller starts here
          SliderIndicatorController(controller: _controller),

          // Slider Next Button Starts Here
          SliderNavButton(indexValue: indexValue += 1)
        ],
      ),
    );
  }
}

class SliderNavButton extends StatelessWidget {
  const SliderNavButton({
    super.key,
    required this.indexValue,
  });

  final int indexValue;

  @override
  Widget build(BuildContext context) {
    print(indexValue);
    return BlocBuilder<SliderScreenBlocBloc, SliderScreenBlocState>(
      builder: (context, state) {
        print(ZeroSlidePresent());
        if (state == ZeroSlidePresent() || state == SliderScreenBlocInitial()) {
          return Positioned(
            left: MediaQuery.of(context).size.width * 0.43,
            bottom: 40,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: const Border(
                  top: BorderSide(
                    width: 2,
                    color: Color.fromRGBO(66, 133, 244, 1),
                  ),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromRGBO(66, 133, 244, 1),
                ),
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    // final pageBloc = context.read<GetPageIndex>();
                    // final currentState = pageBloc.state;
                    // // final currentState = pageBloc.state;
                    // if (currentState is GetPageIndex) {
                    //   final newPageIndex =
                    //       (currentState.indexCount + 1).clamp(0, 3 - 1);
                    //   SliderScreenBlocBloc.add(PageChanged(newPageIndex));
                    // }
                    // context
                    //     .read<SliderScreenBlocBloc>()
                    //     .add(GetPageIndex(indexValue));
                    // context
                    //     .read<SliderScreenBlocBloc>()
                    //     .add(PageChanged(indexValue));
                  },
                  icon: const Icon(Icons.arrow_right_alt),
                ),
              ),
            ),
          );
        } else if (state == FirstSlidePresent()) {
          return Positioned(
            left: MediaQuery.of(context).size.width * 0.43,
            bottom: 40,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: const Border(
                  top: BorderSide(
                    width: 2,
                    color: Color.fromRGBO(66, 133, 244, 1),
                  ),
                  right: BorderSide(
                    width: 2,
                    color: Color.fromRGBO(66, 133, 244, 1),
                  ),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromRGBO(66, 133, 244, 1),
                ),
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_right_alt),
                ),
              ),
            ),
          );
        } else if (state == SecondSlidePresent()) {
          return Positioned(
            // left: MediaQuery.of(context).size.width * 0.90,
            bottom: 40,
            child: Container(
                margin: const EdgeInsets.all(10),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromRGBO(66, 133, 244, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SelectUserType();
                          },
                        ),
                      );
                    },
                    label: const Text(
                      "Let's Go",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                )),
          );
        } else {
          return Positioned(
            left: MediaQuery.of(context).size.width * 0.43,
            bottom: 40,
            child: Container(
              padding: const EdgeInsets.all(1),
              child: const Text('Error occured'),
            ),
          );
        }
      },
    );
  }
}

class SliderIndicatorController extends StatelessWidget {
  const SliderIndicatorController({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width * 0.8,
      left: MediaQuery.of(context).size.width * 0.38,
      bottom: 150,
      child: BlocBuilder<SliderScreenBlocBloc, SliderScreenBlocState>(
        builder: (context, state) {
          return SmoothPageIndicator(
            controller: controller,
            count: 3,
            // effect: WormEffect(),
            onDotClicked: (index) => {
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              )
            },
            effect: const ExpandingDotsEffect(
              activeDotColor: Color.fromRGBO(66, 133, 244, 1),
              dotWidth: 15,
              dotHeight: 7,
            ),
          );
        },
      ),
    );
  }
}

class SlideScreenProper extends StatelessWidget {
  const SlideScreenProper({
    super.key,
    required this.slideImage,
    required this.slideHeader,
    required this.slideSubHeader,
    required this.spacefromImgtoTop,
  });

  final Image slideImage;
  final String slideHeader;
  final String slideSubHeader;
  final SizedBox spacefromImgtoTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          spacefromImgtoTop,
          slideImage,
          const SizedBox(
            height: 50,
          ),
          Text(
            textAlign: TextAlign.center,
            slideHeader,
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(3, 0, 10, 1),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.center,
            slideSubHeader,
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(3, 0, 10, 1),
            ),
          ),
        ],
      ),
    );
  }
}
