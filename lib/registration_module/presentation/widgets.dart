import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            child: const Text(
              'نسيت كلمة المرور؟',
              style: TextStyle(
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

    Get.defaultDialog(
      title: 'أدخل بريدك الإلكتروني',
      content: Form(
        key: forgetPasswordFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // const Text(
            //   'أدخل بريدك الإلكتروني',
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
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
                AuthController().resetPassword(email: emailController.text.trim());
                RebiMessage.success(msg: 'راجع بريدك الإلكتروني');
              } catch (e, s) {
                RebiMessage.error(msg: 'حدث خطأ');
                Print.err(e, s);
              }
              Get.back();
            }
          },
          child: const Text('متابعة'),
        ),
      ],
    );
  }
}
