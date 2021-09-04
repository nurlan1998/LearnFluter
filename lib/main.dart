import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/home_views.dart';
import 'package:navigation/profile_views.dart';

import 'nav.dart';

void main() {
  // MyRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // onUnknownRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(builder: (BuildContext context) {
      //     return NotFoundPage();
      //   });
      // },
      // onGenerateRoute: MyRouter.router.generator,
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget{
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{
  int _routeIndex = 0;

  List<GlobalKey<NavigatorState>>? navigationKeys;

  List<GlobalKey<NavigatorState>> generateNavigationKeys() {
    List<GlobalKey<NavigatorState>> navKeys = navs.map((navItem) {
      return GlobalKey<NavigatorState>();
    }).toList();
    return navKeys;
  }

  @override
  void initState() {
    super.initState();
    navigationKeys = generateNavigationKeys();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _routeIndex,
        onTap: (int index){
          if(_routeIndex == index){
            if(navigationKeys![index].currentState!.canPop()){
              navigationKeys![index].currentState?.pop();
            }
          }
          _routeIndex = index;
        },
        items: navs
            .map(
              (item) => BottomNavigationBarItem(
            icon: Icon(item.icon),
            title: Text(item.title),
          ),
        )
            .toList(),
      ),
      tabBuilder: (BuildContext context, int index){
        return CupertinoTabView(
          navigatorKey: navigationKeys![index],
          builder: (BuildContext context) {
            switch(index){
              case 0:
                return HomeViewPage();
              case 1:
                return ProfileView();
              default:
                return HomeView();
            }
          },
        );
      },
    );
  }
  }
