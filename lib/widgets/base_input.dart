import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseInput extends StatelessWidget {
  const BaseInput({
    super.key,
    this.title = '',
    this.hintText = '',
    this.bgColor,
    this.textStyle,
    this.hintTextStyle,
    this.radius = 16,
    this.label = '',
    this.suffixIcon,
    this.prefixIcon,
    this.isRequired = false,
    this.onTapOutside,
    this.controller,
    this.onTap,
    this.labelTextStyle,
    this.minLines,
    this.maxLines,
    this.borderWidth,
    this.autofocus = false,
    this.onChanged,
    this.readOnly = false,
    this.obscureText = false,
    this.enabledBorderColor,
    this.validator,
    this.inputFormatters,
    this.isDropdown = false,
    this.items,
    this.maxLength,
    this.keyboardType,
  });
  final String title;
  final String hintText;
  final Color? bgColor;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final double radius;
  final String label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isRequired;
  final Function(PointerDownEvent event)? onTapOutside;
  final TextEditingController? controller;
  final Function? onTap;
  final int? minLines;
  final int? maxLines;
  final double? borderWidth;
  final bool autofocus;
  final Function(String value)? onChanged;
  final bool readOnly;
  final bool obscureText;
  final Color? enabledBorderColor;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool isDropdown;
  final List<DropdownMenuItem<Object?>>? items;
  final int? maxLength;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != '')
          Row(children: [
            Text(label, style: Theme.of(context).inputDecorationTheme.labelStyle),
            const SizedBox(width: 2),
            if (isRequired)
              Text(
                '*',
                style: Theme.of(context).inputDecorationTheme.errorStyle,
              ),
          ]),
        if (label != '') const SizedBox(height: 12),
        if (isDropdown) ...[
          DropdownButtonFormField(
            items: items ?? [],
            onChanged: (value) {
              if (onChanged != null) {
                onChanged!(value.toString());
              }
            },
            isExpanded: true,
            value: controller?.text.isNotEmpty ?? false ? int.tryParse(controller?.text ?? '') ?? 0 : null,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: const Color(0xFFBBBBBB), width: borderWidth ?? 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: const Color(0xFFBBBBBB), width: borderWidth ?? 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: Theme.of(context).hintColor, width: borderWidth ?? 1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: const Color(0xFFBBBBBB), width: borderWidth ?? 1),
              ),
              filled: true,
              fillColor: bgColor ?? Colors.white,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: hintTextStyle ?? Theme.of(context).inputDecorationTheme.labelStyle?.copyWith(color: Theme.of(context).hintColor),
            ),
          ),
        ] else ...[
          TextFormField(
            maxLength: maxLength,
            controller: controller,
            keyboardType: keyboardType,
            onTap: () => onTap?.call(),
            onChanged: (value) => onChanged?.call(value),
            onTapOutside: onTapOutside,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: inputFormatters,
            minLines: minLines,
            autofocus: autofocus,
            maxLines: maxLines,
            validator: validator,
            decoration: InputDecoration(
              counter: const SizedBox(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: const Color(0xFFBBBBBB), width: borderWidth ?? 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: const Color(0xFFBBBBBB), width: borderWidth ?? 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: Theme.of(context).hintColor, width: borderWidth ?? 1.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: const Color(0xFFBBBBBB), width: borderWidth ?? 1),
              ),
              filled: true,
              fillColor: bgColor ?? Theme.of(context).primaryColor,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: hintTextStyle ?? Theme.of(context).inputDecorationTheme.labelStyle?.copyWith(color: Theme.of(context).hintColor),
            ),
            obscureText: obscureText,
            readOnly: readOnly,
            style: labelTextStyle ?? Theme.of(context).inputDecorationTheme.labelStyle,
            cursorColor: Theme.of(context).focusColor,
            textInputAction: TextInputAction.done,
          ),
        ]
      ],
    );
  }
}
