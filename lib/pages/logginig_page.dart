import 'package:flutter/material.dart';
import 'package:registration_ui/pages/registration_page.dart';
import 'package:registration_ui/pages/welcome_page.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../model/user.dart';

class LogginigPage extends StatefulWidget {
  const LogginigPage({Key? key, required User usersInfo}) : super(key: key);

  @override
  State<LogginigPage> createState() => _LogginigPageState();
}

class _LogginigPageState extends State<LogginigPage> {
  bool _hidepassword = true;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _usernameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passFocus = FocusNode();

  User newUser = User();

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: _formKey,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFf9cc7b),
                    Color(0xFFf7764a)
                  ]),
            ),
            child: ListView(
              padding: const EdgeInsets.only(
                  top: 210, bottom: 240, right: 40, left: 40),
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: GradientText(
                    "LOGIN",
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight:FontWeight.bold,
                    ),
                    colors: const [
                      Color(0xFFf15256),
                      Color(0xFFf15256)],),
                ),
                const SizedBox(height: 15),

                TextFormField(
                  focusNode: _usernameFocus,
                  autofocus: true,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _usernameFocus, _emailFocus);
                  },
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFf5da8b),
                      labelText: "Username",
                      hintText: "Enter username",
                      prefixIcon: Icon(
                        Icons.assignment_ind,
                        color: Color(0xFFe47449),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                        BorderSide(color: Colors.transparent, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                        BorderSide(color: Color(0xFFe47449), width: 2.0),
                      )),
                  validator: validateloginUsername,
                  onSaved: (value) => newUser.username = value!,
                ),

                const SizedBox(height: 7),

                TextFormField(
                  focusNode: _emailFocus,
                  autofocus: true,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _emailFocus, _passFocus);
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFf5da8b),
                      labelText: "Email address",
                      hintText: "Enter email address",
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: Color(0xFFe47449),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                        BorderSide(color: Colors.transparent, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                        BorderSide(color: Color(0xFFe47449), width: 2.0),
                      )),
                  validator: validatelloginEmail,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => newUser.email = value!,

                ),

                const SizedBox(height: 7),

                TextFormField(
                  focusNode: _passFocus,
                  controller: _passController,
                  obscureText: _hidepassword,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFf5da8b),
                      labelText: "Password",
                      hintText: "Enter password",
                      suffixIcon: IconButton(
                        icon: Icon(
                            _hidepassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xFFe47449)),
                        onPressed: () {
                          setState(() {
                            _hidepassword = !_hidepassword;
                          });
                        },
                      ),
                      prefixIcon: const Icon(
                        Icons.password,
                        color: Color(0xFFe47449),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                        BorderSide(color: Colors.transparent, width: 2.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                        BorderSide(color: Color(0xFFe47449), width: 2.0),
                      )),
                  validator: _validateloginPassword,
                ),

                const SizedBox(height: 10),

                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    gradient: const LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color(0xFFf15256),
                        Color(0xFFff6b29)],
                    ),
                  ),
                  height: 35,
                  child: MaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const StadiumBorder(),
                    onPressed: _submitloginForm,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 115),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:const [
                          Text(
                            'Sign In',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text("Don't have a account?",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 13
                        ),),
                    ),
                    TextButton(
                      onPressed:() {
                        Navigator.push( context,
                          MaterialPageRoute(
                            builder: (context) => WelcomePage(
                              usersInfo: newUser,
                            ),
                          ),
                        );},
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFdd434f),
                          fontSize: 14,
                        ),
                      ),)
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void _submitloginForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomePage(
            usersInfo: newUser,
          ),
        ),
      );
    } else {
      _showMessage(message: 'Incorrectly filled data! Please try again');
    }
  }


  String? validateloginUsername(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return 'Username is reqired.';
    } else if (!nameExp.hasMatch(value)) {
      return 'Please enter alphabetical characters.';
    } else {
      return null;
    }
  }

  String? validatelloginEmail(String? value) {
    if (value == null) {
      return 'Email cannot be empty';
    } else if (!_emailController.text.contains('@')) {
      return 'Invalid email address';
    } else {
      return null;
    }
  }


  String? _validateloginPassword(String? value) {
    if (_passController.text.length <= 7) {
      return '8 character required for password';
    }  else {
      return null;
    }
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: const Color(0xFFEF5350),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 15
          ),),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
    );
  }
}
