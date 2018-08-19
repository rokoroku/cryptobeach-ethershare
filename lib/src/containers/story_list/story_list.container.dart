import 'dart:async';

import 'package:angular/angular.dart';
import 'package:ethershare/src/components/story_banner/story_banner.component.dart';
import 'package:ethershare/src/components/story_list/story_list.component.dart';
import 'package:ethershare/src/services/story.service.dart';

@Component(
  styles: [
    '''
    .stories {
      margin: 24px auto;
      width: min-content;
      display: block;
    }
    ''',
  ],
  selector: 'story-list',
  template: '''
    <story-banner></story-banner>
    <story-list class="stories" [stories]="stories"></story-list>
  ''',
  directives: [StoryBannerComponent, StoryListComponent],
  providers: [
    ClassProvider(StoryService),
  ],
)
class StoryListContainer implements OnInit {
  List<StoryModel> stories;
  StoryService storyService;

  StoryListContainer(this.storyService);

  Future<Null> ngOnInit() async {
    stories = await storyService.getStories();
  }
}
