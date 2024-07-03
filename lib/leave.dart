// leave.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internapp/drawer.dart';
import 'employee.dart'; // Import your model and list

class LeaveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Leave(),
    );
  }
}

class Leave extends StatefulWidget {
  @override
  _LeaveState createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  final TextEditingController staffNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  String selectedType = 'Select Type';
  bool isTypeDropdownOpen = false;

  @override
  void dispose() {
    staffNameController.dispose();
    dateController.dispose();
    reasonController.dispose();
    typeController.dispose();
    super.dispose();
  }

  void applyLeave() {
    if (staffNameController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        selectedType != 'Select Type' &&
        reasonController.text.isNotEmpty) {
      setState(() {
        ApplyLeave leave = ApplyLeave(
          name: staffNameController.text,
          date: dateController.text,
          type: selectedType,
          reason: reasonController.text,
        );
        leaveList.add(leave); // Add leave to the global list in employee.dart

        // Clear form fields
        staffNameController.clear();
        dateController.clear();
        reasonController.clear();

        // Reset leave type dropdown
        selectedType = 'Select Type';
        typeController.clear();

        // Print the details of the leave application
        print('Leave Application: ${leave.name}, ${leave.date}, ${leave.type}, ${leave.reason}');
      });

    } else {
      // Handle validation or error message
      print('Please fill in all fields');
    }
  }

  void deleteLeave(int index) {
    setState(() {
      leaveList.removeAt(index); // Remove leave from the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HRMS",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Department",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: staffNameController,
                        decoration: InputDecoration(
                          labelText: 'Staff Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: dateController,
                        decoration: InputDecoration(
                          labelText: 'Date',
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            dateController.text =
                            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      DropList(
                        labelText: 'Leave Type',
                        usedController: typeController,
                        options: ['Half Day', 'Full Day'],
                        selectedOption: selectedType,
                        isOpen: isTypeDropdownOpen,
                        onOptionSelected: (String option) {
                          setState(() {
                            selectedType = option;
                            typeController.text = option;
                            isTypeDropdownOpen = false;
                          });
                        },
                        toggleDropdown: () {
                          setState(() {
                            isTypeDropdownOpen = !isTypeDropdownOpen;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: reasonController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Reason',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: applyLeave,
                            child: Text('Apply Leave'),
                          ),
                          SizedBox(width: 46),
                          ElevatedButton(
                            onPressed: () {
                              staffNameController.clear();
                              dateController.clear();
                              reasonController.clear();
                              setState(() {
                                selectedType = 'Select Type';
                              });
                              typeController.clear(); // Clear type dropdown
                            },
                            child: Text('Reset'),
                          ),
                          SizedBox(width: 16),
                        ],
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(right: 10,left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [SizedBox(width: 100,),Text(
                    'Leave Applications', // Table header
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),],),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('Staff Name',style: TextStyle(color: Colors.blue),)),
                          DataColumn(label: Text('Date',style: TextStyle(color: Colors.blue),),),
                          DataColumn(label: Text('Type',style: TextStyle(color: Colors.blue),),),
                          DataColumn(label: Text('Reason',style: TextStyle(color: Colors.blue),),),
                          DataColumn(label: Text('Delete',style: TextStyle(color: Colors.blue),),), // Added delete column
                        ],
                        rows: List.generate(
                          leaveList.length,
                              (index) => DataRow(
                            cells: [
                              DataCell(Text(leaveList[index].name)),
                              DataCell(Text(leaveList[index].date)),
                              DataCell(Text(leaveList[index].type)),
                              DataCell(Text(leaveList[index].reason)),
                              DataCell(IconButton( // Delete icon button
                                icon: Icon(Icons.delete,color: Colors.red,),
                                onPressed: () => deleteLeave(index),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropList extends StatelessWidget {
  final TextEditingController usedController;
  final String selectedOption;
  final List<String> options;
  final bool isOpen;
  final String labelText;
  final Function(String) onOptionSelected;
  final VoidCallback toggleDropdown;

  DropList({
    required this.labelText,
    required this.usedController,
    required this.options,
    required this.selectedOption,
    required this.isOpen,
    required this.onOptionSelected,
    required this.toggleDropdown,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: toggleDropdown,
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: usedController,
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: 'Select Option',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
          ),
        ),
        if (isOpen)
          Container(
            padding: EdgeInsets.only(top: 8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: <Widget>[
                for (String option in options)
                  InkWell(
                    onTap: () {
                      onOptionSelected(option);
                    },
                    child: ListTile(
                      title: Text(option),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
