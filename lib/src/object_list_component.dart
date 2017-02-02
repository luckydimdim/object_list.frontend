import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'dart:html';
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

  // import 'dart:html';
  void breadcrumbInit(){
    var  breadcrumbContent = querySelector('#breadcrumbContent') as DivElement;

    if (breadcrumbContent == null)
      return;

    breadcrumbContent.innerHtml = '''
            <li class="breadcrumb-item"><a href="#/master/dashboard">Главная</a></li>
            <li class="breadcrumb-item active">Список объектов строительства</li>
    ''';
  }

  @override
  void ngOnInit() {
    breadcrumbInit();
  }
}
