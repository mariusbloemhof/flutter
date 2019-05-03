import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              emailField(),
              passwordField(),
              Container(
                margin: EdgeInsets.only(bottom: 25),
              ),
              submitButton()
            ],
          )),
    );
  }

  Widget emailField() {
    return TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.email),
          hintText: 'What is your email address',
          labelText: 'Email address *',
        ),
        keyboardType: TextInputType.emailAddress,
        onSaved: (String value) {
          email = value;
        },
        validator: validateEmail);
  }

  Widget passwordField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Password',
          hintText: 'Please provide your password',
          icon: Icon(Icons.lock)),
      obscureText: true,
      onSaved: (String value) {
        password = value;
      },
      validator: validatePassword,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.lightBlue,
      splashColor: Colors.blue,
      highlightColor: Colors.blueAccent,
      child: Text('sdfsdf'),
      onPressed: () {
        var form = formKey.currentState;
        if (form.validate()) {
          form.save();
          print('email : $email');
          print('password : $password');
        }
      },
    );
  }
}
