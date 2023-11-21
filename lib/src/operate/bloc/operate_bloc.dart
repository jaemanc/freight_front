import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_freight_ui/src/common/logger.dart';
import 'package:theme_freight_ui/src/operate/event/operate_event.dart';
import 'package:theme_freight_ui/src/operate/repository/operate_repository.dart';
import 'package:theme_freight_ui/src/operate/state/operate_state.dart';

class OperateBloc extends Bloc<OperateEvent, OperateState> {
  final OperateRepository _operateRepository;

  final _operateController = StreamController<OperateState>();
  Stream<OperateState> get operateStream => _operateController.stream;

  OperateBloc(this._operateRepository) 
      : super(InitOperateBloc()) {
    on<FetchOperateList>(_fetchOperateList);
    on<UpdateOperate>(_updateOperate);
    on<GetOperateDetail>(_getOperateDetail);
    on<DeleteOperate>(_deleteOperate);
  }

  void _fetchOperateList(FetchOperateList event, Emitter<OperateState> emit) async {
    try {
      emit(state.asLoading());
      final data = await _operateRepository.fetchOperateList();

      if (data.isNotEmpty) {
        emit(state.asLoadSuccess());
      } else {
        emit(state.asLoadFailure(Exception('운행 목록이 없습니다.')));
      }
    } on Exception catch (e, stackTrace) {
      logger.e('$e $stackTrace');
      emit(state.asLoadFailure(e));
    }
  }

  void _updateOperate(UpdateOperate event, Emitter<OperateState> emit) async {
    try {
      emit(state.asLoading());

      final data = await _operateRepository.updateOperate(event.updatedOperate);

      emit(state.asLoadSuccess());
      
    } on Exception catch (e, stackTrace) {
      logger.e('$e $stackTrace');
      emit(state.asLoadFailure(e));

    }
  }

  void _getOperateDetail(GetOperateDetail event, Emitter<OperateState> emit) async {
    try {
      emit(state.asLoading());
      final data = await _operateRepository.getOperateDetail(event.operateId);

      emit(state.asLoadSuccess());
    } on Exception catch (e, stackTrace) {
      logger.e('$e $stackTrace');
      emit(state.asLoadFailure(e));
    }
  }

  void _deleteOperate(DeleteOperate event, Emitter<OperateState> emit) async {
    try {
      emit(state.asLoading());
      final isDeleted = await _operateRepository.deleteOperate(event.operateId);

      if (isDeleted == true) {
        emit(state.asLoadSuccess());
      } else {
        emit(state.asLoadFailure(Exception('운행 삭제 실패')));
      }
    } on Exception catch (e, stackTrace) {
      logger.e('$e $stackTrace');
      emit(state.asLoadFailure(e));
    }
  }
}

class InitOperateBloc extends OperateState {
  const InitOperateBloc();
}
