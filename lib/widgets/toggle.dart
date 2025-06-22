import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:higrow/constants/app_colors.dart';

class Toggle extends StatelessWidget {
  final bool isEnglish;
  final ValueChanged<bool> onChanged;

  const Toggle({super.key, required this.isEnglish, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 60,
      child: AnimatedToggleSwitch.dual(
        current: isEnglish,
        first: true,
        second: false,
        spacing: 16.0,
        style: ToggleStyle(
          borderColor: AppColors.transparent,
          backgroundColor: AppColors.orange,
          indicatorColor: AppColors.white,
        ),
        textBuilder:
            (value) => Text(
              value ? 'EN' : 'ID',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 9,
                fontWeight: FontWeight.w600,
              ),
            ),
        onChanged: onChanged,
      ),
    );
  }
}
