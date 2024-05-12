import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:store_app/shared/widgets/textFormField.dart';

class CustomDateTimePicker extends StatelessWidget {
  CustomDateTimePicker(
      {Key? key,
      required this.onChanged,
      this.label = "تاريخ",
      required this.date1,
      this.showLabel = true,
      this.validator,
      this.flex,
      this.normalFilter = false,
      this.requiredStart = false})
      : super(key: key);
  final Function(String?) onChanged;
  final TextEditingController date1;
  bool showLabel;
  final String label;
  final String? Function(String?)? validator;
  DateTime? dateTime;
  final int? flex;
  final bool normalFilter;
  final bool requiredStart;
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        validator: validator,
        initialValue: date1.text,
        builder: (state) {
          return DefultTextFormField(
            isFilledColor: true,
            fillColor: Colors.white,
            hintText: "search_salary".tr(),
            textSize: 20.0,
            textStyle: TextStyle(fontSize: 20.0),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            textController: date1,
            prefix: IconButton(
              onPressed: () async {
                dateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.parse("2000-01-01"),
                    lastDate: DateTime.parse("2050-01-01"));
                if (dateTime != null) {
                  final now = DateTime.now();
                  // add hours and minutes to the selected date
                  dateTime = DateTime(dateTime!.year, dateTime!.month,
                      dateTime!.day, now.hour, now.minute, now.second);
                  date1.text = DateFormat("yyyy-MM-dd").format(dateTime!);
                 state.didChange(date1.text);
                  onChanged(date1.text);
                }
              },
              icon: Icon(
                Icons.calendar_month,
                color: Colors.black,
                size: 30.0,
              ),
            ),
          );
        });
  }
}
