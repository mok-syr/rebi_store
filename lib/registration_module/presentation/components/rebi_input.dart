import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../themes/colors.dart';
import '../themes/styles.dart';

class RebiInput extends StatefulWidget {
  const RebiInput({
    Key? key,
    this.radius = 6.0,
    this.background ,
    this.color = textColor1,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.onSave,
    this.onFieldSubmitted,
    this.onChanged,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.initialValue,
    this.textAlign = TextAlign.start,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    this.borderSide = const BorderSide(color: inputBackground, width: 1.0),
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.inputFormatters,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.isOptional = false,
    this.autofocus = false,
  }) : super(key: key);

  final double radius;
  final Color? background;
  final Color color;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final FormFieldSetter<String>? onSave;
  final FormFieldSetter<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onChanged;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? initialValue;
  final TextAlign textAlign;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final BorderSide borderSide;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autoValidateMode;
  final bool isOptional;
  final bool autofocus;

  @override
  State<RebiInput> createState() => _RebiInputState();
}

class _RebiInputState extends State<RebiInput> {
  late bool showPassword;

  @override
  void initState() {
    showPassword = widget.obscureText;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null) ...[
          Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.labelText!,
                style: mainStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.isOptional) ...[
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'optional',
                  style: mainStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                    fontSize: 9,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
        TextFormField(
          autofocus: widget.autofocus,
          controller: widget.controller,
          textAlign: widget.textAlign,
          textAlignVertical: TextAlignVertical.center,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          initialValue:
              widget.initialValue == 'null' ? null : widget.initialValue,
          style: mainStyle,
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          onChanged: (value) {
            if (widget.onChanged == null) {
              return;
            }
            widget.onChanged!(value);
          },
          onFieldSubmitted: (value) {
            if (widget.onFieldSubmitted == null) {
              return;
            }
            widget.onFieldSubmitted!(value);
          },
          onTap: () {
            if (widget.onTap == null) {
              return;
            }
            widget.onTap!();
          },
          onSaved: (newValue) {
            if (widget.onSave == null) {
              return;
            }
            widget.onSave!(newValue);
          },
          validator: (value) {
            return widget.validator(value);
          },
          autovalidateMode: widget.autoValidateMode,
          obscureText: showPassword,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: widget.contentPadding,
            prefixIcon: widget.prefixIcon,
            suffixIcon: _buildSuffixWidget(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
              borderSide: widget.borderSide,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
              borderSide: widget.borderSide,
            ),
            fillColor: widget.background,
            filled: true,
            alignLabelWithHint: true,
            labelStyle: inputHintStyle(color: widget.color),
            hintStyle: inputHintStyle(color: widget.color),
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }

  Widget? _buildSuffixWidget() {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    } else {
      return widget.obscureText
          ? IconButton(
        focusNode: FocusNode(skipTraversal: true),
        icon: showPassword
            ? const Icon(
          CupertinoIcons.eye,
          size: 20.0,
        )
            : const Icon(
          CupertinoIcons.eye_slash,
          size: 20.0,
        ),
        onPressed: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
      )
          : null;
    }
  }

}
