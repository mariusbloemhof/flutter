import 'package:cloud_firestore/cloud_firestore.dart';

import '../gpscoordinates.dart';
import '../metadata.dart';
import 'waypointroute.dart';

class WayPoint implements MetaData {
  String createdBy;
  DateTime createdOn;
  String description;
  String id;
  String lastModifiedBy;
  DateTime lastModifieldOn;
  String name;
  DocumentReference reference;
  GpsCoordinates gpsCoordinates = GpsCoordinates();
  final WayPointRoute wayPointRoute = WayPointRoute();

  WayPoint({this.gpsCoordinates, this.id, this.name, this.description});

  WayPoint.fromMap(Map<String, dynamic> map, {this.reference}) {
    id = reference.documentID;
    name = map['name'];
    description = map['description'];
    gpsCoordinates.latitude = map['latitude'];
    gpsCoordinates.longtitude = map['latitude'];
  }

  WayPoint.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
