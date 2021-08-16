import 'package:flutter/material.dart';

class DragableButton extends StatefulWidget {
  @override
  _DragableButtonState createState() => _DragableButtonState();
}

class _DragableButtonState extends State<DragableButton> {
  Offset position = Offset(282.0, 198.4);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
          feedback: Container(
            child: FloatingActionButton(
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.black.withOpacity(0.6),
                  size: 50,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                backgroundColor: Colors.grey.shade200.withOpacity(0.5),
                onPressed: () {}),
          ),
          child: Container(
            child: FloatingActionButton(
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.black.withOpacity(0.6),
                  size: 50,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                backgroundColor: Colors.grey.shade200.withOpacity(0.5),
                onPressed: () {}),
          ),
          childWhenDragging: Container(),
          onDragEnd: (details) {
            setState(() {
              position = details.offset;
            });
            print(position);
            print(position.dx);
            print(position.dy);
          }),
    );
  }
}
