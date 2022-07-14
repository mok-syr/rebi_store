import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebi_store/registration_module/core/utils/extensions.dart';
import 'package:rebi_store/tools/printer.dart';
import 'package:rebi_store/tools/rebi_message.dart';
import 'package:rebi_store/tools/validator.dart';

import '../../shared/components/rebi_input.dart';
import 'get_x/auth_controller.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              forgetPasswordDialog();
            },
            child: Text(
              'forget_password'.tra,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void forgetPasswordDialog() async {
    final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    final AuthController authController = Get.find();


    Get.defaultDialog(
      title: 'enter_your_email'.tra,
      content: Form(
        key: forgetPasswordFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
                RebiInput(
              controller: emailController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              validator: Validator.requiredValidator,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            if (forgetPasswordFormKey.currentState!.validate()) {
              try {
                authController.resetPassword(email: emailController.text.trim());
                RebiMessage.success(msg: 'reset_email_sent'.tra);
              } catch (e, s) {
                RebiMessage.error(msg: 'error_occurred'.tra);
                Print.err(e, s);
              }
              Get.back();
            }
          },
          child: Text('continue'.tra),
        ),
      ],
    );
  }
}
