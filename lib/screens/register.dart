import 'package:MyProject/models/authentication.dart';
import 'package:MyProject/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  Map<String, String> _authData = {
    'name': '',
    'contact': '',
    'email': '',
    'password': '',
  };

  Future<void> _register() async {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();

    await Provider.of<Authentication>(context, listen: false).registerUser(
      _authData['name'],
      _authData['contact'],
      _authData['email'],
      _authData['password'],
    );
    Fluttertoast.showToast(
      msg: "Registered Successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.yellow,
      textColor: Colors.black,
      timeInSecForIosWeb: 1,
    );
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
            /* Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.lightBlueAccent,
                  ],
                ),
              ),
            ),*/
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
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
                                  hintText: 'Full Name',
                                  icon: Icon(Icons.person)),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty || value.length <= 2) {
                                  return 'Invalid Name';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _authData['name'] = value;
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Phone Number',
                                  icon: Icon(Icons.phone)),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty || value.length <= 9) {
                                  return 'Invalid Phone Number';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _authData['contact'] = value;
                              },
                            ),
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
                                hintText: 'Password (minimum 5 characters)',
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
                              minWidth: 250,
                              height: 50,
                              child: RaisedButton(
                                  child: Text('Register'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  color: Colors.black,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    _register();
                                  }),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ButtonTheme(
                              minWidth: 250,
                              height: 50,
                              child: RaisedButton(
                                  child: Text('Login'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  color: Colors.yellow,
                                  textColor: Colors.black,
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        LoginScreen.routeName);
                                  }),
                            )
                          ],
                        ),
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
