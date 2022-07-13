import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../models/user_x/user_x.dart';
import '../../../tools/printer.dart';

class AuthWebService {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> users =
  FirebaseFirestore.instance.collection('users');


  FirebaseAuth auth = FirebaseAuth.instance;

  User? get getUser => auth.currentUser;




  Future signUpWithEmail({required String password,required UserX userX}) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: userX.email!, password: password);
    if (userCredential.user != null) {
      await userCredential.user!.updateDisplayName(userX.name);
    }
    User? user = userCredential.user;
    try {
      await user!.sendEmailVerification();
      String? userId = user.uid;
      userX.id = userId;
      await addUser(user: userX);
      Print.inf('User Added');
    } catch (e,s) {
      Print.err(e,s);
      return null;
    }
  }

  Future<String?> signInWithEmail(String email, String password) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    if (userCredential.user != null) return userCredential.user!.uid;
    return null;
  }

  sendEmailVerification() {
    User? user = auth.currentUser;
    if (user != null) user.sendEmailVerification();
  }

  Future<void> updatePassword(String text) {
    User? user = getUser;
    if (user != null) {
      return user.updatePassword(text);
    } else {
      return Future.error('error');
    }
  }


  addUser({required UserX user}){
    Map<String, dynamic> map = user.toJson();
    map['registerDate'] = FieldValue.serverTimestamp();
    return _firestore.collection('users').doc(user.id).set(map);
  }



  Future<void> signOut() async {
    return await auth.signOut();
  }

  reloadUser() {
    User? user = auth.currentUser;
    if (user != null) return user.reload();
  }

  resetPassword({required String email}) {
    return auth.sendPasswordResetEmail(email: email);
  }

}
