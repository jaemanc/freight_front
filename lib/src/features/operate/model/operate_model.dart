import 'dart:convert';

import 'package:theme_freight_ui/src/common/util.dart';

class OperateEntity {
  final DateTime? loadingDate;
  final String? loadingPlace;
  final DateTime? unloadingDate;
  final String? unloadingPlace;
  final int? loadingRatio;
  final int? transportationCosts;
  final DateTime? transportationDate;
  final String? transportationType;
  final int? unitCost;
  final String? extra;

  const OperateEntity({
    this.loadingDate,
    this.loadingPlace, 
    this.unloadingDate, 
    this.unloadingPlace, 
    this.loadingRatio, 
    this.transportationCosts, 
    this.transportationDate, 
    this.transportationType, 
    this.unitCost, 
    this.extra
  });

  @override
  String toString() {
    return 'OperateEntity{'
      'loadingDate: $loadingDate, '
      'loadingPlace: $loadingPlace, '
      'unloadingDate: $unloadingDate, '
      'unloadingPlace: $unloadingPlace, '
      'loadingRatio: $loadingRatio, '
      'transportationCosts: $transportationCosts, '
      'transportationDate: $transportationDate, '
      'transportationType: $transportationType, '
      'unitCost: $unitCost, '
      'extra: $extra}';
  }

    factory OperateEntity.fromJson(Map<String, dynamic> json) {
    return OperateEntity(
      loadingDate: DateTime.parse(json['loadingDate']),
      loadingPlace: json['loadingPlace'],
      unloadingDate: DateTime.parse(json['unloadingDate']),
      unloadingPlace: json['unloadingPlace'],
      loadingRatio: json['loadingRatio'],
      transportationCosts: json['transportationCosts'],
      transportationDate: DateTime.parse(json['transportationDate']),
      transportationType: json['transportationType'],
      unitCost: json['unitCost'],
      extra: json['extra'],
    );
  }

  String toJson() {
    final Map<String, dynamic> data = {
      'loadingDate': CurrentDate("yyyy-MM-dd",dateTime: loadingDate),
      'loadingPlace': loadingPlace,
      'unloadingDate': CurrentDate("yyyy-MM-dd",dateTime: loadingDate),
      'unloadingPlace': unloadingPlace,
      'loadingRatio': loadingRatio,
      'transportationCosts': transportationCosts,
      'transportationDate': CurrentDate("yyyy-MM-dd",dateTime: loadingDate),
      'transportationType': transportationType,
      'unitCost': unitCost,
      'extra': extra,
    };

    return  jsonEncode(data);
  }

    
}