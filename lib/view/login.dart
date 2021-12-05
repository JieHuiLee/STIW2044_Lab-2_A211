import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Set the variables
  late double screenHeight, screenWidth;

  //TextField that allow to enter
  final usernameController = TextEditingController();
  final pwdController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final focus1 = FocusNode();
  final focus2 = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          AppBar(
              backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.exit_to_app_rounded,
                  size: 20,
                  color: Colors.black,
                ),
              )),
          upperHalf(context),
          lowerHalf(context),
        ],
      ),
    );
  }

  bool _isChecked = false;
  bool _isObscure = true;
  @override
  Widget upperHalf(BuildContext context) {
    return SizedBox(
      height: screenHeight / 2,
      width: screenWidth,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/loginIcon.png'),
                fit: BoxFit.cover)),
      ),
    );
  }

  Widget lowerHalf(BuildContext context) {
    return SingleChildScrollView(
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
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                validator: (value) => value!.isEmpty ? "Fill the blanks" : null,
                focusNode: focus1,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focus2);
                },
                keyboardType: TextInputType.text,
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Enter your username',
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
              width: 300,
              margin: EdgeInsets.only(top: 50),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                validator: (value) => value!.isEmpty || (value.length < 3)
                    ? "name must be longer than 3"
                    : null,
                focusNode: focus1,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focus2);
                },
                obscureText: _isObscure,
                keyboardType: TextInputType.text,
                controller: pwdController,
                decoration: InputDecoration(
                  labelText: 'Enter your password',
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
                    child: Text('Remember me \t\t\t\t\t',
                        style: TextStyle(
                          fontSize: 12,
                        ))),
                GestureDetector(
                    onTap: null,
                    child: const Text(
                      "Forgot Password?",
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
                    color: Color.fromRGBO(178, 35, 52, 1),
                    child: Text(
                      "Login".toUpperCase(),
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Login Successfully!",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color.fromRGBO(189, 145, 136, 1),
                          textColor: Colors.white,
                          fontSize: 14.0);
                    },
                  ),
                ]),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Don't have an account? ",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(60, 59, 110, 1),
                    )),
                GestureDetector(
                    onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()))
                        },
                    child: const Text(
                      " Sign Up",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Color.fromRGBO(11, 79, 171, 1),
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
    );
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
