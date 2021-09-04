import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewPage extends StatefulWidget{
  HomeViewPage({Key? key}) : super(key: key);

  @override
  _HomeViewPageState createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage>{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.amber,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Home View"),
              ElevatedButton(
                child: Text("go to detail"),
                  onPressed: (){
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (BuildContext context){
                        return HomeViewDetail();
                  }));
              }
              ),
            ],
          ),
        ),
    );
  }
}

class HomeViewDetail extends StatefulWidget{
  HomeViewDetail({Key? key}): super(key: key);

  @override
  _HomeViewDetailState createState() => _HomeViewDetailState();
}
class _HomeViewDetailState extends State<HomeViewDetail>{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.deepOrange,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Home View detail"),
            ElevatedButton(
                child: Text("go to nested"),
                onPressed: (){
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (BuildContext context){
                    return HomeViewNested();
                  }));
                }
            ),
          ],
        ),
      ),
    );
  }

}

class HomeViewNested extends StatefulWidget {
  HomeViewNested({Key? key}) : super(key: key);

  @override
  _HomeViewNestedState createState() => _HomeViewNestedState();
}

class _HomeViewNestedState extends State<HomeViewNested>{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.blue,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Nested"),
          ],
        ),
      ),
    );
  }
}