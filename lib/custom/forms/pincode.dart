import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField({
    super.key,
    required this.controller,
    required this.onCompleted,
    this.validator,
  });

  final TextEditingController controller;
  final Function(String code) onCompleted;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PinCodeTextField(
      appContext: context,
      length: 4,
      useHapticFeedback: !kIsWeb,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      keyboardType: TextInputType.number,
      animationType: AnimationType.scale,
      hintCharacter: '0',
      textStyle: TextStyle(
        fontSize: 40,
        color: theme.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      hintStyle: TextStyle(
        fontSize: 40,
        color: theme.textTheme.bodyMedium?.color,
        fontWeight: FontWeight.bold,
      ),
      validator: validator,
      pinTheme: PinTheme(
        fieldHeight: 90,
        fieldWidth: 80,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(16),
        fieldOuterPadding: const EdgeInsets.only(right: 10),
        inactiveFillColor: Colors.transparent,
        inactiveColor: theme.textTheme.bodyMedium?.color,
        selectedFillColor: Colors.transparent,
        selectedColor: theme.primaryColor,
        activeColor: theme.primaryColor,
        activeFillColor: Colors.transparent,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      enablePinAutofill: false,
      showCursor: true,
      autovalidateMode: AutovalidateMode.disabled,
      cursorColor: theme.primaryColor,
      cursorWidth: 3,
      controller: controller,
      onCompleted: onCompleted,
      onChanged: (value) {},
      onTap: () {
        if (controller.text.length == 4) {
          controller.text = '';
        }
      },
    );
  }
}
