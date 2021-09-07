import 'package:flutter/material.dart';

class Expandable extends StatefulWidget {
  const Expandable({
    Key key,
    @required this.header,
    @required this.children,
  }) : super(key: key);

  final Widget header;
  final List<Widget> children;

  @override
  _ExpandableState createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _iconColorTween = ColorTween();

  bool _isOpen = false;
  AnimationController _controller;
  Animation<double> _iconTurns;
  Animation<double> _heightFactor;
  Animation<Color> _iconColor;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));

    _isOpen = PageStorage.of(context)?.readState(context) as bool ?? false;
    if (_isOpen) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _iconColorTween
      ..begin = Colors.red
      ..end = Colors.green;
    super.didChangeDependencies();
  }

  void _handleTap() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isOpen);
    });
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.header,
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: InkResponse(
                    onTap: _handleTap,
                    radius: 16,
                    child: RotationTransition(
                      turns: _iconTurns,
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ClipRect(
              child: Align(
                alignment: Alignment.center,
                heightFactor: _heightFactor.value,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isOpen && _controller.isDismissed;

    final Widget result = Offstage(
      child: TickerMode(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.children,
        ),
        enabled: !closed,
      ),
      offstage: closed,
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: result,
    );
  }
}
