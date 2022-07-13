import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebi_store/shared/styles/colors.dart';
import 'package:rebi_store/shared/styles/styles.dart';



Widget rebiButton({
  double? width,
  double radius = 50.0,
  double elevation = 0.0,
  Color background = MyColors.primaryColor,
  Color? borderColor,
  Color color = activeButtonColor,
  required VoidCallback? onPressed,
  required String text,
  bool isLoading = false,
  double fontSize = 15.0,
}) {
  return ElevatedButton(
    onPressed: isLoading || onPressed == null
        ? null
        : () {
      onPressed();
    },
    style: ButtonStyle(
      minimumSize:
      width != null ? MaterialStateProperty.all(Size(width, 45)) : null,
      elevation: MaterialStateProperty.all(elevation),
      backgroundColor: MaterialStateProperty.all(background),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: borderColor ?? background, width: 1.5),
        ),
      ),
    ),
    child: isLoading
        ? SizedBox(
      height: 25.0,
      width: 25.0,
      child: CircularProgressIndicator(
        color: color,
      ),
    )
        : Text(
      text,
      style: mainStyle.copyWith(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
      ),
    ),
  );
}


rebiErrorBox(String? errorMessage) {
  return SizedBox(
    height: 50,
    child: errorMessage != null
        ? ListTile(
      title: Text(
        errorMessage,
        style: mainStyle.copyWith(
          color: Get.theme.errorColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(
        Icons.info,
        color: Get.theme.errorColor,
      ),
    )
        : const SizedBox(),
  );
}

pageTitle(String title, {double? width = double.infinity}) => SizedBox(
  width: width,
  child: Text(
    title,
    textAlign: TextAlign.right,
    style: titleStyle,
  ),
);



class SelectWidget<T> extends StatelessWidget {
  const SelectWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    this.onDelete,
    required this.hint,
    required this.items,
    this.isExpanded = true,
    this.icon = const SizedBox(),
  }) : super(key: key);

  final T? value;
  final Function onChanged;
  final Function(T)? onDelete;
  final String hint;
  final List<T?> items;
  final bool isExpanded;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButton<T?>(
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(hint),
        ),
        value: value,
        isExpanded: isExpanded,
        icon: icon,
        // alignment: Alignment.centerRight,
        items: items.map(
              (val) {
            return DropdownMenuItem<T?>(
              value: val,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  val != null ? val.toString() : hint,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        ).toList(),
        onChanged: (val) {
          onChanged(val);
        },
        underline: const SizedBox(),
      ),
    );
    // return Container(
    //   width: double.infinity,
    //   height: 40,
    //   decoration: BoxDecoration(
    //     color: Colors.grey[200],
    //     borderRadius: BorderRadius.circular(6),
    //   ),
    //   child: DropdownButton<T?>(
    //     hint: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 16),
    //       child: Text(hint),
    //     ),
    //     value: value,
    //     isExpanded: true,
    //     iconSize: 30.0,
    //     items: items.map(
    //       (val) {
    //         return DropdownMenuItem<T?>(
    //           value: val,
    //           child: Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 16),
    //             child: onDelete != null
    //                 ? Row(
    //                     children: [
    //                       Text(
    //                         val != null ? val.toString() : hint,
    //                         maxLines: 1,
    //                         overflow: TextOverflow.ellipsis,
    //                       ),
    //                       const Expanded(child: SizedBox()),
    //                       if (val != null)
    //                         IconButton(
    //                           onPressed: () {
    //                             onDelete!(val);
    //                           },
    //                           icon: const VatoorDeleteIcon(),
    //                         ),
    //                     ],
    //                   )
    //                 : Text(
    //                     val != null ? val.toString() : hint,
    //                     maxLines: 1,
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //           ),
    //         );
    //       },
    //     ).toList(),
    //     onChanged: (val) {
    //       onChanged(val);
    //     },
    //     underline: const SizedBox(),
    //   ),
    // );
  }
}
