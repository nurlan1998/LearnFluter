import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:navigation/fluro_router.dart';

void main() {
  MyRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (BuildContext context){
          return NotFoundPage();
        });
      },
      onGenerateRoute: MyRouter.router.generator,
      // onGenerateRoute: (RouteSettings settings){
      //   switch(settings.name){
      //     case HomePage.routName:
      //       return MaterialPageRoute(builder: (BuildContext context){
      //         return HomePage();
      //       });
      //     case AboutPage.routName:
      //       final args = settings.arguments as Map<String, dynamic>;
      //       if(args != null && args.containsKey('id')) {
      //         return MaterialPageRoute(
      //           fullscreenDialog: true,
      //           builder: (BuildContext context) {
      //             return AboutPage(id: args['id']);
      //           },
      //         );
      //       }
      //         return MaterialPageRoute(builder: (BuildContext context){
      //             return AboutPage();
      //       });
      //     case BlogPage.routName:
      //       // final args = settings.arguments as Map<String,dynamic>;
      //       // print(args);
      //       return PageRouteBuilder(pageBuilder: (
      //           BuildContext context,
      //           Animation animation1,
      //           Animation animation2,
      //           ){
      //         return BlogPage();
      //
      //       },
      //       transitionsBuilder: (
      //           BuildContext context,
      //           Animation animation,
      //           Animation secondaryAnimation,
      //           child,
      //       ){
      //         return BlogPage();
      //         //
      //         // CurvedAnimation _curred = CurvedAnimation(
      //         //   parent: animation,
      //         //   curve: Curves.fastOutSlowIn
      //         // );
      //         // Animation<double> _animate =
      //         //     Tween<double>(begin: 0.0, end: 1.0).animate(_curred);
      //         //
      //         // return ScaleTransition(
      //         //     scale: _animate,
      //         //     child: FadeTransition(
      //         //     opacity: animation,
      //         //     child: child,
      //         //
      //         // );
      //       },
      //       );
      //     default:
      //       return MaterialPageRoute(builder: (BuildContext context){
      //         return NotFoundPage();
      //       });
      //   }
      // },
      // routes: {
      //   '/': (BuildContext context) => HomePage(),
      //   '/about': (BuildContext context) => AboutPage(),
      //   '/blog': (BuildContext context) => BlogPage(),
      // },
      // home: MyHomePage(title: "Navigation",),
    );
  }
}

class HomePage extends StatefulWidget {
  static const routName = "/";
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      // maintainBottomViewPadding: false,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                child: Text('About'),
                onPressed: () {
                  MyRouter.router.navigateTo(
                      context,
                      "/about",
                    transition: TransitionType.cupertino
                  );

                  // Navigator.of(context).pushNamed('/about');

                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (BuildContext context) {
                  //   return AboutPage();
                  // }));
                }),
            TextButton(
              child: Text("About with arguments"),
                onPressed: (){
                Navigator.of(context).pushNamed(
                    "/about/6161616",
                );
            },
            ),
            TextButton(
                child: Text("Blog"),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      '/blog',
                      // arguments: {"id": 566466},
                      );
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (BuildContext context) {
                  //   return BlogPage();
                  // }));
                }),
            TextButton(
                child: Text("Not Found"),
                onPressed: () {
                  Navigator.of(context).pushNamed('/notasds');
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (BuildContext context) {
                  //   return BlogPage();
                  // }));
                }),
          ],
        ),
      ),
    ));
  }
}

class AboutPage extends StatefulWidget {
  static const routName = "/about";
  AboutPage({Key? key,this.id}) : super(key: key);

  final id;

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // automaticallyImplyLeading: false,
          ),
      body: Center(
        child: widget.id != null
        ? Text("About page ${widget.id}")
        : Text("About page")
        // child: RaisedButton(
        //   child: Text("Вернуться назад"),
        //   onPressed: (){
        //     Navigator.of(context).pop();
        //   },
        // ),
      ),
    );
  }
}

class BlogPage extends StatefulWidget {
  static const routName = "/blog";
  BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // automaticallyImplyLeading: false,
          ),
      body: Center(
        child: RaisedButton(
          child: Text("Вернуться назад"),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
class NotFoundPage extends StatefulWidget {
  NotFoundPage({Key? key}) : super(key: key);

  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // automaticallyImplyLeading: false,
          ),
      body: Center(
        child: Text("Not Found page"),
      ),
    );
  }
}
