import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:theme_freight_ui/src/common/images.dart';
import 'package:theme_freight_ui/src/common/logger.dart';
import 'package:theme_freight_ui/src/common/util.dart';
import 'package:theme_freight_ui/src/operate/model/operate_model.dart';

class Operate extends StatefulWidget{
  const Operate({super.key});
  
  @override
  State<StatefulWidget> createState() => _operate();
}


class _operate extends State<Operate> {
  Util uilt = Util();
  final GlobalKey<NestedScrollViewState> _scrollkey = GlobalKey();
  List<OperateEntity> operateList = [];

  @override
  void initState() async {
    super.initState();

    var token = uilt.tokenGetter();
    String? value = await token;
    logger.i(' User TKN : ${value} ');

    // fetchData();

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
                
              ],
            )
          ],
        ),
      ),
    );
  }



}



