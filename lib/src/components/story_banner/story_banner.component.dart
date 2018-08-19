import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/material_icon/material_icon.dart';

@Component(
  selector: 'story-banner',
  styleUrls: ['story_banner.component.scss.css'],
  templateUrl: 'story_banner.component.html',
  directives: [MaterialIconComponent],
  providers: [],
)
class StoryBannerComponent implements OnInit {
  @override
  Future<Null> ngOnInit() async {}
}
