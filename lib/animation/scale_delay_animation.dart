import 'dart:async';

import 'package:flutter/material.dart';

class ScaleDelayedAnimation extends StatefulWidget {
  final Widget child;
  final int delay;

  ScaleDelayedAnimation({@required this.child, this.delay});
  @override
  _ScaleDelayedAnimationState createState() => _ScaleDelayedAnimationState();
}

class _ScaleDelayedAnimationState extends State<ScaleDelayedAnimation>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _animOffset;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.delay),
    );
    final curve = CurvedAnimation(
      curve: Curves.easeIn,
      parent: _controller,
    );
    _animOffset = Tween<double>(begin: 0.4, end: 1.0)
        .animate(curve);
    if (widget.child == null) {
      _controller.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        _controller.forward();
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FadeTransition(
        child: ScaleTransition(
          scale: _animOffset,
          child: widget.child,
        ),
        opacity: _controller,
      ),
    );
  }
}