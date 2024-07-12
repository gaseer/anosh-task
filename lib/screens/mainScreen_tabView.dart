import 'package:anosh/bloc/item_bloc.dart';
import 'package:anosh/bloc/item_event.dart';
import 'package:anosh/bloc/item_state.dart';
import 'package:anosh/constants.dart';
import 'package:anosh/screens/custom_widgets/customContainer_widget.dart';
import 'package:anosh/screens/custom_widgets/customSearchable_widget.dart';
import 'package:anosh/screens/custom_widgets/tableSection_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenTabView extends StatelessWidget {
  final double w, h;
  final ItemState state;
  const MainScreenTabView(
      {super.key, required this.w, required this.h, required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: h * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: kGradientBoxDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    height: h * 0.06,
                    width: w * 0.5,
                    decoration: kInnerDecoration,
                    child: CustomSearchableDropdown(
                      searchHint: "Search item using barcode",
                      items: state.items.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.barcode.toString()),
                        );
                      }).toList(),
                      onChanged: (item) {
                        if (item != null) {
                          context.read<ItemBloc>().add(SelectItem(item));
                        }
                      },
                      selectedItem: state.selectedItem,
                    ),
                  ),
                ),
              ),
              SizedBox(width: w * 0.01),
              TextButton(
                onPressed: () {
                  context.read<ItemBloc>().add(ClearSelectedItem());
                },
                child: Text(
                  "Clear",
                  style: TextStyle(fontSize: w * 0.01, color: Colors.blue),
                ),
              )
            ],
          ),
          SizedBox(height: h * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.05,
            ),
            child: SizedBox(
              height: h * 0.29,
              width: w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: w * 0.135,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          text: "Barcode",
                          value: state.selectedItem?.barcode,
                        ),
                        CustomContainer(
                          text: "Source",
                          value: state.selectedItem?.source,
                        ),
                        CustomContainer(
                          text: "Metal Grp",
                          value: state.selectedItem?.metalGrp,
                        ),
                        CustomContainer(
                          text: "In STK Since",
                          value: state.selectedItem?.inStkSince,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.007),
                  SizedBox(
                    width: w * 0.135,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          text: "Location ",
                          value: state.selectedItem?.location,
                        ),
                        CustomContainer(
                          text: "Category",
                          value: state.selectedItem?.category,
                        ),
                        CustomContainer(
                          text: "STK Section",
                          value: state.selectedItem?.stkSection,
                        ),
                        CustomContainer(
                          text: "Cert No.",
                          value: state.selectedItem?.certNo,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.007),
                  SizedBox(
                    width: w * 0.135,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          text: "Branch ",
                          value: state.selectedItem?.branch,
                        ),
                        CustomContainer(
                          text: "Collection",
                          value: state.selectedItem?.collection,
                        ),
                        CustomContainer(
                          text: "Mfgd By",
                          value: state.selectedItem?.mfgdBy,
                        ),
                        CustomContainer(
                          text: "HUID No",
                          value: state.selectedItem?.huidNo,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.007),
                  SizedBox(
                    width: w * 0.277,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomContainer(
                              text: "Status ",
                              value: state.selectedItem?.status,
                            ),
                            SizedBox(width: w * 0.007),
                            CustomContainer(
                              text: "Counter",
                              value: state.selectedItem?.status,
                            ),
                          ],
                        ),
                        Container(
                          height: h * 0.0625,
                          width: w * 0.277,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w * 0.008),
                            border: Border.all(
                                color: Colors.white, width: h * 0.0003),
                            color: Colors.white.withOpacity(.065),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: h * .02, top: h * .015),
                            child: Text(
                              "Description : ${state.selectedItem?.description ?? ""}",
                              style: TextStyle(
                                  fontSize: w * 0.011, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: h * 0.0625,
                          width: w * 0.277,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w * 0.008),
                            border: Border.all(
                                color: Colors.white, width: h * 0.0003),
                            color: Colors.white.withOpacity(.065),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: h * .02, top: h * .015),
                            child: Text(
                              "Notes : ${(state.selectedItem?.notes ?? "").isEmpty ? 'Notes Is Empty' : state.selectedItem?.notes}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: w * 0.011, color: Colors.white),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            CustomContainer(
                              text: "Order No",
                              value: state.selectedItem?.orderNo.toString(),
                            ),
                            SizedBox(width: w * 0.007),
                            CustomContainer(
                              text: "Cus Name",
                              value: state.selectedItem?.cusName,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.007),
                  Container(
                    height: h * 0.4,
                    width: w * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w * 0.008),
                      border:
                          Border.all(color: Colors.white, width: h * 0.0003),
                      color: Colors.white,
                      image: state.selectedItem?.imageLink != null
                          ? DecorationImage(
                              fit: BoxFit.fill,
                              image: CachedNetworkImageProvider(
                                  state.selectedItem!.imageLink),
                            )
                          : null,
                    ),
                    child: state.selectedItem?.imageLink == null
                        ? Center(
                            child: Text(
                            'No data Loaded',
                            style: customTextStyle.copyWith(
                                fontSize: w * .01, color: Colors.black),
                          ))
                        : null,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: h * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.05,
            ),
            child: SizedBox(
              height: h * 0.22,
              width: w,
              child: Row(
                children: [
                  SizedBox(
                    width: w * 0.135,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          text: "Size",
                          value: state.selectedItem?.size,
                        ),
                        CustomContainer(
                          text: "Dia Pcs",
                          value: state.selectedItem?.diaPcs.toString(),
                        ),
                        CustomContainer(
                          text: "M Value",
                          value: state.selectedItem?.mValue.toString(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.007),
                  SizedBox(
                    width: w * 0.135,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          text: "Quality",
                          value: state.selectedItem?.quality,
                        ),
                        CustomContainer(
                          text: "Dia Wt",
                          value: state.selectedItem?.diaWt.toString(),
                        ),
                        CustomContainer(
                          text: "L Rate",
                          value: state.selectedItem?.lRate.toString(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.007),
                  SizedBox(
                    width: w * 0.135,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          text: "KT",
                          value: state.selectedItem?.kt.toString(),
                        ),
                        CustomContainer(
                          text: "Cls Pcs",
                          value: state.selectedItem?.clsPcs.toString(),
                        ),
                        CustomContainer(
                          text: "L Charges",
                          value: state.selectedItem?.lCharges.toString(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.007),
                  SizedBox(
                    width: w * 0.135,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          text: "Pcs",
                          value: state.selectedItem?.pcs.toString(),
                        ),
                        CustomContainer(
                          text: "Cls Wt",
                          value: state.selectedItem?.clsWt.toString(),
                        ),
                        CustomContainer(
                          text: "R Charges",
                          value: state.selectedItem?.rCharges.toString(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.007),
                  SizedBox(
                    width: w * 0.135,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          text: "Gross Wt",
                          value: state.selectedItem?.grossWt.toString(),
                        ),
                        CustomContainer(
                          text: "Chain Wt",
                          value: state.selectedItem?.chainWt.toString(),
                        ),
                        CustomContainer(
                          text: "O Charges",
                          value: state.selectedItem?.oCharges.toString(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.007),
                  SizedBox(
                    width: w * 0.135,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          text: "Net Wt",
                          value: state.selectedItem?.netWt.toString(),
                        ),
                        CustomContainer(
                          text: "M Rate",
                          value: state.selectedItem?.mRate.toString(),
                        ),
                        CustomContainer(
                          text: "MRP",
                          value: state.selectedItem?.mrp.toString(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: h * 0.05),
          if (state.selectedItem != null)
            SizedBox(
              width: double.infinity,
              child: Expanded(
                child: TableSection(
                  item: state.selectedItem!,
                ),
              ),
            ),
          SizedBox(height: h * 0.1),
        ],
      ),
    );
  }
}
