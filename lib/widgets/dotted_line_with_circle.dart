import 'package:flutter/material.dart';

class DottedLineWithCircle extends StatelessWidget {
  final List<Map<String, dynamic>> activities;
  final Widget child;

  const DottedLineWithCircle({required this.activities, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          left: 30,
          child: Column(
            children: [
              CircleAvatar(
                radius: 6,
                backgroundColor: Color(0xFFFFF09C),
              ),
              Container(
                height: activities.length * 140.0,
                child: CustomPaint(
                  size: Size(2, activities.length * 140.0),
                  painter: DashPainter(),
                ),
              ),
            ],
          ),
        ),
        child,
      ],
    );
  }
}

class DashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 2;

    const dashWidth = 4;
    const dashSpace = 4;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
