import '../action.dart';
import 'waypoint.dart';

class WayPointRoute {
  WayPoint nextWayPoint;
  final List<Action> actions = List<Action>();
  double durationMin;
}
