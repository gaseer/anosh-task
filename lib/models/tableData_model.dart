class TableDataModel {
  final String lotDescription;
  final String group;
  final String units;
  final int pcs;
  final double weight;
  final double rate;
  final double value;
  final double sRate;
  final double sValue;

  TableDataModel({
    required this.lotDescription,
    required this.group,
    required this.units,
    required this.pcs,
    required this.weight,
    required this.rate,
    required this.value,
    required this.sRate,
    required this.sValue,
  });

  TableDataModel copyWith({
    String? lotDescription,
    String? group,
    String? units,
    int? pcs,
    double? weight,
    double? rate,
    double? value,
    double? sRate,
    double? sValue,
  }) =>
      TableDataModel(
        lotDescription: lotDescription ?? this.lotDescription,
        group: group ?? this.group,
        units: units ?? this.units,
        pcs: pcs ?? this.pcs,
        weight: weight ?? this.weight,
        rate: rate ?? this.rate,
        value: value ?? this.value,
        sRate: sRate ?? this.sRate,
        sValue: sValue ?? this.sValue,
      );

  factory TableDataModel.fromMap(Map<String, dynamic> json) => TableDataModel(
        lotDescription: json["Lot_Description"],
        group: json["Group"],
        units: json["Units"],
        pcs: json["Pcs"],
        weight: json["Weight"]?.toDouble(),
        rate: json["Rate"],
        value: json["Value"],
        sRate: json["S_Rate"],
        sValue: json["S_Value"],
      );

  Map<String, dynamic> toMap() => {
        "Lot_Description": lotDescription,
        "Group": group,
        "Units": units,
        "Pcs": pcs,
        "Weight": weight,
        "Rate": rate,
        "Value": value,
        "S_Rate": sRate,
        "S_Value": sValue,
      };
}
