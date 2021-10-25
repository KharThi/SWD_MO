import 'dart:ui';

import 'package:flutter/material.dart';

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}

class BackgroundPainter extends CustomPainter {
  final Paint linePaint;
  final Paint bluePaint;
  final Paint greyPaint;
  final Paint orangePaint;

  BackgroundPainter()
      : bluePaint = Paint()
    ..color = Colors.lightBlue.shade300
    ..style = PaintingStyle.fill,
        greyPaint = Paint()
          ..color = Color(900)
          ..style = PaintingStyle.fill,
        orangePaint = Paint()
          ..color = Colors.orange.shade400
          ..style = PaintingStyle.fill,
        linePaint = Paint()
          ..color = Color(400)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4;

  void _addPointsToPath(Path path, List<Point> points) {
    if (points.length < 3) {
      throw UnsupportedError('Need three or more points to create a path.');
    }

    for (var i = 0; i < points.length - 2; i++) {
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }

    // connect the last two points
    path.quadraticBezierTo(
      points[points.length - 2].x,
      points[points.length - 2].y,
      points[points.length - 1].x,
      points[points.length - 1].y,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintBlue(size, canvas);
    paintDark(size, canvas);
    paintOrange(size, canvas);
  }

  void paintBlue(Size size, Canvas canvas) {
    final path = Path();

    path.moveTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    _addPointsToPath(path, [
      Point(
        0.5,
        0.5,
      ),
      Point(
        1,
        1,
      ),
      Point(
        size.width,
        0.2,
      ),
    ]);
    canvas.drawPath(path, bluePaint);
  }

  void paintDark(Size size, Canvas canvas) {
    final path = Path();

    path.moveTo(size.width, 300);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, 0);
    _addPointsToPath(
      path,
      [
        Point(
          size.width / 2,
          0.5,
        ),
        Point(
          size.width * 3.5 / 5,
          0.5,
        ),
        Point(size.width, 4),
      ],
    );

    canvas.drawPath(path, greyPaint);
  }

  void paintOrange(Size size, Canvas canvas) {
    final path = Path();

    path.moveTo(size.width * 3 / 4, 0);
    path.lineTo(0, 0);
    path.lineTo(0, 0.5);

    _addPointsToPath(path, [
      Point(size.width / 6, 0.5),
      Point(size.width / 3, 0.5),
      Point(size.width / 3 * 2, 0.5),
      Point(size.width * 3 / 4, 0),
    ]);

    canvas.drawPath(path, orangePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}