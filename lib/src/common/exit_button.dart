import 'package:flutter/widgets.dart';
import 'package:theme_freight_ui/src/common/images.dart';

class ExitButton extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width; 
    return Padding(
      padding:
        EdgeInsets.only(left: screenWidth * 0.01, top: screenHeight * 0.02),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Image(image: AppImages.exit2),
      )
    );
  }

}