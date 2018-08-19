import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_progress/material_progress.dart';
import 'package:ethershare/src/services/story.service.dart';

typedef StoryCallback = dynamic Function(UIEvent event, StoryModel story);

@Component(
  selector: 'story-detail',
  styleUrls: ['story_detail.component.scss.css'],
  templateUrl: 'story_detail.component.html',
  directives: [
    MaterialIconComponent,
    MaterialButtonComponent,
    MaterialProgressComponent
  ],
  providers: [],
)
class StoryDetailComponent {
  @Input()
  StoryCallback onClickDonate;

  @Input()
  StoryModel story;
}
