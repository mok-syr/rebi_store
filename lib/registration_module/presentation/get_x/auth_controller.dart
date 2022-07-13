import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../models/user_x/user_x.dart';
import '../../core/services/auth_web_service.dart';

class AuthController extends GetxController{
  final AuthWebService _webService = AuthWebService();
  FirebaseAuth auth = FirebaseAuth.instance;

  User? get getUser => _webService.getUser;

  Stream<User?> get userChangesStream => auth.authStateChanges();


  AuthPage authPage = AuthPage.signin;


  void changePage(AuthPage authPage){
    this.authPage = authPage;
    update();
  }
  /*
  *
  * */

  Future<void> signOut() async {
    return await _webService.signOut();
  }

  reloadUser() {
    return _webService.reloadUser();
  }



/*
*
*
*/
  Future signUpWithEmail({required String password,required UserX userX}) async {
    return _webService.signUpWithEmail(password: password, userX: userX);
  }

  Future signInWithEmail(String email, String password) async {
    return _webService.signInWithEmail(email, password);
  }

  sendEmailVerification() {
    return _webService.sendEmailVerification();
  }

  Future<void> updatePassword(String text) async {
    return _webService.updatePassword(text);
  }

  resetPassword({required String email}) {
    return _webService.resetPassword(email: email);
  }

}

enum AuthPage {
  signin,
  signup,
}
