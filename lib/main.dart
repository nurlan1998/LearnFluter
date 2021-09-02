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
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return NotFoundPage();
        });
      },
      onGenerateRoute: MyRouter.router.generator,
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
                  MyRouter.router.navigateTo(context, "/about",
                      transition: TransitionType.cupertino);
                }),
            TextButton(
              child: Text("About with arguments"),
              onPressed: () {
                MyRouter.router.navigateTo(context, "/blog");
              },
            ),
            TextButton(
                child: Text("Blog"),
                onPressed: () {
                  MyRouter.router.navigateTo(context, "/blog");
                }),
            TextButton(
                child: Text("Not Found"),
                onPressed: () {
                  Navigator.of(context).pushNamed('/notasds');
                  // MyRouter.router.navigateTo(
                  //     context,
                  //     "/notasds"
                  // );
                }),
          ],
        ),
      ),
    ));
  }
}

class AboutPage extends StatefulWidget {
  static const routName = "/about";

  AboutPage({Key? key, this.id}) : super(key: key);

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
              : Text("About page")),
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
          onPressed: () {
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
