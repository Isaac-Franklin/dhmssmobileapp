import 'package:flutter/material.dart';

class DeviceInventorySectionView extends StatelessWidget {
  const DeviceInventorySectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Column(
          children: [Text('Device Inventory Page')],
        ),
      ),
    );
  }
}
