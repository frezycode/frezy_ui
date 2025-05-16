import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatefulWidget {
  AnimatedProgressBar({
    super.key,
    this.currentValue = 0,
    this.maxValue = 100,
    this.size = 30,
    this.animatedDuration = const Duration(milliseconds: 300),
    this.direction = Axis.horizontal,
    this.verticalDirection = VerticalDirection.down,
    BorderRadiusGeometry? borderRadius,
    this.progressColor,
    this.changeColorValue,
    this.formatValueFixed,
  }) : _borderRadius = borderRadius ?? BorderRadius.circular(8);
  final double currentValue;
  final double maxValue;
  final double size;
  final Duration animatedDuration;
  final Axis direction;
  final VerticalDirection verticalDirection;
  final BorderRadiusGeometry _borderRadius;

  final Color? progressColor;
  final int? changeColorValue;
  final int? formatValueFixed;

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  double _currentBegin = 0;
  double _currentEnd = 0;

  @override
  void initState() {
    _controller =
        AnimationController(duration: widget.animatedDuration, vsync: this);
    _animation = Tween<double>(begin: _currentBegin, end: _currentEnd)
        .animate(_controller);
    triggerAnimation();
    super.initState();
  }

  @override
  void didUpdateWidget(AnimatedProgressBar old) {
    triggerAnimation();
    super.didUpdateWidget(old);
  }

  void triggerAnimation() {
    setState(() {
      _currentBegin = _animation.value;

      if (widget.currentValue == 0 || widget.maxValue == 0) {
        _currentEnd = 0;
      } else {
        _currentEnd = widget.currentValue / widget.maxValue;
      }

      _animation = Tween<double>(begin: _currentBegin, end: _currentEnd)
          .animate(_controller);
    });
    _controller.reset();
    _controller.duration = widget.animatedDuration;
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) => _AnimatedProgressBar(
        animation: _animation,
        widget: widget,
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _AnimatedProgressBar extends AnimatedWidget {
  const _AnimatedProgressBar({
    super.key,
    required Animation<double> animation,
    required this.widget,
  }) : super(listenable: animation);

  final AnimatedProgressBar widget;

  double transformValue(x, begin, end, before) {
    double y = (end * x - (begin - before)) * (1 / before);
    return y < 0 ? 0 : ((y > 1) ? 1 : y);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final animation = listenable as Animation<double>;
    Color progressColor = widget.progressColor ?? theme.primaryColor;

    if (widget.changeColorValue != null) {
      final colorTween = ColorTween(
        begin: widget.progressColor,
        end: const Color(0xFFFF97CF),
      );

      progressColor = colorTween.transform(transformValue(
        animation.value,
        widget.changeColorValue,
        widget.maxValue,
        5,
      ))!;
    }

    List<Widget> progressWidgets = [];
    Widget progressWidget = Container(
      decoration: BoxDecoration(
        color: progressColor,
        borderRadius: widget._borderRadius,
      ),
    );
    progressWidgets.add(progressWidget);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: widget.direction == Axis.vertical ? widget.size : null,
        height: widget.direction == Axis.horizontal ? widget.size : null,
        decoration: BoxDecoration(
          color: theme.hintColor.withValues(alpha: 0.2),
          borderRadius: widget._borderRadius,
        ),
        child: Flex(
          direction: widget.direction,
          verticalDirection: widget.verticalDirection,
          children: <Widget>[
            Expanded(
              flex: (animation.value * 100).toInt(),
              child: Stack(
                children: progressWidgets,
              ),
            ),
            Expanded(
              flex: 100 - (animation.value * 100).toInt(),
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
