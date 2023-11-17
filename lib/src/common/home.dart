import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:theme_freight_ui/src/common/images.dart';
import 'package:theme_freight_ui/src/common/routes.dart';
import 'package:theme_freight_ui/src/common/util.dart';
import 'package:theme_freight_ui/src/maintenance/screen/maintenance_screen.dart';
import 'package:theme_freight_ui/src/operate/screen/operate_screen.dart';
import 'package:theme_freight_ui/src/refuel/screen/refuel_screen.dart';
import 'package:theme_freight_ui/src/spend/screen/spend_screen.dart';
import 'package:theme_freight_ui/src/user/screen/login_screen.dart';

import 'logger.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  Util uilt = Util();
  final GlobalKey<NestedScrollViewState> _scrollkey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    var token = uilt.tokenGetter();
    String? value = await token;

    if (value == null) {
      Future.microtask((){
        logger.i('사용자 정보를 알수 없으므로, 로그인 페이지로 이동합니다.');
         Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
      });
    } else {
      logger.i('사용자 정보를 확인했습니다. ${value}');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        key: _scrollkey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _exitBtn(),
                _settingBtn(),
              ],
            ),
            SizedBox(
              width: screenWidth * 0.3,
              height: screenHeight * 0.2,
              child: const Image(image: AppImages.mainTruck, fit:BoxFit.fill),
            ),
            Text('운행 일지' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            // 운행 지출 주유 정비
            SizedBox(height: screenHeight * 0.13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _operate(),
                SizedBox(width: screenWidth* 0.06),   
                _refueling(),
              ]
            ),
            SizedBox(height: screenHeight* 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _spend(),
                SizedBox(width: screenWidth * 0.06),  
                _maintenance()
              ],
            ),
            SizedBox(height: screenWidth * 0.15),  
            _callendar()
          ],
        ),
      ),
    );
  }
  
  Widget _operate() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell (
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Operate())
          );
        },
        child: Column(
          children: [
            Image
            (
              image: AppImages.menuDocument,
              width: screenWidth * 0.2,
              height: screenHeight * 0.1,
              fit: BoxFit.fill,
            ),
            Text('운행 내역',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, ),
            )
          ],
        )
    );
  }

  Widget _refueling() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Refuel())
      );
      },
      child: Column(
        children: [
          Image
          (
            image: AppImages.menuRefuel,
            width: screenWidth * 0.2,
            height: screenHeight * 0.1,
            fit: BoxFit.fill,
          ),
          Text('주유 내역',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, ),
          )
        ],
      ),
    );
  }

  Widget _spend() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return  InkWell(
      onTap: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Spend())
      );
      },
      child: Column(
        children: [
          Image
          (
            image: AppImages.menuSpend,
            width: screenWidth * 0.2,
            height: screenHeight * 0.1,
            fit: BoxFit.fill,
          ),
          Text('지출 내역',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, ),
          )
        ],
      ),
    );
  }

  Widget _maintenance() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Maintenance())
      );
      },
      child:Column(
        children: [
          Image 
          (
            image: AppImages.menuFix,
            width: screenWidth * 0.2,
            height: screenHeight * 0.1,
            fit: BoxFit.fill,
          ),
          Text('정비 내역',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, ),
          )
        ],
      ),
    );
  }

  Widget _exitBtn() {
      double screenHeight = MediaQuery.of(context).size.height;
      double screenWidth = MediaQuery.of(context).size.width; 
      return Padding(
        padding:
            EdgeInsets.only(left: screenWidth * 0.01, top: screenHeight * 0.02),
        child: GestureDetector(
          onTap: () {
            // 클릭이벤트
            logger.d(' exit click ');
          },
          child: const Image(image: AppImages.exit2),
        ));
    }

  Widget _settingBtn() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.01, top: screenHeight * 0.02),
      child: GestureDetector(
          onTap: () {
            // 클릭이벤트
            logger.d('setting click ');
          },
          child: Image(image: AppImages.setting)
        ));
  }

  Widget _callendar() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        '  2023  ',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }

}
