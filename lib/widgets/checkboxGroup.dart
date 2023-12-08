import 'package:flutter/material.dart';
import 'package:huvi_app1/core/utils/size_utils.dart';
import 'package:huvi_app1/theme/theme_helper.dart';
import 'package:huvi_app1/widgets/custom_checkbox_button.dart';

class CheckboxGroup extends StatefulWidget {
  final List<String> options;
  final List<String> selected;
  final Function(List<String>) onSelected;

  const CheckboxGroup({Key? key, required this.options, required this.selected, required this.onSelected}) : super(key: key);

  @override
  _CheckboxGroupState createState() => _CheckboxGroupState();
}

class _CheckboxGroupState extends State<CheckboxGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 54.v,
      width: 100.h,
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(bottom: 46.v),
      child: Wrap(
      spacing: 15.0,
      runSpacing: 15.0,
      children: List.generate(widget.options.length, (index) {
        final option = widget.options[index];
        final isSelected = widget.selected.contains(option);

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomCheckboxButton(
              text: option,
              value: isSelected,
              checkColor: isSelected ? appTheme.teal400 : null,
              onChange: (value) {
                setState(() {
                  if (value) {
                    widget.selected.add(option);
                  } else {
                    widget.selected.remove(option);
                  }
                  widget.onSelected(widget.selected);
                });
              },
            ),
          ],
        );
      }),
    ),
     
    );
  }
}
