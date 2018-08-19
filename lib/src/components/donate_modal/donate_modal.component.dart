import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/material_icon/material_icon.dart';

@Component(
  selector: 'donate-modal',
  styleUrls: ['donate_modal.component.css'],
  templateUrl: 'donate_modal.component.html',
  directives: [MaterialIconComponent],
  providers: [],
)
class DonateModalComponent implements OnInit {
  @override
  Future<Null> ngOnInit() async {}
}
