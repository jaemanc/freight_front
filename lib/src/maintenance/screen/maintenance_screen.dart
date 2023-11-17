import 'package:flutter/widgets.dart';

class Maintenance extends StatefulWidget{
  const Maintenance({super.key});
  
  @override
  State<StatefulWidget> createState() => _maintenance();

}


class _maintenance extends State<Maintenance> {
  @override
  Widget build(BuildContext context) {
    return Text(' 요기는 Maintenance');
  }

}