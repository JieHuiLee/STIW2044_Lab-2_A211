import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'alertdialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //Set the variables
  String title = "AlertDialog";
  bool tappedYes = false;

  //TextField that allow to insert
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final confirmpwdController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  bool _isChecked = false;
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(217, 217, 217, 1), //#D9D9D9
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(189, 145, 136, 1),
          title: const Text(
            'Registration Page',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Open Sans Bold',
              color: Color.fromRGBO(178, 35, 52, 1),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("CUCKOO",
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Open Sans Bold',
                          color: Color.fromRGBO(178, 35, 52, 1),
                          fontWeight: FontWeight.bold)),
                  const Text("WATER FILTER",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Open Sans Bold',
                          color: Color.fromRGBO(60, 59, 110, 1),
                          fontWeight: FontWeight.bold)),
                  const Text("\nSign up for your account",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Open Sans Bold',
                          color: Color.fromRGBO(60, 59, 110, 1),
                          fontWeight: FontWeight.bold)),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Set up your username',
                        labelStyle: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(189, 145, 136, 1),
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        prefixIcon: const Icon(Icons.supervised_user_circle),
                        suffixIcon: IconButton(
                          onPressed: () => usernameController.clear(),
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Enter your email',
                        labelStyle: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(189, 145, 136, 1),
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        prefixIcon: const Icon(Icons.email),
                        suffixIcon: IconButton(
                          onPressed: () => usernameController.clear(),
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                  ),
                  Container(
                    child: TextField(
                      obscureText: _isObscure,
                      keyboardType: TextInputType.emailAddress,
                      controller: pwdController,
                      decoration: InputDecoration(
                        labelText: 'Enter password',
                        labelStyle: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(189, 145, 136, 1),
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        prefixIcon: const Icon(Icons.password_rounded),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off_rounded),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                  ),
                  Container(
                    child: TextField(
                      obscureText: _isObscure,
                      keyboardType: TextInputType.text,
                      controller: confirmpwdController,
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        labelStyle: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(189, 145, 136, 1),
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        prefixIcon: const Icon(Icons.password_rounded),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off_rounded),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            _onRememberMeChanged(value!);
                          }),
                      const Flexible(
                          child: Text('I accept all the ',
                              style: TextStyle(
                                fontSize: 12,
                              ))),
                      GestureDetector(
                          onTap: null,
                          child: const Text(
                            "Terms and Conditions",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Color.fromRGBO(11, 79, 171, 1),
                            ),
                          )),
                    ],
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () async {
                            final action = await AlertDialogs.yesCancelDialog(
                                context,
                                'Register New Account',
                                'Are you sure?');
                            if (action == DialogsAction.yes) {
                              setState(() => tappedYes = true);
                              Fluttertoast.showToast(
                                  msg: "Sign Up Successfully! ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      Color.fromRGBO(189, 145, 136, 1),
                                  textColor: Colors.white,
                                  fontSize: 14.0);
                            } else {
                              setState(() => tappedYes = false);
                              Fluttertoast.showToast(
                                  msg: "Cancel Registration!",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      Color.fromRGBO(189, 145, 136, 1),
                                  textColor: Colors.white,
                                  fontSize: 14.0);
                            }
                          },
                          padding: EdgeInsets.all(12.0),
                          color: Color.fromRGBO(178, 35, 52, 1),
                          child: Text(
                            "Sign Up".toUpperCase(),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Already have an account? ",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color.fromRGBO(60, 59, 110, 1),
                          )),
                      GestureDetector(
                          onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage())),
                              },
                          child: const Text(
                            " Log In",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(11, 79, 171, 1),
                              decoration: TextDecoration.underline,
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "\nYOUR SAFETY IS OUR NO.1",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(60, 59, 110, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _onRememberMeChanged(bool newValue) => setState(() {
        _isChecked = newValue;
        if (_isChecked) {
          // storemovepref(true);
        } else {
          //storemovepref(false);
        }
      });
}
