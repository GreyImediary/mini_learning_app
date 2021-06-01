import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_learning_app/ui/colors.dart';
import 'package:mini_learning_app/ui/widgets/test_widgets/options_widget/one_of_option_widget.dart';

part 'one_of_option.g.dart';

@JsonSerializable()
class OneOfOption {
  final int id;
  final String text;
  @JsonKey(name: 'url')
  final String? imageUrl;
  final bool? isCorrect;
  final int? order;

  OneOfOption(
    this.id,
    this.text,
    this.imageUrl,
    this.isCorrect,
    this.order,
  );

  Widget render(
    bool showCorrectness,
    bool isDisabled,
    OneOfOption? groupValue,
    ValueChanged<OneOfOption?>? onChanged,
  ) {
    if (showCorrectness) {
      if (isCorrect != null && isCorrect!) {
        return OneOfOptionWidget(
          value: this,
          groupValue: groupValue,
          onChanged: onChanged,
          containerColor: green,
          borderColor: green,
          textColor: Colors.white,
          isRadioShown: false,
          isDisabled: isDisabled,
        );
      } else if (isCorrect != null && !isCorrect!) {
        return OneOfOptionWidget(
          value: this,
          groupValue: groupValue,
          onChanged: onChanged,
          containerColor: error,
          borderColor: error,
          textColor: Colors.white,
          isRadioShown: false,
          isDisabled: isDisabled
        );
      }
    }
    return OneOfOptionWidget(
      value: this,
      groupValue: groupValue,
      onChanged: onChanged,
      isDisabled: isDisabled,
    );
  }

  factory OneOfOption.fromJson(Map<String, dynamic> json) =>
      _$OneOfOptionFromJson(json);

  Map<String, dynamic> toJson() => _$OneOfOptionToJson(this);
}
