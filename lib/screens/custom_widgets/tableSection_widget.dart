import 'package:anosh/models/item_model.dart';
import 'package:anosh/constants.dart';
import 'package:flutter/material.dart';

class TableSection extends StatelessWidget {
  final Item item;
  const TableSection({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
      child: SizedBox(
        width: w,
        child: DataTable(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(w * 0.01),
            color: const Color(0xFF5E5F64),
          ),
          clipBehavior: Clip.hardEdge,
          columns: [
            DataColumn(
              label: SizedBox(
                width: w * .08,
                child: Text(
                  'LOT Description',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: w * 0.01,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
            const DataColumn(
              label: Text('Group', style: customTextStyle),
            ),
            const DataColumn(
              label: Text('Units', style: customTextStyle),
            ),
            const DataColumn(
              label: Text('Pcs', style: customTextStyle),
            ),
            const DataColumn(
              label: Text('Weight', style: customTextStyle),
            ),
            const DataColumn(
              label: Text('Rate', style: customTextStyle),
            ),
            const DataColumn(
              label: Text('Value', style: customTextStyle),
            ),
            DataColumn(
              label: SizedBox(
                // width: w * .05,
                child: Text(
                  'S Rate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: w * 0.01,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const DataColumn(
              label: Text(
                'S Value',
                style: customTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
          rows: item.tableData.map((e) {
                return DataRow(
                  color: MaterialStateProperty.all(const Color(0xFF434346)),
                  cells: <DataCell>[
                    DataCell(
                        Text(e.lotDescription ?? "", style: customTextStyle)),
                    DataCell(Text(e.group ?? "", style: customTextStyle)),
                    DataCell(
                        Text(e.units.toString() ?? "", style: customTextStyle)),
                    DataCell(Text(e.pcs.toString(), style: customTextStyle)),
                    DataCell(Text(e.weight.toString(), style: customTextStyle)),
                    DataCell(Text(e.rate.toString(), style: customTextStyle)),
                    DataCell(Text(e.value.toString(), style: customTextStyle)),
                    DataCell(Text(e.sRate.toString(), style: customTextStyle)),
                    DataCell(Text(e.sValue.toString(), style: customTextStyle)),
                  ],
                );
              }).toList() ??
              [],
        ),
      ),
    );
  }
}
