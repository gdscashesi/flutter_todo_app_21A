import 'package:flutter/material.dart';
import 'package:todo/ui/widgets/background/background_painter.dart';


class Background extends StatefulWidget {
  final Widget child;
  final AnimationController? controller;
  final bool animated;
  final Color? backgroundColor;
  const Background({
    Key? key,
    this.animated = false,
    this.backgroundColor,
    required this.child,
    this.controller,
  }) ://todo add asserts
        super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> with SingleTickerProviderStateMixin{
  double circleSize = 0.5;
  late Animation<double> circleController;

  @override
  void initState() {
    super.initState();

    if (widget.controller != null){

    circleController = Tween<double>(begin: 0.5, end: 5).animate(widget.controller!)
    ..addListener(() {
      setState(() {
        circleSize = circleController.value;

      });
    });


  }


  }


  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller!.dispose();

    }
    super.dispose();
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.animated ? null: widget.backgroundColor!,
      body: widget.animated ?

      CustomPaint(
        painter: BackgroundPainter(circleSize),
        child: widget.child,
      )

      : widget.child,
    );
  }
}
