import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:alert/alert_service.dart';
import 'package:js/js.dart';

@Component(selector: 'object-list')
@View(
    templateUrl: 'object_list_component.html',
    directives: const [RouterLink])
class ObjectListComponent implements OnInit {
  static const String route_name = "ObjectList";
  static const String route_path = "objectList";
  static const Route route = const Route(
      path: ObjectListComponent.route_path,
      component: ObjectListComponent,
      name: ObjectListComponent.route_name);

  final Router _router;
  final AlertService _alertService;

  ObjectListComponent(this._router, this._alertService) {}

  @override
  void ngOnInit() {}
}
