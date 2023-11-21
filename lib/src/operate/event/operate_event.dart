import 'package:equatable/equatable.dart';
import 'package:theme_freight_ui/src/operate/model/operate_model.dart';

abstract class OperateEvent extends Equatable {
  const OperateEvent();
  @override
  List<Object?> get props => [];
}

class FetchOperateList extends OperateEvent {}

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