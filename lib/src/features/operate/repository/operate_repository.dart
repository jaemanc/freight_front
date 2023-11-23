import 'dart:convert';

import 'package:theme_freight_ui/src/settings/client.dart';
import 'package:theme_freight_ui/src/settings/logger.dart';
import 'package:theme_freight_ui/src/common/util.dart';
import 'package:theme_freight_ui/src/features/operate/model/operate_model.dart';
import 'package:theme_freight_ui/src/features/user/repository/authentication_repository.dart';


abstract class OperateRepository {
  Future<List<OperateEntity>> fetchOperateList(Map<String, dynamic> queryParameters);
  Future<OperateEntity> fetchOperateDetail(int operateId);
  Future<void> updateOperate(OperateEntity updatedOperate);
  Future<void> getOperateDetail(int operateId);
  Future<bool> deleteOperate(int operateId);
}

class OperateRepositoryImpl extends OperateRepository {
  final _client = APIClient();
  Util util = Util();

  @override
  Future<List<OperateEntity>> fetchOperateList(Map<String, dynamic> queryParameters) async {
    try {

      final response = await _client.get('/api/v1/operate', queryParameters: queryParameters);
      final status = response.statusCode;
      
      Map<String, dynamic> resultData = jsonDecode(utf8.decode(response.bodyBytes));
      
      final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(resultData['data']);
      List<OperateEntity> operateEntityList = data.map((json) => OperateEntity.fromJson(json)).toList();

      logger.d('''
        [GET]     : /api/v1/operate
        [STATUS]   : $status
        [RESPONSE] : $resultData
        [RES_HEAD] : ${response.headers}
        [RESULT]   : ${operateEntityList} 
        [TOKEN]    : ${response.headers['authorization']}
      ''');

      return operateEntityList;
    } catch (e, stackTrace) {
      logger.e('Error in fetchOperateList: $e\n$stackTrace');
      return [];
    }
  }

  @override
  Future<OperateEntity> fetchOperateDetail(int operateId) async {
    try {
      // 여기에서 서버와 통신하여 운행 상세 정보를 가져오는 로직을 추가할 수 있습니다.

      return OperateEntity(
          loadingDate: DateTime.now(),
          loadingPlace: '더미',
          unloadingDate: DateTime.now(),
          unloadingPlace: '더미더미',
          loadingRatio: 90,
          transportationCosts: 600,
          transportationDate: DateTime.now(),
          transportationType: 'Ship',
          unitCost: 60,
          extra: 'Extra Information 2',
        );
    } catch (e, stackTrace) {
      logger.e('Error in fetchOperateDetail: $e\n$stackTrace');
      // 에러가 발생하면 빈 상세 정보를 반환하거나 예외 처리를 수행할 수 있습니다.
      return OperateEntity(
          loadingDate: DateTime.now(),
          loadingPlace: '더미',
          unloadingDate: DateTime.now(),
          unloadingPlace: '더미더미',
          loadingRatio: 90,
          transportationCosts: 600,
          transportationDate: DateTime.now(),
          transportationType: 'Ship',
          unitCost: 60,
          extra: 'Extra Information 2',
        );
    }
  }

  @override
  Future<void> updateOperate(OperateEntity updatedOperate) async {
    try {
      // 여기에서 서버와 통신하여 운행 정보를 업데이트하는 로직을 추가할 수 있습니다.

      // 업데이트가 성공하면 아무것도 반환하지 않거나 성공 메시지를 반환할 수 있습니다.
    } catch (e, stackTrace) {
      logger.e('Error in updateOperate: $e\n$stackTrace');
      // 에러가 발생하면 예외 처리를 수행할 수 있습니다.
      rethrow;
    }
  }


  @override
  Future<void> getOperateDetail(int operateId) async {
    try {

    } catch (e, stackTrace) {
      logger.e('Error in deleteOperate: $e\n$stackTrace');
      rethrow;
    }
  }

  @override
  Future<bool> deleteOperate(int operateId) async {
    try {
      // 여기에서 서버와 통신하여 운행 정보를 삭제하는 로직을 추가할 수 있습니다.

      // 삭제가 성공하면 아무것도 반환하지 않거나 성공 메시지를 반환할 수 있습니다.
      return false;
    } catch (e, stackTrace) {
      logger.e('Error in deleteOperate: $e\n$stackTrace');
      // 에러가 발생하면 예외 처리를 수행할 수 있습니다.
      rethrow;
    }
  }
}
