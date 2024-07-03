import 'package:flutter/material.dart';
import 'package:internapp/boxedetails.dart';
import 'package:internapp/drawer.dart';
import 'package:internapp/graph.dart';
import 'package:internapp/main.dart';
import 'package:table_calendar/table_calendar.dart';

class MyPage extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyPage> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HRMS",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Dashboard',
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 250, // Adjust height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Boxes(
                    colors: Colors.lightBlue,
                    number: "3",
                    heading: "Branches",
                    design: Icons.shopping_bag,
                    function: () {
                      print("Container tapped");
                    },
                  ),
                  Boxes(
                    colors: Colors.green,
                    number: "5",
                    heading: "Departments",
                    design: Icons.graphic_eq_outlined,
                    function: () {
                      print("Container tapped");
                    },
                  ),
                  Boxes(
                    colors: Colors.orangeAccent,
                    number: "4",
                    heading: "Employees",
                    design: Icons.people,
                    function: () {
                      print("Container tapped");
                    },
                  ),
                  Boxes(
                    colors: Colors.red,
                    number: "3",
                    heading: "Leave Application",
                    design: Icons.pie_chart,
                    function: () {
                      print("Container tapped");
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(margin: EdgeInsets.only(left: 10,right: 10),
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 10),
                  Graph(
                    graphImage:
                    "https://static.vecteezy.com/system/resources/previews/022/104/635/large_2x/graph-arrow-up-on-stair-growing-white-arrow-with-stair-on-blue-background-simple-white-graph-concept-of-growth-and-increase-three-dimensional-indicator-arrow-3d-rendering-free-photo.jpg",
                  ),
                  SizedBox(width: 10),
                  Graph(
                    graphImage:
                    "https://static.vecteezy.com/system/resources/previews/022/104/635/large_2x/graph-arrow-up-on-stair-growing-white-arrow-with-stair-on-blue-background-simple-white-graph-concept-of-growth-and-increase-three-dimensional-indicator-arrow-3d-rendering-free-photo.jpg",
                  ),
                  SizedBox(width: 10),
                  Graph(
                    graphImage:
                    "https://static.vecteezy.com/system/resources/previews/022/104/635/large_2x/graph-arrow-up-on-stair-growing-white-arrow-with-stair-on-blue-background-simple-white-graph-concept-of-growth-and-increase-three-dimensional-indicator-arrow-3d-rendering-free-photo.jpg",
                  ),
                  SizedBox(width: 10),
                  Graph(
                    graphImage:
                    "https://static.vecteezy.com/system/resources/previews/022/104/635/large_2x/graph-arrow-up-on-stair-growing-white-arrow-with-stair-on-blue-background-simple-white-graph-concept-of-growth-and-increase-three-dimensional-indicator-arrow-3d-rendering-free-photo.jpg",
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TableCalendar(
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(color: Colors.white),
                  leftChevronIcon:
                  Icon(Icons.chevron_left, color: Colors.white),
                  rightChevronIcon:
                  Icon(Icons.chevron_right, color: Colors.white),
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(color: Colors.white),
                    weekendTextStyle: TextStyle(color: Colors.white),
                    selectedTextStyle: TextStyle(color: Colors.white),
                    todayTextStyle: TextStyle(color: Colors.white),
                    selectedDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightGreen.withOpacity(0.6), // Lighter green color
                    ),
                    outsideTextStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    )),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.white),
                  weekendStyle: TextStyle(color: Colors.white),
                ),
                focusedDay: today,
                rowHeight: 44,
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2050, 12, 31),
                onDaySelected: _onDaySelected,
              ),
            ),
            //CalendarHelper().buildCalendar(context),
          ],
        ),
      ),
    );
  }
}

