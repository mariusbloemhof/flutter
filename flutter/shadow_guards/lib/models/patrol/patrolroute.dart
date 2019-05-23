import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guards/models/patrol/waypoint.dart';

import '../metadata.dart';

class PatrolRoute implements MetaData {
  String createdBy;
  DateTime createdOn;
  String description;
  String id;
  String lastModifiedBy;
  DateTime lastModifieldOn;
  String name;
  DocumentReference reference;
  final List<WayPoint> wayPoints = List<WayPoint>();

  PatrolRoute({this.id, this.name, this.description});

  PatrolRoute.fromMap(Map<String, dynamic> map, {this.reference}) {
    id = reference.documentID;
    name = map['name'];
    description = map['description'];
  }

  PatrolRoute.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
