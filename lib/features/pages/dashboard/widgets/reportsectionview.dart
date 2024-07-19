import 'package:flutter/material.dart';

class ReportSectionView extends StatelessWidget {
  const ReportSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text('Report Page'),
          ],
        ),
      ),
    );
  }
}
