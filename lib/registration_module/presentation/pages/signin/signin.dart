import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebi_store/registration_module/core/utils/extensions.dart';
import '../../../core/utils/validator.dart';
import '../../components/components.dart';
import '../../components/rebi_input.dart';
import '../../get_x/auth_controller.dart';
import '../../themes/colors.dart';
import '../../widgets.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

  final AuthController authController = Get.find();


  String? _email;
  String? _password;
  String? errorMessage;
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool isWaiting = false;

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.longestSide,
          child: Form(
            key: _formKey,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
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
                    pageTitle('signin'.tra),
                    const Spacer(),

                    ///
                    /// End Title
                    ///

                    ///
                    /// Start Email
                    ///
                    RebiInput(
                      onSave: (value) {
                        _email = value;
                      },
                      validator: Validator.requiredValidator,
                      hintText: 'email'.tra,
                      initialValue: 'oday.aw97@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    ///
                    /// End Email
                    ///


                    ///
                    /// Start Password
                    ///
                    RebiInput(
                      onSave: (value) {
                        _password = value;
                      },
                      validator: Validator.requiredValidator,
                      hintText: 'password'.tra,
                      initialValue: '123456',
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    ///
                    /// End Password
                    ///


                    ///
                    ///Start dont_have_account
                    ///
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Text(
                            'dont_have_account'.tra,
                            style: const TextStyle(
                              fontSize: 15,
                              color: textColor1,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              authController.changePage(AuthPage.signup);
                            },
                            child: Text(
                              'create_account'.tra,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///
                    ///End dont_have_account
                    ///


                    ///
                    ///Start error message
                    ///
                    rebiErrorBox(errorMessage),
                    const SizedBox(
                      height: 10,
                    ),

                    ///
                    /// End error message
                    ///


                    ///
                    /// Start login button
                    ///
                    rebiButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          setState(() {
                            isWaiting = true;
                            errorMessage = null;
                          });
                          try {
                            await authController.signInWithEmail(
                                '$_email', '$_password');
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
                          } on Exception {
                            setState(() {
                              isWaiting = false;
                            });
                            return;
                          }
                        }
                      },
                      text: 'signin'.tra,
                      isLoading: isWaiting,
                    ),

                    ///
                    /// End login button
                    ///


                    ///
                    /// Start forget_password
                    ///

                    const ForgetPasswordButton(),

                    ///
                    /// End forget_password
                    ///


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
