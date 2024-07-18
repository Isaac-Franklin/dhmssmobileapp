// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import 'page_bloc.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Smooth Page Indicator with BLoC Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BlocProvider(
//         create: (context) => PageBloc(),
//         child: IntroductionScreen(),
//       ),
//     );
//   }
// }

// class IntroductionScreen extends StatelessWidget {
//   final PageController _controller = PageController();
//   final List<Widget> _pages = [
//     PageWidget(
//       title: 'Welcome to MyApp',
//       description: 'This is a simple introduction slider.',
//       image: 'assets/image1.png', // Add your image asset here
//     ),
//     PageWidget(
//       title: 'Easy to Use',
//       description: 'This slider is easy to integrate and use in your app.',
//       image: 'assets/image2.png', // Add your image asset here
//     ),
//     PageWidget(
//       title: 'Get Started',
//       description: 'Let\'s get started with our app!',
//       image: 'assets/image3.png', // Add your image asset here
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: BlocBuilder<PageBloc, PageState>(
//               builder: (context, state) {
//                 return PageView.builder(
//                   controller: _controller,
//                   itemCount: _pages.length,
//                   onPageChanged: (index) {
//                     context.read<PageBloc>().add(PageChanged(index));
//                   },
//                   itemBuilder: (context, index) {
//                     return _pages[index];
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: BlocBuilder<PageBloc, PageState>(
//               builder: (context, state) {
//                 int pageIndex = 0;
//                 if (state is PageLoadSuccess) {
//                   pageIndex = state.pageIndex;
//                 }
//                 return SmoothPageIndicator(
//                   controller: _controller,  // PageController
//                   count: _pages.length,
//                   effect: WormEffect(),  // Customizable effect
//                   onDotClicked: (index) {
//                     _controller.animateToPage(
//                       index,
//                       duration: Duration(milliseconds: 500),
//                       curve: Curves.easeInOut,
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PageWidget extends StatelessWidget {
//   final String title;
//   final String description;
//   final String image;

//   const PageWidget({
//     required this.title,
//     required this.description,
//     required this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(image),
//           SizedBox(height: 20),
//           Text(
//             title,
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           Text(
//             description,
//             style: TextStyle(fontSize: 16),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }
