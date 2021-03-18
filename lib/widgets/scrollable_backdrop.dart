import 'package:flutter/material.dart';
import 'dart:math' as math;

class ScrollableBackdrop extends StatefulWidget {
  final double? scale;
  const ScrollableBackdrop({
    Key? key,
    this.scale,
  }) : super(key: key);

  @override
  ScrollableBackdropState createState() {
    return ScrollableBackdropState(scale: scale??1.0);
  }
}
class ScrollableBackdropState extends State<ScrollableBackdrop> {
  final double scale;
  double currentOffset = 0;

  ScrollableBackdropState({required this.scale});

  void setOffset(double value)
  {
    setState(() {
      currentOffset = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width*scale;
    double height = MediaQuery.of(context).size.height;
    double offset = math.max(math.min(currentOffset, 1), 0)*(width - MediaQuery.of(context).size.width);
    return Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            AnimatedPositioned(
              width: width,
              height: height,
              left: -offset,
              top: 0.0,
              child: buildPicture(),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOutCubic,
            ),
          ],
    );
  }

  Widget buildPicture() {
    return Container(
      child: Image.asset(
      'assets/footer_illust_long_lowres.png', 
      fit: BoxFit.fitWidth),
      alignment: Alignment.bottomRight,
    );
  }
  
}
