import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/widgets/safe_click_widget.dart';

enum InputFieldType {
  text,
  email,
  password,
  name,
}

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final InputFieldType type;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool showPasswordToggle;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool enabled;
  final int? maxLines;
  final String? errorText;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.type,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.showPasswordToggle = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.maxLines = 1,
    this.errorText,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText || widget.showPasswordToggle;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  TextInputType _getKeyboardType() {
    if (widget.keyboardType != null) return widget.keyboardType!;

    switch (widget.type) {
      case InputFieldType.email:
        return TextInputType.emailAddress;
      case InputFieldType.name:
        return TextInputType.name;
      case InputFieldType.password:
        return TextInputType.visiblePassword;
      case InputFieldType.text:
      default:
        return TextInputType.text;
    }
  }

  Widget? _getSuffixIcon() {
    if (widget.suffixIcon != null) return widget.suffixIcon;

    if (widget.showPasswordToggle) {
      return SafeClickWidget(
        onTap: _togglePasswordVisibility,
        child: Icon(
          _isObscured
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: AppColors.grayText,
          size: 20.sp,
        ),
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 54.h,
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(
              color: widget.errorText != null
                  ? Colors.red.withOpacity(0.5)
                  : Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: TextFormField(
            controller: widget.controller,
            obscureText: _isObscured,
            keyboardType: _getKeyboardType(),
            enabled: widget.enabled,
            maxLines: widget.maxLines,
            style: AppTextStyles.inputText,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                height: 1.5,
                letterSpacing: 0,
              ),
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.all(16.w),
                      child: widget.prefixIcon!,
                    )
                  : null,
              suffixIcon: _getSuffixIcon() != null
                  ? Padding(
                      padding: EdgeInsets.all(16.w),
                      child: _getSuffixIcon()!,
                    )
                  : null,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
            ),
            onChanged: widget.onChanged,
          ),
        ),
        if (widget.errorText != null) ...[
          SizedBox(height: 6.h),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              widget.errorText!,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
