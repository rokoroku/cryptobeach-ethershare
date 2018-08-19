import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'containers/story_list/story_list.container.template.dart' as StoryListContainerTemplate;
import 'containers/story_detail/story_detail.container.template.dart' as StoryDetailContainerTemplate;
import 'containers/not_found/not_found.container.template.dart' as NotFoundContainerTemplate;
import 'containers/my_page/my_page.container.template.dart' as MyPageContainerTemplate;

export 'route_paths.dart';

class Routes {
  static final stories = RouteDefinition(
    routePath: RoutePaths.stories,
    component: StoryListContainerTemplate.StoryListContainerNgFactory,
  );

  static final story = RouteDefinition(
    routePath: RoutePaths.story,
    component: StoryDetailContainerTemplate.StoryDetailContainerNgFactory,
  );

  static final myPage = RouteDefinition(
    routePath: RoutePaths.myPage,
    component: MyPageContainerTemplate.MyPageContainerNgFactory,
  );

  static final all = <RouteDefinition>[
    stories,
    story,
    myPage,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.stories.toUrl(),
    ),
    RouteDefinition(
      path: '.*',
      component: NotFoundContainerTemplate.NotFoundContainerNgFactory,
    ),
  ];
}
