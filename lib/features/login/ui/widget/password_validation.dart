import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/helpers/spacing.dart';
import 'package:iug_finder/core/theming/colors.dart';

import '../../../../core/theming/styles.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation(
      {super.key,
      required this.hasUpperCase,
      required this.hasLowerCase,
      required this.hasNumbers,
      required this.hasSpecialCharacters,
      required this.hasMinLength});
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasNumbers;
  final bool hasSpecialCharacters;
  final bool hasMinLength;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        buildValidationRow(tr('upper_case'), hasUpperCase),
        verticalSpace(6),
        buildValidationRow(tr('lower_case'), hasLowerCase),
        verticalSpace(6),
        buildValidationRow(tr('digit'), hasNumbers),
        verticalSpace(6),
        buildValidationRow(tr('special_char'), hasSpecialCharacters),
        verticalSpace(6),
        buildValidationRow(tr('length'), hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidate) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5.r,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font14BlackSemiBold.copyWith(
            decoration: hasValidate ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidate ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
