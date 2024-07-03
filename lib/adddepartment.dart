import 'package:flutter/material.dart';
import 'package:internapp/drawer.dart'; // Assuming MyDrawer is defined in drawer.dart

class AddDepartment extends StatefulWidget {
  @override
  _AddDepartmentState createState() => _AddDepartmentState();
}

class _AddDepartmentState extends State<AddDepartment> {
  List<String> departmentList = [
    "Information Technology",
    "Research",
    "Finance HR and Administration",
    "Network Engineering",
    "Sales and Marketing"
  ];
  TextEditingController departmentNameController = TextEditingController();
  TextEditingController editController = TextEditingController();
  bool isEditing = false;
  int editIndex = -1;

  @override
  void dispose() {
    departmentNameController.dispose();
    editController.dispose();
    super.dispose();
  }

  void addDepartment() {
    String departmentName = departmentNameController.text.trim();
    if (departmentName.isNotEmpty) {
      setState(() {
        List<String> updatedDepartmentList = [...departmentList];
        if (isEditing) {
          // Editing an existing department
          updatedDepartmentList[editIndex] = departmentName;
          isEditing = false; // Reset editing mode
          editIndex = -1; // Reset editIndex
          editController.clear();
          departmentNameController.clear();// Clear editController
        } else {
          // Adding a new department
          updatedDepartmentList.add(departmentName);
          departmentNameController.clear(); // Clear departmentNameController
        }
        departmentList = updatedDepartmentList;
      });
    }
  }

  void deleteDepartment(int index) {
    setState(() {
      departmentList.removeAt(index);
    });
  }

  void startEdit(int index) {
    setState(() {
      editIndex = index;
      editController.text = departmentList[index];
      isEditing = true;
    });
  }

  void cancelEdit() {
    setState(() {
      isEditing = false;
      editIndex = -1;
      editController.clear(); // Clear edit controller
      departmentNameController.clear(); // Clear departmentNameController (if needed)
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "HRMS",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
        drawer: MyDrawer(), // Assuming MyDrawer is your custom drawer widget
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Department",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                // Add your department-related UI components here
                // Example: TextFields, Buttons, etc.
                Container(
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
                        isEditing ? "Edit Department" : "Add Department",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: isEditing ? editController : departmentNameController,
                        decoration: InputDecoration(
                          labelText: isEditing ? 'Edit Department Name' : 'Department Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: addDepartment,
                            child: Text(isEditing ? 'Save Changes' : 'Add Department'),
                          ),
                          ElevatedButton(
                            onPressed: isEditing ? cancelEdit : () => departmentNameController.clear(),
                            child: Text(isEditing ? 'Cancel' : 'Reset'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
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
                        'Added Departments:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: departmentList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(departmentList[index]),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () => startEdit(index),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () => deleteDepartment(index),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
