import 'package:flutter/material.dart';

class HomeSectionView extends StatelessWidget {
  const HomeSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Text('home section view'),
        ],
      ),
    );
  }
}
