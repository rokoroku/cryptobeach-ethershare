import 'package:angular/angular.dart';
import 'package:ethershare/src/components/left_menu/left_menu.component.dart';
import 'package:ethershare/src/services/story.service.dart';
import 'package:ethershare/src/services/user.service.dart';

@Component(
  selector: 'my-page',
  template: '''
    <left-menu [user]="user"></left-menu>
  ''',
  directives: [
    LeftMenuComponent,
    // DonationStoryListComponent,
  ],
)
class MyPageContainer {
  UserService userService;
  StoryService storyService;

  UserModel get user {
    return userService.currentUser;
  }

  MyPageContainer(this.userService, this.storyService);
}
