import 'package:anosh/models/tableData_model.dart';

class Item {
  final String barcode;
  final String location;
  final String branch;
  final String status;
  final int counter;
  final String source;
  final String category;
  final String collection;
  final String description;
  final String metalGrp;
  final String stkSection;
  final String mfgdBy;
  final String notes;
  final String inStkSince;
  final String certNo;
  final String huidNo;
  final int orderNo;
  final String cusName;
  final String size;
  final String quality;
  final double kt;
  final int pcs;
  final double grossWt;
  final double netWt;
  final int diaPcs;
  final double diaWt;
  final int clsPcs;
  final double clsWt;
  final double chainWt;
  final double mRate;
  final double mValue;
  final double lRate;
  final double lCharges;
  final double rCharges;
  final double oCharges;
  final double mrp;
  final String imageLink;
  final List<TableDataModel> tableData;

  Item({
    required this.barcode,
    required this.location,
    required this.branch,
    required this.status,
    required this.counter,
    required this.source,
    required this.category,
    required this.collection,
    required this.description,
    required this.metalGrp,
    required this.stkSection,
    required this.mfgdBy,
    required this.notes,
    required this.inStkSince,
    required this.certNo,
    required this.huidNo,
    required this.orderNo,
    required this.cusName,
    required this.size,
    required this.quality,
    required this.kt,
    required this.pcs,
    required this.grossWt,
    required this.netWt,
    required this.diaPcs,
    required this.diaWt,
    required this.clsPcs,
    required this.clsWt,
    required this.chainWt,
    required this.mRate,
    required this.mValue,
    required this.lRate,
    required this.lCharges,
    required this.rCharges,
    required this.oCharges,
    required this.mrp,
    required this.imageLink,
    required this.tableData,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    var list = json['Table_Data'] as List;
    List<TableDataModel> tableDataList =
        list.map((i) => TableDataModel.fromMap(i)).toList();

    return Item(
      barcode: json['Barcode'] ?? '',
      location: json['Location'] ?? "",
      branch: json['Branch'] ?? "",
      status: json['Status'] ?? "",
      counter: json['Counter'] ?? "",
      source: json['Source'] ?? "",
      category: json['Category'] ?? "",
      collection: json['Collection'] ?? "",
      description: json['Description'] ?? "",
      metalGrp: json['Metal_Grp'] ?? "",
      stkSection: json['STK_Section'] ?? "",
      mfgdBy: json['Mfgd_By'] ?? "",
      notes: json['Notes'] ?? "",
      inStkSince: json['In_STK_Since'] ?? "",
      certNo: json['Cert_No'] ?? "",
      huidNo: json['HUID_No'] ?? "",
      orderNo: json['Order_No'] ?? "",
      cusName: json['Cus_Name'] ?? "",
      size: json['Size'] ?? "",
      quality: json['Quality'] ?? "",
      kt: json['KT'] ?? "",
      pcs: json['Pcs'] ?? "",
      grossWt: json['Gross_Wt'] ?? "",
      netWt: json['Net_Wt'] ?? "",
      diaPcs: json['Dia_Pcs'] ?? "",
      diaWt: json['Dia_Wt'] ?? "",
      clsPcs: json['Cls_Pcs'] ?? "",
      clsWt: json['Cls_Wt'] ?? "",
      chainWt: json['Chain_Wt'] ?? "",
      mRate: json['M_Rate'] ?? "",
      mValue: json['M_Value'] ?? "",
      lRate: json['L_Rate'] ?? "",
      lCharges: json['L_Charges'] ?? "",
      rCharges: json['R_Charges'] ?? "",
      oCharges: json['O_Charges'] ?? "",
      mrp: json['MRP'] ?? "",
      imageLink: json['image_link'] ?? "",
      tableData: tableDataList ?? [],
    );
  }
}
