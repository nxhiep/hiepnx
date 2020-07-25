import 'package:flutter/material.dart';

class BounceButton extends StatefulWidget {

  final Widget child;
  final Function onTap;
  BounceButton({ this.child, this.onTap });

  @override
  _BounceButtonState createState() => _BounceButtonState();
}

class _BounceButtonState extends State<BounceButton> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller= new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
   _animation = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.0, 1.0, curve: Curves.bounceOut)
    );
    _controller.forward(from: 1.0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _controller.reset();
        _controller.forward();
        if(widget.onTap != null){
          widget.onTap();
        }
      },
      child: ScaleTransition(
        scale: _animation,
        child: widget.child,
      ),
    );
  }
}