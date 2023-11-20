import 'package:equatable/equatable.dart';
import 'package:theme_freight_ui/src/operate/model/operate_model.dart';

enum OperateStateStatus { initial, loading, loadSuccess, loadFailure }

class OperateState extends Equatable {
  final OperateStateStatus status;
  final OperateEntity operateEntity;
  final Exception? error;

  const OperateState({
    this.status = OperateStateStatus.initial, 
    this.operateEntity = const OperateEntity(),
    this.error
  });

  @override
  List<Object?> get props => [status, operateEntity, error];

  OperateState initial() {
    return copyWith(status: OperateStateStatus.initial);
  }

  OperateState asLoading() {
    return copyWith(status: OperateStateStatus.loading);
  }

  OperateState asLoadFailure(Exception e) {
    return copyWith(status: OperateStateStatus.loadFailure, error: e);
  }

  OperateState asLoadSuccess() {
    return copyWith(status: OperateStateStatus.loadSuccess);
  }

  OperateState copyWith( {OperateStateStatus? status, OperateEntity? operateEntity, Exception? error
  }) 
  {
    return OperateState(
        status: status ?? this.status,
        operateEntity: operateEntity ?? this.operateEntity,
        error: error ?? this.error);
  }

}