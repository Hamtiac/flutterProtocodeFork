import 'package:flutter/material.dart';
import 'package:search_choices_example/custom_object_model.dart';
import 'package:search_choices/search_choices.dart';

Widget widgetToExample(
  Widget w,
  String name,
  int id,
) {
  return (Center(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Tooltip(
                  message: "$id",
                  child: Text(
                    "$name:",
                  ),
                ),
                w,
              ],
            ),
          ))));
}

final List<Custom> customList = [
  Custom(id: 'id1', name: 'name1'),
  Custom(id: 'id2', name: 'name2'),
  Custom(id: 'id3', name: 'name3'),
  Custom(id: 'id4', name: 'name4'),
  Custom(id: 'id5', name: 'name5'),
  Custom(id: 'id6', name: 'name6'),
  Custom(id: 'id7', name: 'name7')
];

class CustomObjectSample extends StatefulWidget {
  const CustomObjectSample({Key? key}) : super(key: key);

  @override
  State<CustomObjectSample> createState() => _CustomObjectSampleState();
}

class _CustomObjectSampleState extends State<CustomObjectSample> {
  List<DropdownMenuItem<Custom>> _customDroplist = [];
  Custom? _selectedCustom;
  List<int> selectedItemsMultiCustomDisplayDialog = [];

  @override
  void initState() {
    if (customList.isNotEmpty) {
      customList.forEach((element) {
        _customDroplist.add(DropdownMenuItem<Custom>(
          child: Text(
            element.name,
            style: TextStyle(color: Colors.black),
          ),
          value: element,
        ));
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widgetToExample(
          SearchChoices.single(
            items: _customDroplist,
            value: _selectedCustom,
            hint: "Select one",
            searchHint: "Select one",
            onChanged: (value) {
              setState(() {
                _selectedCustom = value;
              });
            },
            searchFn: (String keyword, List<DropdownMenuItem<Custom>> items) {
              List<int> _ret = [];
              if (items.length > 0 && keyword.isNotEmpty) {
                int i = 0;
                items.forEach((item) {
                  if (!_ret.contains(i) &&
                      (item.value!.name
                          .toString()
                          .toLowerCase()
                          .contains(keyword.toLowerCase()))) {
                    _ret.add(i);
                  }
                  i++;
                });
              }
              if (keyword.isEmpty) {
                _ret = Iterable<int>.generate(items.length).toList();
              }
              return (_ret);
            },
            isExpanded: true,
            dropDownDialogPadding: const EdgeInsets.symmetric(
              vertical: 80,
              horizontal: 80,
            ),
          ),
          'Custom single Dialog',
          1,
        ),
        widgetToExample(
          SearchChoices.multiple(
            items: _customDroplist,
            selectedItems: selectedItemsMultiCustomDisplayDialog,
            hint: "Select multiple",
            searchHint: "Select multiple",
            onChanged: (value) {
              setState(() {
                _selectedCustom = value;
              });
            },
            searchFn: (String keyword, List<DropdownMenuItem<Custom>> items) {
              List<int> _ret = [];
              if (items.length > 0 && keyword.isNotEmpty) {
                int i = 0;
                items.forEach((item) {
                  if (!_ret.contains(i) &&
                      (item.value!.name
                          .toString()
                          .toLowerCase()
                          .contains(keyword.toLowerCase()))) {
                    _ret.add(i);
                  }
                  i++;
                });
              }
              if (keyword.isEmpty) {
                _ret = Iterable<int>.generate(items.length).toList();
              }
              return (_ret);
            },
            isExpanded: true,
            dropDownDialogPadding: const EdgeInsets.symmetric(
              vertical: 80,
              horizontal: 80,
            ),
            selectedValueWidgetFn: (Custom item) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 0.5,
                  ),
                ),
                margin: const EdgeInsets.all(12),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(item.name),
                ),
              );
            },
            selectedAggregateWidgetFn: (List<Widget> list) {
              return Wrap(children: list);
            },
            displayItem: (DropdownMenuItem<Custom> item, bool selected,
                Function updateParent) {
              return ListTile(
                leading: selected
                    ? Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.grey,
                      ),
                title: item,
                trailing: null,
                horizontalTitleGap: 0,
                dense: true,
                visualDensity: VisualDensity.compact,
              );
            },
          ),
          'Custom Multi Dialog',
          2,
        ),
      ],
    );
  }
}
