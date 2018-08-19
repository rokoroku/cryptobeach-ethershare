import 'package:angular/angular.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:ethershare/src/services/story.service.dart';
import 'package:ethershare/src/components/story_card/story_card.component.dart';

@Component(
  selector: 'story-list',
  styleUrls: ['story_list.component.css'],
  templateUrl: 'story_list.component.html',
  directives: [NgFor, MaterialIconComponent, StoryCardComponent],
  providers: [ClassProvider(StoryService)],
)
class StoryListComponent {
  @Input()
  List<StoryModel> stories = [];
}
