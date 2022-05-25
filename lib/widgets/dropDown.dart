import 'package:flutter/material.dart';

class DropDownFormField extends FormField<String> {
  DropDownFormField(
      {Key? key,
      required FormFieldSetter<String> onSaved,
      required FormFieldValidator<String> validator,
      required List<String> items,
      required String? initialValue,
      required double height,
      required double width,
      required bool expert,
      required bool status})
      : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: AutovalidateMode.always,
            builder: (FormFieldState<String> state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      // width: width,
                      height: height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.black.withOpacity(0.10),
                      ),
                      child: expert && status
                          ? Container(
                              height: height,
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                color: Colors.black.withOpacity(0.10),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    initialValue ?? "",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                            )
                          : DropdownButton<dynamic>(
                              underline: Container(),
                              hint: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("Select"),
                              ),
                              items: status
                                  ? [
                                      DropdownMenuItem<dynamic>(
                                          value: initialValue,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                Text(initialValue.toString()),
                                          ))
                                    ]
                                  : items
                                      .map<DropdownMenuItem<dynamic>>((value) {
                                      return DropdownMenuItem<dynamic>(
                                          value: value,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(value.toString()),
                                          ));
                                    }).toList(),
                              onChanged: expert && status
                                  ? null
                                  : (val) {
                                      initialValue = val; //
                                      state.didChange(initialValue);
                                      onSaved(state.value);
                                    },
                              value: state.value == "" ? null : state.value,
                            ),
                    ),
                    validator(state.value) == "Please select a value" ||
                            state.value == ""
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 20),
                            child:
                                Text("*", style: TextStyle(color: Colors.red)),
                          )
                        : Text("")
                  ],
                ),
              );
            });
}
