import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:registration_ui/pages/logginig_page.dart';
import 'package:registration_ui/translations/locale_keys.g.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../model/user.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _hidepassword = true;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final _fullnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();

  final _fullnameFocus = FocusNode();
  final _usernameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  final maskFormatter = MaskTextInputFormatter(mask: '+7(###)###-##-##');

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
                    Color(0xFF4d3e96),
                    Color(0xFF924cba),
                    Color(0xFF4d3e96)
                  ]),
            ),
            child: ListView(
              padding: const EdgeInsets.only(
                  top: 200, bottom: 250, right: 40, left: 40),
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: GradientText(
                    LocaleKeys.registr.tr(),
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    colors: const [Color(0xFFd2089a), Color(0xFFdf2166)],
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  focusNode: _fullnameFocus,
                  autofocus: true,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _fullnameFocus, _usernameFocus);
                  },
                  controller: _fullnameController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFB39DDB),
                      hintText: LocaleKeys.inputfullname,
                      prefixIcon: Icon(Icons.people, color: Color(0xFF9575CD)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: Color(0xFF9575CD), width: 2.0),
                      )),
                  validator: validateFullName,
                  onSaved: (value) => newUser.fullname = value!,
                ),
                const SizedBox(height: 7),
                TextFormField(
                  focusNode: _usernameFocus,
                  autofocus: true,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _usernameFocus, _emailFocus);
                  },
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFB39DDB),
                      hintText: "Enter username",
                      prefixIcon: Icon(
                        Icons.assignment_ind,
                        color: Color(0xFF9575CD),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: Color(0xFF9575CD), width: 2.0),
                      )),
                  validator: validateUsername,
                  onSaved: (value) => newUser.username = value!,
                ),
                const SizedBox(height: 7),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFB39DDB),
                      hintText: "Enter email address",
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: Color(0xFF9575CD),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: Color(0xFF9575CD), width: 2.0),
                      )),
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                  onSaved: (value) => newUser.email = value!,
                ),
                const SizedBox(height: 7),
                TextFormField(
                  focusNode: _phoneFocus,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _phoneFocus, _passFocus);
                  },
                  controller: _phoneController,
                  // maxLength: 10,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFB39DDB),
                      hintText: "Phone format: (XXX)XXX-XXXX",
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color(0xFF9575CD),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: Color(0xFF9575CD), width: 2.0),
                      )),
                  keyboardType: TextInputType.phone,
                  // inputFormatters: [
                  //   maskFormatter,
                  //   FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,10}$'),
                  //       allow: true),
                  // ],
                  inputFormatters: [maskFormatter],
                  // validator: (value) => validatePhoneNumber(value!)
                  //     ? null
                  //     : 'Phone number must be entered as (###)###-####',
                  onSaved: (value) => newUser.phone = value!,
                ),
                const SizedBox(height: 7),
                TextFormField(
                  focusNode: _passFocus,
                  controller: _passController,
                  obscureText: _hidepassword,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFB39DDB),
                      hintText: "Enter password",
                      suffixIcon: IconButton(
                        icon: Icon(
                            _hidepassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xFF9575CD)),
                        onPressed: () {
                          setState(() {
                            _hidepassword = !_hidepassword;
                          });
                        },
                      ),
                      prefixIcon: const Icon(
                        Icons.password,
                        color: Color(0xFF9575CD),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: Color(0xFF9575CD), width: 2.0),
                      )),
                  validator: _validatePassword,
                ),
                const SizedBox(height: 10),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    gradient: const LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Color(0xFFBA68C8), Color(0xFF8E24AA)],
                    ),
                  ),
                  height: 35,
                  child: MaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const StadiumBorder(),
                    onPressed: _submitForm,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 115),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'SUBMIT',
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
                      child: const Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogginigPage(
                              usersInfo: newUser,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Sing in',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.amberAccent,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showDialog(name: _fullnameController.text);
    } else {
      _showMessage(message: 'Incorrectly filled data! Please try again');
    }
  }

  String? validateFullName(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return 'Fullname is reqired.';
    } else if (!nameExp.hasMatch(value)) {
      return 'Please enter alphabetical characters.';
    } else {
      return null;
    }
  }

  String? validateUsername(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return 'Username is reqired.';
    } else if (!nameExp.hasMatch(value)) {
      return 'Please enter alphabetical characters.';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (value == null) {
      return 'Email cannot be empty';
    } else if (!_emailController.text.contains('@')) {
      return 'Invalid email address';
    } else {
      return null;
    }
  }

  // bool validatePhoneNumber(String input) {
  //   final phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\-\d\d$');
  //   return phoneExp.hasMatch(input);
  // }

  String? _validatePassword(String? value) {
    if (_passController.text.length <= 7) {
      return '8 character required for password';
    } else {
      return null;
    }
  }

  void _showDialog({required String name}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          title: const Text(
            'Done',
            style: TextStyle(
                color: Color(0xFF9575CD),
                fontFamily: 'helvetica_neue_light',
                fontSize: 23),
          ),
          content: Text(
            '$name good job',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
              fontFamily: 'helvetica_neue_light',
            ),
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF9575CD)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: const BorderSide(color: Color(0xFF9575CD))))),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogginigPage(
                      usersInfo: newUser,
                    ),
                  ),
                );
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontFamily: 'helvetica_neue_light',
                ),
              ),
            ),
          ],
        );
      },
    );
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
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 15),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
