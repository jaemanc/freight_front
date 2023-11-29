import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_freight_ui/src/features/operate/state/operate_state.dart';
import 'package:theme_freight_ui/src/settings/images.dart';
import 'package:theme_freight_ui/src/settings/logger.dart';
import 'package:theme_freight_ui/src/common/util.dart';
import 'package:theme_freight_ui/src/features/operate/bloc/operate_bloc.dart';
import 'package:theme_freight_ui/src/features/operate/event/operate_event.dart';
import 'package:theme_freight_ui/src/features/operate/model/operate_model.dart';

class Operate extends StatefulWidget{
  const Operate({super.key});
  
  @override
  State<StatefulWidget> createState() => _operate();
}


class _operate extends State<Operate> {
  Util util = Util();
  final GlobalKey<NestedScrollViewState> _scrollkey = GlobalKey();
  List<OperateEntity> operateList = [];
  OperateBloc get operateBloc => context.read<OperateBloc>();
  
  @override
  void initState() {
    super.initState();

    String date = SimpleMonthYearPicker().getDate();
    String size = '20';
    String page = '1';

    String token = '';
    util.tokenGetter().then((value) {
      token = value.toString();
    });

    Map<String, dynamic> queryParameters = {
      'token': token,
      'size': size,
      'page': page,
      'date': date,
    };

    // 목록 조회 API 호출.
    operateBloc.add(FetchOperateList(queryParameters));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    String selectedDate = SimpleMonthYearPicker().getDate();
  
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            // add, calendar , excel 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Image(image: AppImages.plus_btn),
                CalendarUtil(),
                const Image(image: AppImages.excel_48)
              ],
            ),
            Column( 
              children: [
                _buildOperateList(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOperateList() {
    return BlocSelector<OperateBloc, OperateState, OperateStateStatus> (
      selector: (state) {
        if (state.status == OperateStateStatus.loadSuccess){
          operateList = state.data ?? [];
        }
        return state.status;
      },
      builder: ((context, state) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: operateList.length,
          itemBuilder: (context, index) {
            OperateEntity operateEntity = operateList[index];
            if (state == OperateStateStatus.loadSuccess) {
              return ListTile(
                title: Text(operateEntity.loadingPlace!),
              ); 
            } else {
              return ListTile(
                title: Text('loading 중입니다. ')
              );
            }
            },
          );
        }
      ));
  }
}



