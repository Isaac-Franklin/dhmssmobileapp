import 'package:flutter/material.dart';

class MaintenanceSectionView extends StatelessWidget {
  const MaintenanceSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Column(
          children: [Text('Maintence Page')],
        ),
      ),
    );
  }
}
