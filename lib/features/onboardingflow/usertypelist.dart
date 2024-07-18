import 'package:flutter/material.dart';

class UserTypeSegment extends StatelessWidget {
  const UserTypeSegment({
    super.key,
    required this.userImage,
    required this.userSegmentTitle,
    required this.userSegmentSubtitle,
  });
  final Image userImage;
  final String userSegmentTitle;
  final String userSegmentSubtitle;
  // final VoidCallback onUserSelectionTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          userImage,
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(1),
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userSegmentTitle,
                    style: const TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    userSegmentSubtitle,
                    softWrap: true,
                    maxLines: 3,
                    style: const TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
