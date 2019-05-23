import 'package:flutter/material.dart';
import '../models/patrol/patrolroute.dart';

class PatrolRouteScreen extends StatelessWidget {
  // Declare a field that holds the Todo
  final PatrolRoute patrolRoute;

  // In the constructor, require a Todo
  PatrolRouteScreen({Key key, @required this.patrolRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Route to create our UI
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(todo.title),
    //   ),
    //   body: Padding(
    //     padding: EdgeInsets.all(16.0),
    //     child: Text(todo.description),
    //   ),
    // );
  }
}
