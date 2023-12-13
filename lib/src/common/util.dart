import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_month_year_picker/custom.dialog.dart';
import 'package:simple_month_year_picker/month.container.dart';
import 'package:simple_month_year_picker/month.model.dart';
import 'package:theme_freight_ui/src/settings/logger.dart';

class Util {
  final storage = const FlutterSecureStorage();

  void tokenSetter(String token) async{
    storage.write(key: 'token', value: token);
    String? temp = await storage.read(key:'token');
    logger.i('setting tkn : $temp');
  }

  Future<String?> tokenGetter() async {
    String? token = await storage.read(key: 'token');
    return token;
  }
}

class CalendarUtil extends StatefulWidget {
  @override
  SimpleMonthYearPicker createState() => SimpleMonthYearPicker();
}

class SimpleMonthYearPicker extends State<CalendarUtil> {
  bool _showCalendar = false;
  String selectedDate = DateFormat('yyyy-MM').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
 return ElevatedButton(
      child: Text('$selectedDate'),
      onPressed: () {
        setState(() {
          _showCalendar = !_showCalendar;
        }); 

        if (_showCalendar) {
          showMonthYearPickerDialog(
              context: context,
              titleTextStyle: TextStyle(),
              monthTextStyle: TextStyle(),
              yearTextStyle: TextStyle(),
              disableFuture: false // This will disable future years. it is false by default.
          );
        }
      },
    );
  }

  String getDate(){
    return selectedDate;
  }

  void changeDate(int selectedYear, int selectedMonth) {
    DateTime dateTime = DateTime(selectedYear, selectedMonth, 1);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    print(" selected Date : ${formattedDate}" );  
    
    selectedDate = DateFormat('yyyy-MM').format(dateTime);

    setState(() => {});
  }

  static final List<MonthModel> _monthModelList = [
    MonthModel(index: 1, name: '1월'),
    MonthModel(index: 2, name: '2월'),
    MonthModel(index: 3, name: '3월'),
    MonthModel(index: 4, name: '4월'),
    MonthModel(index: 5, name: '5월'),
    MonthModel(index: 6, name: '6월'),
    MonthModel(index: 7, name: '7월'),
    MonthModel(index: 8, name: '8월'),
    MonthModel(index: 9, name: '9월'),
    MonthModel(index: 10, name: '10월'),
    MonthModel(index: 11, name: '11월'),
    MonthModel(index: 12, name: '12월'),
  ];

  Future<DateTime> showMonthYearPickerDialog({
    required BuildContext context,
    TextStyle? titleTextStyle,
    TextStyle? yearTextStyle,
    TextStyle? monthTextStyle,
    Color? backgroundColor,
    Color? selectionColor,
    bool? barrierDismissible,
    bool? disableFuture,
  }) async {
    final ThemeData theme = Theme.of(context);
    var primaryColor = selectionColor ?? theme.primaryColor;
    var bgColor = backgroundColor ?? theme.scaffoldBackgroundColor;

    int selectedYear = DateTime.now().year;
    int selectedMonth = DateTime.now().month;

    await showDialog<DateTime>(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (_) {
        return StatefulBuilder(builder: (context, setState) {
          return CustomDialog(
            child: Stack(
              children: [
                Container(
                  height: 210,
                  width: 370,
                  decoration: BoxDecoration(
                    color: bgColor,
                    border: Border.all(
                      color: primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column( 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          '달을 선택해주세요. ',
                          style: titleTextStyle ??
                              TextStyle(
                                fontFamily: 'Rajdhani',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 5),
                        child: SizedBox(
                          height: 100,
                          width: 300,
                          child: GridView.builder(
                            itemCount: _monthModelList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                            ),
                            itemBuilder: (_, index) {
                              var monthModel = _monthModelList[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedMonth = index + 1;
                                    _showCalendar = !_showCalendar;
                                    Navigator.pop(context);
                                    changeDate(selectedYear, selectedMonth);
                                  });

                                },
                                onHover: (val) {},
                                child: MonthContainer(
                                  textStyle: monthTextStyle,
                                  month: monthModel.name,
                                  fillColor: index + 1 == selectedMonth
                                      ? primaryColor
                                      : bgColor,
                                  borderColor: index + 1 == selectedMonth
                                      ? primaryColor
                                      : bgColor,
                                  textColor: index + 1 != selectedMonth
                                      ? primaryColor
                                      : bgColor,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  top: 10,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              selectedYear = selectedYear - 1;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 10,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          selectedYear.toString(),
                          style: yearTextStyle ??
                              TextStyle(
                                fontSize: 20,
                                fontFamily: 'Rajdhani',
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        if (!(disableFuture == true &&
                            selectedYear == DateTime.now().year))
                        IconButton(
                          onPressed: () {
                            // DOC: Give user option to disable future years.
                            if (disableFuture == true &&
                                selectedYear == DateTime.now().year) {
                              null;
                            } else {
                              setState(() {
                                selectedYear = selectedYear + 1;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                            color: primaryColor,
                          ),
                          )
                        else
                          SizedBox(
                            width: 50,
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
      },
    );
    String selectedMonthString =
        selectedMonth < 10 ? "0$selectedMonth" : "$selectedMonth";
    return DateTime.parse('$selectedYear-$selectedMonthString-01');
  }
}


// Global method 
String CurrentDate(String format, { DateTime? dateTime }) {
  return DateFormat(format).format(dateTime ?? DateTime.now());
}