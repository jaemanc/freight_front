import 'package:equatable/equatable.dart';
import 'package:theme_freight_ui/src/features/operate/model/operate_model.dart';
import 'package:theme_freight_ui/src/features/operate/state/operate_state.dart';

enum OperateStateStatus { initial, loading, loadSuccess, loadFailure }

class OperateState extends Equatable {
  final OperateStateStatus status;
  final List<OperateEntity> data;
  final Exception? error;

  const OperateState({
    this.status = OperateStateStatus.initial,
    this.data =  const [],
    this.error,
  });

  @override
  List<Object?> get props => [status, data, error];

  OperateState initial() {
    return copyWith(status: OperateStateStatus.initial);
  }

  OperateState asLoading() {
    return copyWith(status: OperateStateStatus.loading);
  }

  OperateState asLoadFailure(Exception e) {
    return copyWith(status: OperateStateStatus.loadFailure, error: e);
  }

  OperateState fetchData(List<OperateEntity> data) {
    return copyWith(status: OperateStateStatus.loading, data: data);
  }

  OperateState asLoadSuccess() {
    return copyWith(status: OperateStateStatus.loadSuccess);
  }

  OperateState copyWith( {OperateStateStatus? status, List<OperateEntity>? data, Exception? error
  }) 
  {
    return OperateState(
        status: status ?? this.status,
        data: data ?? this.data,
        error: error ?? this.error);
  }

}