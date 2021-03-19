import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  IntroState createState() => IntroState();
}

class IntroState extends State<IntroPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff53576b),
        image: DecorationImage(
          image: AssetImage('assets/intro_illust.png'),
          alignment: Alignment.topCenter,
          fit: BoxFit.contain,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Museum Guide',
              style: Theme.of(context).
                textTheme.
                headline1?.
                copyWith(color: Colors.white),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/menu");
              },
              child: Text(
                'Start!',
                style: Theme.of(context).
                  textTheme.
                  headline2?.
                  copyWith(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
