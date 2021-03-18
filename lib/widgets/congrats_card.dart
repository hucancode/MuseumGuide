import 'package:flutter/material.dart';

class CongratsCard extends StatefulWidget
{
  final VoidCallback? onTap;
  CongratsCard({Key? key, this.onTap}): super(key: key);
  @override
  State<CongratsCard> createState() {
    print("onTap null? "+onTap.toString());
    return CongratsCardState(onTap: onTap);
  }
}
class CongratsCardState extends State<CongratsCard> with SingleTickerProviderStateMixin
{
  VoidCallback? onTap;
  bool activated = false;
  late AnimationController controller;

  CongratsCardState({this.onTap});

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void setStatus(bool value)
  {
    if(activated && !value)
    {
      controller.animateBack(0);
    }
    if(!activated && value)
    {
      controller.forward(from: 0);
    }
    
    setState(() {
      activated = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: 40,
      right: 40,
      top: activated? 180: -400,
      duration: Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
      child: RepaintBoundary(
        child: Card(
          shape: CircleBorder(),
          elevation: 10,
          child: InkWell(
            onTap: () { onTap?.call(); },
            child: Padding(
              padding: EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 100),
              child: buildContents(context), 
            ),
          ),
        ),
      ),
    );
  }

  Column buildContents(BuildContext context) {
    var iconAnimation = CurvedAnimation(
      curve: Interval(
        0.2,
        0.6,
        curve: Curves.elasticOut,
      ),
      parent: controller,
    );
    return Column(
      children: [
        ScaleTransition(
            scale: iconAnimation,
            child: Text('🎉', style: TextStyle(fontSize: 50),),
        ),
        //Text('🎉', style: TextStyle(fontSize: 50),),
        SizedBox(height: 10),
        Text(
          '✨ Congratulations! ✨', 
          style: Theme.of(context).
            textTheme.
            headline2?.
            copyWith(fontWeight: FontWeight.bold),
          ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Text(
            'You have succesfully finished the tour. '
            'You get to know the dinosaur better. ',
            textAlign: TextAlign.center,
            ),
        ),
      ],
    );
  }
}