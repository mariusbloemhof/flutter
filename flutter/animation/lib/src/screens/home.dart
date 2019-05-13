import '../widgets/cat.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  @override
  initState() {
    super.initState();
    catController =
        AnimationController(duration: Duration(milliseconds: 350), vsync: this);
    catAnimation = Tween(begin: -35.0, end: -80.0)
        .animate(CurvedAnimation(parent: catController, curve: Curves.easeIn));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: GestureDetector(
        onTap: () {
          if (catController.status != AnimationStatus.completed) {
            catController.forward();
          } else {
            catController.reverse();
          }
        },
        child: Center(
            child: Stack(
              overflow: Overflow.visible,
          children: [
            buildCatAnimation(),
            buildBox(),
          ],
        )),
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          left: 0,
          right: 0,
        );
      },
      child: Cat(),
    );
  }

  Widget buildBox() {
    //Center()
    return Container(
      height: 200,
      width: 200,
      color: Colors.brown,
    );
  }
}
