import 'package:cloud_firestore/cloud_firestore.dart';

import '../patrol/patrolroute.dart';
import '../metadata.dart';

class Site implements MetaData {
  String createdBy;
  DateTime createdOn;
  String description;
  String id;
  String lastModifiedBy;
  DateTime lastModifieldOn;
  String name;
  DocumentReference reference;
  List<PatrolRoute> patrolRoutes = List<PatrolRoute>();

  Site({this.id, this.name, this.description});

  Site.fromMap(Map<String, dynamic> map, {this.reference}) {
    id = reference.documentID;
    name = map['name'];
    description = map['description'];
  }

  Site.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
