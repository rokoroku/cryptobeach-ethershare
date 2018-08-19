import 'package:angular_router/angular_router.dart';

class RoutePaths {
  static final stories = RoutePath(path: 'stories');
  static final story = RoutePath(path: '${stories.path}/:id');
  static final profile = RoutePath(path: 'profile/:id');
  static final myPage = RoutePath(path: 'my');
}

String getRouteResourceId(Map<String, String> parameters) {
  final id = parameters['id'];
  return id == null ? null : id;
}
