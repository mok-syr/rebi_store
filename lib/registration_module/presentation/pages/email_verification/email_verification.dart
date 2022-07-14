import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebi_store/registration_module/core/utils/extensions.dart';
import 'package:rebi_store/registration_module/presentation/pages/start_page/start_page.dart';
import 'package:rebi_tools/rebi_tools.dart';

import '../../components/components.dart';
import '../../get_x/auth_controller.dart';
import '../../themes/styles.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({Key? key, required this.email})
      : super(key: key);

  final String email;

  @override
  EmailVerificationPageState createState() => EmailVerificationPageState();
}

class EmailVerificationPageState extends State<EmailVerificationPage> {
  final AuthController _authController = Get.find();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _authController.signOut();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title:  Text(
            'email_verification'.tra,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100.0,
              ),
              SvgPicture.asset(
                'assets/svg/mail_sent.svg',
                height: context.mSize.height * 0.2,
              ),
              const SizedBox(
                height: 60.0,
              ),
              Text(
                'email_sent_to'.tra,
                textAlign: TextAlign.center,
                style: mainStyle.copyWith(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                widget.email,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              rebiButton(
                text: 'verified'.tra,
                onPressed: () async {
                  await _authController.reloadUser();
                  Get.off(() => const StartPage());
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () {
                  _authController.sendEmailVerification();
                },
                child: Text(
                  'resend_email'.tra,
                  style: mainStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
