import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:theme_freight_ui/src/features/operate/model/operate_model.dart';

abstract class OperateEvent extends Equatable {
  const OperateEvent();
  @override
  List<Object?> get props => [];
}

class FetchOperateList extends OperateEvent {
  // final String date;
  // final int size;
  // final int page;
  // final String token;
  final Map<String, dynamic> queryParameters;
  
  FetchOperateList(this.queryParameters);

  @override
  List<Object?> get props => [this.queryParameters];
}

class UpdateOperate extends OperateEvent {
  final OperateEntity updatedOperate;

  const UpdateOperate(this.updatedOperate);

  @override
  List<Object?> get props => [updatedOperate];
}

class GetOperateDetail extends OperateEvent {
  final int operateId;

  const GetOperateDetail(this.operateId);

  @override
  List<Object?> get props => [operateId];
}

class DeleteOperate extends OperateEvent {
  final int operateId;

  const DeleteOperate(this.operateId);

  @override
  List<Object?> get props => [operateId];
}