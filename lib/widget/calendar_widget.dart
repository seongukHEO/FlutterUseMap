import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  final Function(DateTime selectDate, String title, String content) onSave;
  const CalendarWidget({super.key, required this.onSave});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController titleTEC = TextEditingController();

  TextEditingController contentTEC = TextEditingController();

  TextEditingController dateTEC = TextEditingController();

  DateTime _focusDay = DateTime.now();
  DateTime? _selectDay;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
          alignment: Alignment.center,
          child: Text("메모 입력", style: TextStyle(fontWeight: FontWeight.bold),)),
      content: Container(
        height: 700,
        width: 400,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    children: [
                      TextFormField(
                        controller: titleTEC,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "메모 제목 입력"
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: contentTEC,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "메모 내용 입력"
                        ),
                      ),
                      TableCalendar(
                        focusedDay: _focusDay,
                        firstDay: DateTime(2020),
                        lastDay: DateTime(2030),
                        selectedDayPredicate: (day){
                          return isSameDay(_selectDay, day);
                        },
                        headerStyle: HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                        ),
                        onDaySelected: (selectDay, focusedDay){
                          setState(() {
                            _selectDay = selectDay;
                            _focusDay = focusedDay;
                          });
                        },
                      )
                    ],
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}
