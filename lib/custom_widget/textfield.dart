import 'package:flutter/material.dart';

class DoctorTextField extends StatelessWidget {
  final String hint;
  final String? text;
  final bool isPasswordField;
  final bool enable;
  final int? maxLength;
  final dynamic inputFormatters;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final Function()? onTabPressed;
  final Function()? onTap;
  final Function(String? value)? onSaved;
  final Function(String? value)? onTextChange;
  final String? Function(String? value)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isReadOnly;
  final int? maxLine;
  final String? infoMessage;
  final TextEditingController? controller;

  const DoctorTextField(
      {Key? key,
        this.onSaved,
        this.validator,
        this.maxLength,
        this.inputFormatters,
        this.text,
        this.focusNode,
        this.onTabPressed,
        this.onTap,
        this.isPasswordField = false,
        this.enable = true,
        this.onTextChange,
        this.suffixIcon,
        this.prefixIcon,
        this.isReadOnly = false,
        this.maxLine = 1,
        this.keyboardType = TextInputType.text,
        this.infoMessage,
        this.controller,
        required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: isReadOnly,
      initialValue: text,
      onSaved: onSaved,
      validator: validator,
      maxLength: maxLength,
      onChanged: onTextChange,
      enabled: enable,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: isPasswordField,
      style: Theme.of(context).textTheme.bodyMedium,
      onTap: onTap,
      maxLines: maxLine,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        filled: enable,
        fillColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: false,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey,fontSize: 16),
        counter: const Offstage(),
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints.tight(const Size(44, 24)),
        prefixIconConstraints: BoxConstraints.tight(const Size(44, 24)),
        prefixIcon: prefixIcon,
        errorMaxLines: 3,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 0,color: Colors.white)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(width: 0,color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(width: 0,color: Colors.white))
      ),
    );
  }
}
