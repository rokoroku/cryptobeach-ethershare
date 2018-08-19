import 'package:angular/angular.dart';
import 'package:angular_components/material_progress/material_progress.dart';
import 'package:angular_router/angular_router.dart';
import 'package:ethershare/src/route_paths.dart';
import 'package:ethershare/src/routes.dart';
import 'package:ethershare/src/services/story.service.dart';

@Component(
  selector: 'story-card',
  styleUrls: ['story_card.component.scss.css'],
  templateUrl: 'story_card.component.html',
  directives: [MaterialProgressComponent, routerDirectives],
)
class StoryCardComponent {
  Router router;

  @Input()
  StoryModel story;

  String get dday {
    return 'D-${story.endDate.difference(new DateTime.now()).inDays}';
  }

  StoryCardComponent(this.router);

  void navigateToDetail() {
    router.navigateByUrl(RoutePaths.story.toUrl(parameters: {'id': story.id}));
  }
}
