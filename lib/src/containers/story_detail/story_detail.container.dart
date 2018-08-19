import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:ethershare/src/components/story_detail/story_detail.component.dart';
import 'package:ethershare/src/services/story.service.dart';
import 'package:ethershare/src/route_paths.dart';

@Component(
  selector: 'story-detail', 
  template: '''
    <story-detail *ngIf="story != null" [story]="story" [onClickDonate]="onClickDonate"></story-detail>
  ''', 
  directives: [
    coreDirectives,
    StoryDetailComponent,
  ], 
  providers: [
    ClassProvider(StoryService)
  ]
)
class StoryDetailContainer implements OnActivate {
  final StoryService storyService;
  final Router router;

  StoryModel story;
  StoryDetailContainer(this.storyService, this.router);

  onClickDonate(UIEvent _, StoryModel story) async {
    await storyService.donate(story.id);
  }

  @override
  void onActivate(_, RouterState current) async {
    final id = getRouteResourceId(current.parameters);
    final story = await storyService.getStoryById(id);
    if (story == null) {
      router.navigateByUrl(RoutePaths.stories.toUrl());
    }
    this.story = story;
  }
}
