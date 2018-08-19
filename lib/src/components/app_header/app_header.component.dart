import 'package:angular/angular.dart';
import 'package:angular_components/material_tab/fixed_material_tab_strip.dart';
import 'package:angular_components/material_tab/material_tab.dart';
import 'package:angular_components/material_tab/tab_change_event.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_router/angular_router.dart';
import 'package:ethershare/src/components/avatar/avatar.component.dart';
import 'package:ethershare/src/routes.dart';
import 'package:ethershare/src/services/user.service.dart';

@Component(
  selector: 'app-header',
  styleUrls: ['app_header.component.scss.css'],
  templateUrl: 'app_header.component.html',
  directives: [
    coreDirectives,
    MaterialIconComponent,
    MaterialTabComponent,
    FixedMaterialTabStripComponent,
    AvatarComponent
  ],
  providers: [],
)
class AppHeaderComponent {
  AppHeaderComponent(this.userService, this.router);

  // User
  UserService userService;
  UserModel get user {
    return userService.currentUser;
  }

  void authenticate() async {
    await userService.authWithWeb3();
  }

  // Navigation
  Router router;
  int tabIndex = 0;
  void onTabChange(TabChangeEvent event) {
    this.tabIndex = event.newIndex;
    if (tabIndex == 0) {
      router.navigateByUrl(RoutePaths.stories.toUrl());
    }
  }

  final tabLabels = const <String>['후원하기', '모금후기', '기부랭킹', '기부스토리', '캠페인'];

  void navigateToMyPage() {
    this.tabIndex = -1;
    router.navigateByUrl(RoutePaths.myPage.toUrl());
  }

  void navigateToRoot() {
    this.tabIndex = 0;
    router.navigateByUrl(RoutePaths.stories.toUrl());
  }
}
