import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/gpscoordinates.dart';
import 'models/patrol/patrolroute.dart';
import 'models/patrol/waypoint.dart';
import 'models/site/site.dart';

class Seed {
  Site getSite(String name) {
    var site = _seedSite(name);

    return site;
  }

  Future<Site> loadSite(String id) async {
    var siteRef =
        await Firestore.instance.collection('site').document(id).get();
    var site = Site.fromSnapshot(siteRef);

    var patrolRoutes =
        await siteRef.reference.collection('patrol-route').getDocuments();

    for (var route in patrolRoutes.documents) {
      var patrolRoute = PatrolRoute.fromSnapshot(route);
      site.patrolRoutes.add(patrolRoute);
      var wayPoints =
          await route.reference.collection('way-point').getDocuments();

      for (var waypoint in wayPoints.documents) {
        patrolRoute.wayPoints.add(WayPoint.fromSnapshot(waypoint));
      }
    }

    return site;
  }

  void AddSite(Site site) async {
    var sites = Firestore.instance.collection('site');
    sites
        .document(site.id)
        .setData({'name': site.name, 'description': site.description});

    var siteRef =
        await Firestore.instance.collection('site').document(site.id).get();

    for (var route in site.patrolRoutes) {
      siteRef.reference
          .collection('patrol-route')
          .document(route.id)
          .setData({'name': route.name, 'description': route.description});
    }
    var patrolRoutes =
        await siteRef.reference.collection('patrol-route').getDocuments();

    for (var route in patrolRoutes.documents) {
      var patrolRoute =
          site.patrolRoutes.singleWhere((item) => item.id == route.documentID);
      for (var waypoint in patrolRoute.wayPoints) {
        route.reference.collection('way-point').document(waypoint.id).setData({
          'name': waypoint.id,
          'latitude': waypoint.gpsCoordinates.latitude,
          'longtitude': waypoint.gpsCoordinates.longtitude
        });
      }
    }
  }

  Site _seedSite(String name) {
    Site site = Site(
        id: name.toLowerCase(),
        name: '$name',
        description: '$name guarding site');

    site.patrolRoutes.add(_seedPatrolRoute(name));
    site.patrolRoutes.add(_seedPatrolRoute(name));

    return site;
  }

  PatrolRoute _seedPatrolRoute(String name) {
    var random = Random();
    var no = random.nextInt(100);

    PatrolRoute patrolRoute = PatrolRoute(
        id: '${name.toLowerCase()}$no',
        name: 'Patrol route $no',
        description: 'Route to patrol guarding station $no at $name');
    var wayPoint = WayPoint(
        gpsCoordinates: GpsCoordinates(latitude: 30.1246, longtitude: 12.2223));
    wayPoint.wayPointRoute.nextWayPoint = WayPoint(
        gpsCoordinates: GpsCoordinates(latitude: 30.1246, longtitude: 12.2223));

    wayPoint.id = 'waypoint-${patrolRoute.wayPoints.length + 1}';
    patrolRoute.wayPoints.add(wayPoint);

    return patrolRoute;
  }
}
