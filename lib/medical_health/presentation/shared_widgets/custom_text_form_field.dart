import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,
    required this.textEditingController,
    this.borderRadius,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.filledColor,
    this.widget,
    this.type,
    this.isPassword = false,
    this.validate,
    this.onChange,
    this.onTap,
    this.readOnly = false,
    this.spacing,
  });

  final String text;
  final Color? textColor;
  final double? fontSize;
  final TextEditingController textEditingController;
  final double? borderRadius;
  final double? height;
  final Widget? prefixIcon;
  final dynamic suffixIcon;
  final Color? filledColor;
  final Widget? widget;
  final TextInputType? type;
  final bool? isPassword;
  final FormFieldValidator? validate;
  final Function(String)? onChange;
  final Function()? onTap;
  final bool readOnly;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 65,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: type ?? TextInputType.text,
        readOnly: readOnly,
        obscureText: isPassword!,
        onTap: onTap,
        validator: (String? value) {
          return validate!(value);
        },
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: const Color(0xff32343E),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18.0,
              horizontal: 14.0,
            ),
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            filled: true,
            fillColor: filledColor ?? ColorManager.textFromFieldColor,
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.red,
                )),
            errorStyle: TextStyle(
              fontSize: fontSize ?? 14,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
            hintText: text,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: spacing ?? 1,
              color: textColor ?? ColorManager.hintTextColor,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon),
        onChanged: onChange,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ));
  }
}
