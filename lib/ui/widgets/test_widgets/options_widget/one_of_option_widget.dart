import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_learning_app/model/test/option/one_of_option/one_of_option.dart';
import 'package:mini_learning_app/ui/colors.dart';

class OneOfOptionWidget extends StatelessWidget {
  final OneOfOption value;
  final OneOfOption? groupValue;
  final ValueChanged<OneOfOption?>? onChanged;

  final Color containerColor;
  final Color borderColor;
  final Color textColor;
  final bool isRadioShown;
  final bool isDisabled;

  OneOfOptionWidget({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.containerColor = Colors.white,
    this.borderColor = testOptionColor,
    this.textColor = onSurface,
    this.isRadioShown = true,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled
          ? null
          : onChanged == null
              ? null
              : () {
                  onChanged!(value);
                },
      child: Container(
        padding: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: borderColor, width: 1),
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                value.text,
                style: TextStyle(
                    fontSize: 14, color: textColor, fontFamily: 'MINIType'),
              ),
            ),
            Opacity(
              opacity: isRadioShown ? 1.0 : 0.0,
              child: Radio<OneOfOption>(
                value: value,
                activeColor: testOptionColor,
                groupValue: groupValue,
                onChanged: isDisabled ? null : onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
