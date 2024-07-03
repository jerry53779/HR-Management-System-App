import 'package:flutter/material.dart';
import 'package:internapp/drawer.dart'; // Assuming MyDrawer is defined in drawer.dart

class AddDesignation extends StatefulWidget {
  @override
  _AddDesignationState createState() => _AddDesignationState();
}

class _AddDesignationState extends State<AddDesignation> {
  List<String> designationList = [
    "Vice Chairman",
    "Chief Executive Officer",
    "Software Engineer",
    "Sales Manager"
  ];
  TextEditingController designationNameController = TextEditingController();
  TextEditingController editController = TextEditingController();
  bool isEditing = false;
  int editIndex = -1;

  @override
  void dispose() {
    designationNameController.dispose();
    editController.dispose();
    super.dispose();
  }

  void addDesignation() {
    String designationName = designationNameController.text.trim();
    if (designationName.isNotEmpty) {
      setState(() {
        List<String> updatedDesignationList = [...designationList];
        if (isEditing) {
          // Editing an existing designation
          updatedDesignationList[editIndex] = designationName;
          isEditing = false; // Reset editing mode
          editIndex = -1; // Reset editIndex
          editController.clear();
          designationNameController.clear(); // Clear editController
        } else {
          // Adding a new designation
          updatedDesignationList.add(designationName);
          designationNameController.clear(); // Clear designationNameController
        }
        designationList = updatedDesignationList;
      });
    }
  }

  void deleteDesignation(int index) {
    setState(() {
      designationList.removeAt(index);
    });
  }

  void startEdit(int index) {
    setState(() {
      editIndex = index;
      editController.text = designationList[index];
      isEditing = true;
    });
  }

  void cancelEdit() {
    setState(() {
      isEditing = false;
      editIndex = -1;
      editController.clear(); // Clear edit controller
      designationNameController.clear(); // Clear designationNameController (if needed)
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
                  "Designation",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                // Add your designation-related UI components here
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
                        isEditing ? "Edit Designation" : "Add Designation",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: isEditing ? editController : designationNameController,
                        decoration: InputDecoration(
                          labelText: isEditing ? 'Edit Designation Name' : 'Designation Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: addDesignation,
                            child: Text(isEditing ? 'Save Changes' : 'Add Designation'),
                          ),
                          ElevatedButton(
                            onPressed: isEditing ? cancelEdit : () => designationNameController.clear(),
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
                        'Added Designations:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: designationList.length,
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
                                Text(designationList[index]),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () => startEdit(index),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () => deleteDesignation(index),
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
