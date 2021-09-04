import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget{
  ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>{
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
                    return ProfileViewNested();
                  }));
                }
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileViewDetail extends StatefulWidget{
  ProfileViewDetail({Key? key}): super(key: key);

  @override
  _ProfileViewDetailState createState() => _ProfileViewDetailState();
}
class _ProfileViewDetailState extends State<ProfileViewDetail>{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.deepOrange,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Profile View detail"),
            ElevatedButton(
                child: Text("go to nested page"),
                onPressed: (){
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (BuildContext context){
                    return ProfileViewNested();
                  }));
                }
            ),
          ],
        ),
      ),
    );
  }

}

class ProfileViewNested extends StatefulWidget {
  ProfileViewNested({Key? key}) : super(key: key);

  @override
  _ProfileViewNestedState createState() => _ProfileViewNestedState();
}

class _ProfileViewNestedState extends State<ProfileViewNested>{
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