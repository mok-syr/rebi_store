// import 'package:chatty/tools/printer.dart';
// import 'package:firebase_storage/firebase_storage.dart' as str;
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class StorageController {
//   static SharedPreferences? prefs;
//
//   StorageController() {
//     createPreferences();
//   }
//
//   createPreferences() async {
//     prefs ??= await SharedPreferences.getInstance();
//     return;
//   }
//
//   Future getImage() async {
//     return await ImagePicker()
//         .pickImage(source: ImageSource.gallery, imageQuality: 50);
//   }
//
//   Future getImageFromCamera() {
//     return ImagePicker()
//         .pickImage(source: ImageSource.camera, imageQuality: 50);
//   }
//
//   Future uploadPic(img, userId) async {
//     String? url;
//     str.Reference firebaseStorageRef = str.FirebaseStorage.instance
//         .ref()
//         .child('profileImages')
//         .child(userId);
//         // .child(DateTime.now().millisecondsSinceEpoch.toString());
//     str.UploadTask uploadTask = firebaseStorageRef.putFile(img);
//     /*str.TaskSnapshot? taskSnapshot = */
//     await uploadTask.then((res) async {
//       url = await res.ref.getDownloadURL();
//       return;
//     });
//     return url;
//   }
//
//
//   double getFontSize() {
//     return 0;
//     // try {
//     //   double? fontSize = prefs!.getDouble('FontSize');
//     //   if (fontSize == null) return 0;
//     //   return fontSize;
//     // } catch (e) {
//     //   return 0;
//     // }
//   }
//
//   // setFontSize(double fontSize) {
//   //   return prefs!.setDouble('FontSize', fontSize);
//   // }
//
//   void setTheme(int value) async {
//     await prefs?.setInt('theme', value);
//   }
//
//   Future<int> getTheme() async {
//     prefs ??= await SharedPreferences.getInstance();
//     return prefs?.getInt('theme') ?? 0;
//   }
//
//   void setLang(String value) {
//     prefs?.setString('lang', value);
//   }
//
//   String getLang() {
//     return prefs?.getString('lang') ?? 'ar';
//   }
// }
