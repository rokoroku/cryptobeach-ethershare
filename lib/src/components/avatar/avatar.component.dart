import 'package:angular/angular.dart';
import 'package:ethershare/src/services/user.service.dart';

@Component(
  selector: 'avatar',
  styleUrls: ['avatar.component.scss.css'],
  templateUrl: 'avatar.component.html',
  directives: [NgClass]
)
class AvatarComponent {

  // User
  @Input()
  UserModel user;

  // User
  @Input()
  bool active = false;

}
