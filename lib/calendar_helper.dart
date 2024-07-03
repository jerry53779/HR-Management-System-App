// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
//
// class CalendarHelper {
//   final CalendarController _calendarController = CalendarController();
//
//   Widget buildCalendar(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.green,
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: TableCalendar(
//         calendarController: _calendarController,
//         startingDayOfWeek: StartingDayOfWeek.sunday,
//         initialCalendarFormat: CalendarFormat.month,
//         formatAnimation: FormatAnimation.slide,
//         headerStyle: HeaderStyle(
//           centerHeaderTitle: true,
//         ),
//         onDaySelected: (selectedDay, events, holidays) {
//           print('Selected day: $selectedDay');
//           // You can handle selected date logic here
//         },
//       ),
//     );
//   }
// }
