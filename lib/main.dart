import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:navigation/user.dart';
import 'package:dio/dio.dart';

import 'login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Internet",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => LoginView(),
        '/home': (BuildContext context) =>
            MyHomePage(title: "Flutter Demo Home Page"),
      },
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key? key,required this.title}): super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  bool isLoading = true;
  bool hasError = false;
  late String errorMessage;
  late List<User> users;
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    // getDataHttp();
    getDataDio();
  }

  getDataDio() async {
    setState(() {
      isLoading = true;
    });
    try{
      final response = await _dio.get("https://run.mocky.io/v3/af5ffb01-5cc0-4b87-95b5-47b0fcce1c96");
      var data = response.data;
      users = data.map<User>((user) => User.fromJson(user)).toList();

    }on DioError catch(e){
      print(e.response!.data['message']);
      setState(() {
        errorMessage = e.response!.data['message'];
        hasError = true;
        isLoading = false;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  // getDataHttp() async{
  //
  //   try{
  //     final response = await http
  //     .get(Uri.parse('https://run.mocky.io/v3/af5ffb01-5cc0-4b87-95b5-47b0fcce1c96'));//200
  //     //     .get(Uri.parse('https://run.mocky.io/v3/e4e4904b-7ca8-4893-9caa-d5ea304f0f51'));
  //     var data = json.decode(response.body);
  //     users = data.map<User>((user) => User.fromJson(user)).toList();
  //   }catch(e){
  //     setState(() {
  //       hasError = true;
  //     });
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          if(!isLoading && hasError) Text(errorMessage),
          if(!isLoading && hasError == false)
          Expanded(
              child: ListView(
            children: [
              ...users.map((user) {
                return ListTile(
                  title: Text(user.email),
                  subtitle: Text(user.name),
                );
              }).toList()
            ],
          ))
        ],
      )
      );
      //     ? Center(
      //         child: CircularProgressIndicator(),
      // ) : hasError
      //   ? Text('Error')
      //     :ListView(
      //   children: <Widget>[
      //     ...users.map((user){
      //       return ListTile(
      //       title: Text(user.email),
      //         subtitle: Text(user.name),
      //       );
      //     }).toList(),
    //     ],
    //   ),
    // );
  }
}