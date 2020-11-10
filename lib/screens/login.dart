import 'package:MyProject/models/authentication.dart';
import 'package:MyProject/screens/home_screen.dart';
import 'package:MyProject/screens/register.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  Future<void> _login() async {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();

    await Provider.of<Authentication>(context, listen: false).loginUser(
      _authData['email'],
      _authData['password'],
    );
    Fluttertoast.showToast(
      msg: "Login Successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.yellow,
      textColor: Colors.black,
      timeInSecForIosWeb: 1,
    );
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/image.png"),
                fit: BoxFit.cover,
              )),
            ),

            /*
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.lightBlueAccent,
                  ],
                ),
              ),
            ),*/
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 450,
                  width: 400,
                  padding: EdgeInsets.all(40),
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Email Address',
                              icon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Invalid Email';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['email'] = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              icon: Icon(Icons.remove_red_eye_rounded),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty || value.length <= 4) {
                                return 'Invalid Password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ButtonTheme(
                            minWidth: 250.0,
                            height: 50.0,
                            child: RaisedButton(
                                child: Text('Login'),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                color: Colors.black,
                                textColor: Colors.white,
                                onPressed: () {
                                  _login();
                                }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ButtonTheme(
                            minWidth: 250.0,
                            height: 50.0,
                            child: RaisedButton(
                                child: Text('Register'),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                color: Colors.yellow,
                                textColor: Colors.black,
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      RegisterScreen.routeName);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
