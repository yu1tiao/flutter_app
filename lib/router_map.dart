import 'package:flutter/material.dart';
import 'package:flutter_app/page/anim_page.dart';
import 'package:flutter_app/page/hero_page.dart';
import 'package:flutter_app/page/http_page.dart';
import 'package:flutter_app/page/inherited_test_page.dart';
import 'package:flutter_app/page/notify_page.dart';
import 'package:flutter_app/page/platform_view_page.dart';
import 'package:flutter_app/page/test_page.dart';

class RC {
  static const TEST = "test_layout";
  static const TEST_INHERITED = "test_inherited";
  static const TEST_NOTIFY = "test_notify";
  static const TEST_ANIM = "test_anim";
  static const TEST_HERO = "test_hero";
  static const TEST_HTTP = "test_http&method_channel";
  static const TEST_PLATFORM = "test_platform";

  static final Map<String, WidgetBuilder> routerMap = {
    RC.TEST: (context) => TestPage(),
    RC.TEST_INHERITED: (context) => TestInheritedPage(),
    RC.TEST_NOTIFY: (context) => TestNotifyPage(),
    RC.TEST_ANIM: (context) => TestAnimPage(),
    RC.TEST_HERO: (context) => TestHeroPage(),
    RC.TEST_HTTP: (context) => TestHttpPage(),
    RC.TEST_PLATFORM: (context) => TestPlatformPage(),
  };

  static RouteFactory routeFactory = (RouteSettings settings) {
    return MaterialPageRoute(builder: routerMap[settings.name]);
  };
}
