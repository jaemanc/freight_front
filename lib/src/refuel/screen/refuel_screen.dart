import 'package:flutter/widgets.dart';

class Refuel extends StatefulWidget{
  const Refuel({super.key});
  
  @override
  State<StatefulWidget> createState() => _refuel();

}


class _refuel extends State<Refuel> {
  @override
  Widget build(BuildContext context) {
    return Text(' 요기는 Refuel');
  }

}