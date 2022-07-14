
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebi_store/registration_module/core/utils/extensions.dart';
import 'package:rebi_tools/rebi_tools.dart';

import '../../../../models/user_x/user_x.dart';
import '../../../core/utils/validator.dart';
import '../../components/components.dart';
import '../../components/rebi_input.dart';
import '../../get_x/auth_controller.dart';
import '../../themes/colors.dart';



class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {

  final AuthController authController = Get.find();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();

  bool isCompany = false;
  final AuthController _authController = Get.find();


  // bool isWaiting = false;

  String? errorMessage;

  String? _email;
  String? _password, _name;
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool isWaiting = false;

  @override
  Widget build(BuildContext context) {
    Size size = context.mSize;
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.longestSide,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 20.0,
              ),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/svg/login.svg',
                    height: size.height * 0.25,
                  ),


                  ///
                  /// Start Title
                  ///
                  pageTitle('create_account'.tra),

                  ///
                  /// End Title
                  ///

                  const Expanded(
                    child: SizedBox(
                      height: 20.0,
                    ),
                  ),

                  RebiInput(
                    onSave: (value) {
                      _name = value;
                    },
                    validator: Validator.requiredValidator,
                    hintText: 'name'.tra,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RebiInput(
                    onSave: (value) {
                      _email = value;
                    },
                    validator: Validator.requiredValidator,
                    hintText: 'email'.tra,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RebiInput(
                    onSave: (value) {
                      _password = value;
                    },
                    validator: Validator.requiredValidator,
                    hintText: 'password'.tra,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'have_account'.tra,
                          style: TextStyle(
                            fontSize: 15,
                            color: textColor1,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            authController.changePage(AuthPage.signin);
                            },
                          child: Text(
                            'signin'.tra,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //error message
                  rebiErrorBox(errorMessage),

                  const SizedBox(
                    height: 10,
                  ),
                  rebiButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        setState(() {
                          isWaiting = true;
                          errorMessage = null;
                        });
                        try {
                          await _authController.signUpWithEmail(
                            userX: UserX(
                              name: _name,
                              email: _email!,
                              isVerified: false,
                            ),
                            password: _password!,
                          );
                        } on FirebaseAuthException catch (e) {
                          setState(() {
                            if (e.code == 'unknown') {
                              errorMessage = 'error_try_again'.tra;
                            } else {
                              errorMessage = e.code.tra;
                            }
                            isWaiting = false;
                          });
                          return;
                        } on Exception /* catch (e)*/ {
                          setState(() {
                            isWaiting = false;
                          });
                          return;
                        }
                      }
                    },
                    text: 'create_account'.tra,
                    color: activeButtonColor,
                    isLoading: isWaiting,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> birthDayPicker() async {
    DateTime? birthDate = await showDatePicker(
      context: context,
      initialDate: DateTime(1995),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (birthDate == null) {
      return;
    }
    _yearController.text = '${birthDate.year}';
    _monthController.text = '${birthDate.month}';
    _dayController.text = '${birthDate.day}';
  }
}
