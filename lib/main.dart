import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Add state variables for the sliders
  double _optm = 0.3;
  double _ratio = 0.7;
  double _fullness = 0.4;

  void play() {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text("My WaterMellon Juice"),
          centerTitle: true,
          backgroundColor: const Color(0xFFF5E6CA),
        ),
        backgroundColor: const Color(0xFFF5E6CA),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.2,
                    height: size.height * 0.2,
                    child: CustomPaint(
                      painter: GlassCustomPainter(
                        optm: _optm,
                        ratio: _ratio,
                        fullness: _fullness,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: size.width * 0.2,
                    height: size.height * 0.2,
                    child: CustomPaint(
                      painter: GlassCustomPainter(
                        optm: _optm,
                        ratio: _ratio,
                        fullness: _fullness,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              // Add sliders with labels
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text('Optm: ${_optm.toStringAsFixed(2)}'),
                    Slider(
                      value: _optm,
                      min: 0.1,
                      max: 1.0,
                      onChanged: (value) {
                        setState(() {
                          _optm = value;
                        });
                      },
                    ),
                    Text('Ratio: ${_ratio.toStringAsFixed(2)}'),
                    Slider(
                      value: _ratio,
                      min: 0.1,
                      max: 1.0,
                      onChanged: (value) {
                        setState(() {
                          _ratio = value;
                        });
                      },
                    ),
                    Text('Fullness: ${_fullness.toStringAsFixed(2)}'),
                    Slider(
                      value: _fullness,
                      min: 0.0,
                      max: 1.0,
                      onChanged: (value) {
                        setState(() {
                          _fullness = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class GlassCustomPainter extends CustomPainter {
  final double optm;
  final double ratio;
  final double fullness;

  const GlassCustomPainter(
      {required this.optm, required this.ratio, required this.fullness});

  @override
  void paint(Canvas canvas, Size size) {
    Paint glass = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withAlpha(100);

    Paint black = Paint()
      ..color = const Color(0xFF2C3E50)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Paint liquedColor = Paint()
      ..color = const Color(0xFFE74C3C).withOpacity(0.7)
      ..style = PaintingStyle.fill;

    Paint liquedTopColor = Paint()
      ..color = const Color(0xFFE74C3C).withOpacity(0.9)
      ..style = PaintingStyle.fill;
    Rect top = Rect.fromLTRB(0, 0, size.width, size.width * optm);

    Rect bottom = Rect.fromCenter(
        center: Offset(
            size.width * .5, size.height - size.width * .5 * optm * ratio),
        width: size.width * ratio,
        height: size.width * optm * ratio);

    Rect liquidTop = Rect.lerp(bottom, top, fullness)!;

    Path cupPath = Path()
      ..moveTo(top.left, top.top + top.height * 0.5)
      ..arcTo(top, pi, pi, true)
      ..lineTo(bottom.right, bottom.top + bottom.height * 0.5)
      ..arcTo(bottom, 0, pi, true)
      ..lineTo(top.left, top.top + top.height * 0.5);

    Path liquidPath = Path()
      ..moveTo(liquidTop.left, liquidTop.top + liquidTop.height * 0.5)
      ..arcTo(liquidTop, pi, pi, true)
      ..lineTo(bottom.right, bottom.top + bottom.height * 0.5)
      ..arcTo(bottom, 0, pi, true)
      ..lineTo(liquidTop.left, liquidTop.top + liquidTop.height * 0.5);

    canvas.drawPath(cupPath, glass);
    canvas.drawPath(cupPath, black);
    canvas.drawOval(top, black);
    canvas.drawPath(liquidPath, liquedColor);
    canvas.drawOval(liquidTop, liquedTopColor);

    // canvas.drawOval(top, glass);
    // canvas.drawOval(bottom, glass);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill0.shader = ui.Gradient.linear(
        Offset(size.width * 0.50, size.height * 0.10),
        Offset(size.width * 0.50, size.height * 0.91), [
      const Color(0xff6c0bb2),
      const Color(0xff7d33b9),
      const Color(0xff142fbf)
    ], [
      0.00,
      0.55,
      1.00
    ]);

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6933333, size.height * 0.0975610);
    path_0.lineTo(size.width * 0.1766667, size.height * 0.5365854);
    path_0.lineTo(size.width * 0.5066667, size.height * 0.5341463);
    path_0.lineTo(size.width * 0.3600000, size.height * 0.9146341);
    path_0.lineTo(size.width * 0.8166667, size.height * 0.4512195);
    path_0.lineTo(size.width * 0.5433333, size.height * 0.4390244);
    path_0.lineTo(size.width * 0.6933333, size.height * 0.0975610);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 192, 28, 28)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
