import 'package:flutter/material.dart';


class HeaderPage extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(context),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  final BuildContext context;

  _HeaderCurvoPainter(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Theme.of(context).primaryColor;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = new Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        0, size.height * 0.8, 30, size.height * 0.8);
    path.lineTo(size.width - 30, size.height * 0.8);
    path.quadraticBezierTo(
        size.width , size.height * 0.8, size.width, size.height);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}