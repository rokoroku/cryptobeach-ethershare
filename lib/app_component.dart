import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:ethershare/src/routes.dart';
import 'package:ethershare/src/route_paths.dart';
import 'package:ethershare/src/components/app_footer/app_footer.component.dart';
import 'package:ethershare/src/components/app_header/app_header.component.dart';

import 'src/services/user.service.dart';
import 'src/services/story.service.dart';

@Component(
  selector: 'my-app', 
  templateUrl: 'app_component.html', 
  directives: [
    routerDirectives,
    AppHeaderComponent,
    AppFooterComponent
  ], 
  providers: [
    const ClassProvider(UserService),
    const ClassProvider(StoryService)
  ], 
  exports: const [
    RoutePaths,
    Routes
  ]
)
class AppComponent implements OnInit {
  UserService userService;
  AppComponent(this.userService);

  UserModel get user {
    // userService.authWithWeb3();
    return userService.currentUser;
  }

  @override
  void ngOnInit() async {
    // await userService.authWithWeb3();
  }
}
