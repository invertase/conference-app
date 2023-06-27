import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/theme.dart';
import 'app_buttons.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hintText,
    this.autofillHints,
    this.isPassword = false,
    this.onChanged,
    this.suffixIcon,
    this.onSuffixButtonPressed,
    this.inputFormatters,
    this.maxLines,
    this.minLines,
    this.fillColor,
    this.inputType,
  });

  final String? hintText;
  final Iterable<String>? autofillHints;
  final bool isPassword;
  final ValueChanged<String>? onChanged;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixButtonPressed;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      style: Theme.of(context).textTheme.bodyMedium,
      autofillHints: autofillHints,
      keyboardType: inputType,
      autocorrect: false,
      obscureText: isPassword,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? AppAdaptiveIconButton(
                onPressed: onSuffixButtonPressed,
                child: Icon(suffixIcon),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: AppRadius.kRadiusMedium,
          borderSide: BorderSide.none,
        ),
        fillColor: fillColor ??
            (isDark ? Colors.white.withOpacity(.03) : Colors.grey[100]),
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[300],
            ),
      ),
    );
  }
}
