import 'package:flutter/material.dart';

class detailsrow extends StatelessWidget {
  final String DetailCaption;
  final String DetailAnswer;
  const detailsrow({
    super.key,
    required this.DetailCaption,
    required this.DetailAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$DetailCaption : ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          DetailAnswer,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
