// ignore_for_file: prefer_const_constructors

import 'package:hosha/screens/confirm_page.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  CalendarPageState createState() => CalendarPageState();
}

// class CalendarPageState extends State<CalendarPage> {
//   CalendarFormat calendarFormat = CalendarFormat.month;
//   DateTime _selectedDay = DateTime.now();
//   DateTime _focusedDay = DateTime.now();
//   final Map<DateTime, List<dynamic>> _events = {
//     DateTime(2023, 12, 25): ['Busy'], // Example of a busy day
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffE2CAAE),
//       appBar: AppBar(
//         backgroundColor: const Color(0xffA95F44),
//         title: const Text(
//           'تأكيد',
//         ),
//       ),
//       body: Column(
//         children: [
//           TableCalendar(
//             calendarFormat: calendarFormat,
//             focusedDay: _focusedDay,
//             firstDay: DateTime(2023),
//             lastDay: DateTime(2024),
//             eventLoader: (date) => _events[date] ?? [],
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//                 _focusedDay = focusedDay;
//               });
//             },
//           ),
//           const SizedBox(height: 20),
//           Text(
//             'Selected Date: ${_selectedDay.toLocal()}',
//             style: const TextStyle(fontSize: 18),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(

//             onPressed: () {
//               // Implement your submit logic here
//               print('Submitted Date: $_selectedDay');
//             },
//             child: const Text('Submit'),

//           ),
//         ],
//       ),
//     );
//   }
// }
class CalendarPageState extends State<CalendarPage> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final Map<DateTime, List<dynamic>> _events = {
    DateTime(2023, 12, 25): ['Busy'], // Example of a busy day
  };
  final Set<DateTime> disabledDays = {};
  Set<DateTime> specialDays = {
    DateTime.now().add(Duration(days: 5)),
    DateTime.now().add(Duration(days: 10)),
    DateTime.now().add(Duration(days: 15)),
    DateTime.now().add(Duration(days: 20)),
  };

  @override
  void initState() {
    super.initState();
    calculateDisabledDays();
  }

  void calculateDisabledDays() {
    // Days before the app was opened in grey
    for (int i = 1; i <= 30; i++) {
      DateTime date = DateTime.now().subtract(Duration(days: i));
      disabledDays.add(DateTime(date.year, date.month, date.day));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE2CAAE),
      appBar: AppBar(
        backgroundColor: const Color(0xffA95F44),
        title: const Text(
          'تأكيد',
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarFormat: calendarFormat,
            focusedDay: _focusedDay,
            firstDay: DateTime(2023),
            lastDay: DateTime(2024),
            eventLoader: (date) {
              final events = _events[date] ?? [];
              if (disabledDays.contains(date)) {
                return [
                  CellDecorator(
                    decoration: BoxDecoration(
                      color: Colors.grey, // Days before app opened
                    ),
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ];
              } else if (specialDays.contains(date)) {
                return [
                  CellDecorator(
                    decoration: BoxDecoration(
                      color: Colors.blue, // Random days after app opened
                    ),
                    textStyle: TextStyle(color: Colors.white),
                  )
                ];
              }
              return events;
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Selected Date: ${_selectedDay.toLocal()}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentPage(),
                ),
              );
              // Implement your submit logic here
              // ignore: avoid_print
              print('Submitted Date: $_selectedDay');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffA95F44),
            ),
            child: const Text(
              'التأكيد والدفع',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CellDecorator extends StatelessWidget {
  final BoxDecoration decoration;
  final TextStyle textStyle;

  const CellDecorator({
    super.key,
    required this.decoration,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Center(
        child: Text(
          '',
          style: textStyle,
        ),
      ),
    );
  }
}
