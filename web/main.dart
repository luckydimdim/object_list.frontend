import 'dart:core';

import 'package:angular2/platform/browser.dart';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/src/platform/browser/location/hash_location_strategy.dart';
import 'package:angular2/platform/common.dart';

import 'package:alert/alert_service.dart';
import 'package:aside/aside_service.dart';
import 'package:auth/auth_service.dart';
import 'package:config/config_service.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'package:master_layout/master_layout_component.dart';

import 'package:object_list/object_list_component.dart';

bool get isDebug =>
    (const String.fromEnvironment('PRODUCTION', defaultValue: 'false')) !=
    'true';

@Component(
    selector: 'app',
    template: '<master-layout><object-list></object-list></master-layout>',
    directives: const [MasterLayoutComponent, ObjectListComponent])
class AppComponent {}

main() async {
  ComponentRef ref = await bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    const Provider(LocationStrategy, useClass: HashLocationStrategy),
    const Provider(AlertService),
    const Provider(AuthenticationService),
    const Provider(AuthorizationService),
    const Provider(ConfigService),
    const Provider(AsideService),
    provide(Client, useFactory: () => new BrowserClient(), deps: [])
  ]);

  if (isDebug) {
    print('Application in DebugMode');
    enableDebugTools(ref);
  }
}
