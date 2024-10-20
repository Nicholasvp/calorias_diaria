// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResultModel {
  final double taxaMetabolicaBasal;

  ResultModel({required this.taxaMetabolicaBasal});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taxaMetabolicaBasal': taxaMetabolicaBasal,
    };
  }

  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      taxaMetabolicaBasal: map['taxaMetabolicaBasal'] as double,
    );
  }
  factory ResultModel.empty() {
    return ResultModel(
      taxaMetabolicaBasal: 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultModel.fromJson(String source) => ResultModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
