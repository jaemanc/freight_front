import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:theme_freight_ui/src/common/exit_button.dart';
import 'package:theme_freight_ui/src/common/images.dart';
import 'package:theme_freight_ui/src/common/logger.dart';
import 'package:theme_freight_ui/src/user/screen/user_detail_screen.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({super.key});

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.01, top: screenHeight * 0.02),
      child: GestureDetector(
        onTap: () {
          // 클릭이벤트
          logger.d('setting click ');
          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
        },
        child: const Image(
          image: AppImages.setting,
        )
      )
    );
  }

}

class SettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _settingScreen();
}

class _settingScreen extends State<SettingScreen> {

  bool darkModeEnabled = false;
  bool lightModeEnabled = false;
  double userRating = 0.0;
  String userName = 'John Doe';
  String userEmail = 'john.doe@example.com';
  String userContact = '123-456-7890';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  ExitButton(),
                ],
              ),
              const Text(' 환경 설정 ' ,
               style: TextStyle(fontSize: 20),
              ),
              ListTile(
                title: Text('다크 모드'),
                trailing: Switch(
                  value: darkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      darkModeEnabled = value;
                      // 여기에서 실제로 다크 모드를 설정하는 작업을 수행할 수 있습니다.
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('라이트 모드'),
                trailing: Switch(
                  value: lightModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      lightModeEnabled = value;
                      // 여기에서 실제로 라이트 모드를 설정하는 작업을 수행할 수 있습니다.
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('요율 설정'),
              ),
              ListTile(
                title: Text('사용자 정보 확인'),
                onTap: () {
                  // 여기에서 사용자 토큰 정보 확인 로직을 추가할 수 있습니다.
                },
              ),
              ListTile(
                title: Text('사용자 정보 내보내기'),
                onTap: () {
                  // 여기에서 사용자 정보 내보내기 로직을 추가할 수 있습니다.
                },
              ),
              ListTile(
                title: Text('사용자 정보 불러오기'),
                onTap: () {
                  // 여기에서 사용자 정보 불러오기 로직을 추가할 수 있습니다.
                },
              ),
              ListTile(
                title: Text('개인 정보 수정'),
                onTap: () {
                  // 여기에서 개인 정보 수정 페이지로 이동하는 로직을 추가할 수 있습니다.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserDetail()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }



}