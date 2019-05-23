import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'models/patrol/patrolroute.dart';
import 'models/site/site.dart';
import 'seed.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

void main() async {
  var seed = Seed();

   //Site site = seed.getSite('Leriba');  
   //seed.AddSite(site);
  // site = seed.getSite('Strubenskop');
  // seed.AddSite(site);

  var site = await seed.loadSite('leriba');

  runApp(MaterialApp(
    title: 'Passing Data',
    home: TodosScreen(
      patrolRoutes: site.patrolRoutes,
    ),
  ));
}

class TodosScreen extends StatelessWidget {
  final List<PatrolRoute> patrolRoutes;

  TodosScreen({Key key, @required this.patrolRoutes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: patrolRoutes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(patrolRoutes[index].name),
            // When a user taps on the ListTile, navigate to the DetailScreen.
            // Notice that we're not only creating a DetailScreen, we're
            // also passing the current todo through to it!
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(patrolRoute: patrolRoutes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo
  final PatrolRoute patrolRoute;

  // In the constructor, require a Todo
  DetailScreen({Key key, @required this.patrolRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text(patrolRoute.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(patrolRoute.description),
      ),
    );
  }
}
