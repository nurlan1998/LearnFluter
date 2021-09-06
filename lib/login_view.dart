import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/user.dart';

class LoginView extends StatefulWidget{
  LoginView({Key? key}): super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>{
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _fieldNameCtr = TextEditingController();
  TextEditingController _fieldEmailCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Login View"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _fieldNameCtr,
              validator: _validateName,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _fieldEmailCtr,
              validator: _validateEmail,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextButton(
              child: Text("Отправить"),
                onPressed: _submitForm),
          ],
        ),
      ),
    );
  }

  String? _validateEmail(value){
    if(value == ''){
      return 'Заполните Email';
    }else{
      return null;
    }
  }

  void _submitForm() {
    if(_formKey.currentState!.validate()){
      User user = User(
        id: 65464646,
        name: _fieldNameCtr.text,
        username: "ungarbaev",
        email: _fieldEmailCtr.text,
        address: UserAddress(
          city: 'Nukus',
          street: "amanbaev",
          zipcode: "4546",
          suite: "SUITE"
        )
      );
      _formKey.currentState!.save();
      _formKey.currentState!.reset();

      print(user.toJson());
      print("${_fieldNameCtr.text}");
      print("${_fieldEmailCtr.text}");
      print("Submit");
    }
  }

  String? _validateName(value) {
    if(value.isEmpty){
      return "Заполните имя";
    }else{
      return null;
    }
  }
}