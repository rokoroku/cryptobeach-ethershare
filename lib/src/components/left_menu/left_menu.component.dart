import 'package:angular/angular.dart';
import 'package:ethershare/src/services/user.service.dart';

@Component(
  selector: 'left-menu',
  styleUrls: ['left_menu.component.scss.css'],
  templateUrl: 'left_menu.component.html',
  directives: [coreDirectives],
  providers: [],
)
class LeftMenuComponent {
  @Input()
  UserModel user;
}