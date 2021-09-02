import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class MyRouter {
  static final router = FluroRouter();

  static var _homeHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return HomePage();
  });

  static var _aboutHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    print(params);
    if (params.containsKey("uuid")) {
      return AboutPage(
        id: params["uuid"][0],
      );
    }
    return AboutPage();
  });
  static var _blogHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return BlogPage();
  });

  static void setupRouter() {
    router.define(HomePage.routName, handler: _homeHandler);
    router.define(AboutPage.routName, handler: _aboutHandler);
    router.define("${AboutPage.routName}/:uuid", handler: _aboutHandler);
    router.define(BlogPage.routName,
        handler: _blogHandler, transitionType: TransitionType.cupertino);
  }
}
