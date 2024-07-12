import 'package:anosh/models/item_model.dart';
import 'package:anosh/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomSearchableDropdown extends StatefulWidget {
  final List<DropdownMenuItem<Item>> items;
  final Item? selectedItem;

  final String? searchHint;
  final void Function(Item?)? onChanged;

  const CustomSearchableDropdown(
      {super.key,
      required this.items,
      this.selectedItem,
      this.onChanged,
      this.searchHint});

  @override
  CustomSearchableDropdownState createState() =>
      CustomSearchableDropdownState();
}

class CustomSearchableDropdownState extends State<CustomSearchableDropdown> {
  final TextEditingController _dropSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Row(
      children: [
        SizedBox(
          width: w * .012,
        ),
        Icon(
          Icons.search,
          size: w * .02,
        ),
        Expanded(
          child: SizedBox(
            child: DropdownButton2<Item>(
              underline: const SizedBox.shrink(),
              hint: const Text(
                "Search",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              items: widget.items,
              onChanged: widget.onChanged,
              value: widget.selectedItem,
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: h * .055,
                width: w,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(color: Colors.grey.shade900),
                maxHeight: h * .5,
              ),
              menuItemStyleData: MenuItemStyleData(
                height: h * .06,
              ),
              style: TextStyle(color: Colors.white),
              dropdownSearchData: DropdownSearchData(
                searchController: _dropSearchController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: _dropSearchController,
                    decoration: InputDecoration(
                      isDense: true,
                      prefixStyle: customTextStyle,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: 'Search item using barcode...',
                      hintStyle:
                          const TextStyle(fontSize: 12, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  Text textWidget = item.child as Text;
                  String extractedText = textWidget.data ?? "";

                  final String itemText =
                      extractedText.toString().toLowerCase();
                  final String searchValueText = searchValue.toLowerCase();
                  return itemText.contains(searchValueText);
                },
              ),
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  _dropSearchController.clear();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
