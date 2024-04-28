// ignore_for_file: prefer_initializing_formals, unnecessary_this

import 'package:empresta/app/theme/app_colors.dart';
import 'package:empresta/app/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextFormField extends GetView {
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextEditingController? textEditingController;

  final Color? fillColor;
  final Color? borderColor;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    Key? key,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.textInputAction,
    this.inputFormatters,
    required this.labelText,
    this.validator,
    this.keyboardType,
    this.textCapitalization,
    this.textEditingController,
    required this.fillColor,
    required this.borderColor,
  }) : super(key: key);

  const CustomTextFormField.money({
    Key? key,
    Function(String)? onChanged,
    Function(String)? onFieldSubmitted,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
    required List<TextInputFormatter>? inputFormatters,
    String? labelText,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    TextCapitalization? textCapitalization,
    bool? passwordVisible,
    VoidCallback? onTapPasswordVisible,
    this.textEditingController,
    required this.fillColor,
    required this.borderColor,
  })  : this.onChanged = onChanged,
        this.onFieldSubmitted = onFieldSubmitted,
        this.focusNode = focusNode,
        this.textInputAction = textInputAction,
        this.inputFormatters = inputFormatters,
        this.labelText = labelText ?? "",
        this.validator = validator,
        this.keyboardType = keyboardType,
        this.textCapitalization = textCapitalization,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      textAlign: TextAlign.left,
      controller: textEditingController,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      cursorColor: AppColors.primaryGray,
      style: defaultTextStyle,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        fillColor: fillColor,
        filled: true,
        labelText: labelText,
        alignLabelWithHint: true,
        labelStyle: const TextStyle(color: AppColors.primaryGray),
        hintStyle: const TextStyle(color: AppColors.primaryGray),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.black,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.black,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
