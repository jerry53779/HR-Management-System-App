import 'package:flutter/material.dart';
import 'drawer.dart' as MyDrawer;
import 'package:intl/intl.dart';
import 'employee.dart';
//import 'employees_list.dart';

class AddEmployeesPage extends StatefulWidget {
  @override
  _AddEmployeesPageState createState() => _AddEmployeesPageState();
}

class _AddEmployeesPageState extends State<AddEmployeesPage> {
  List<Employee> employeesList = []; // List to hold employees

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _contactController = TextEditingController();
  final _employeecodeController = TextEditingController();
  final _dobController = TextEditingController();
  final _joinController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _addressController = TextEditingController();
  final _bankController = TextEditingController();
  final _accountnumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Separate controllers and state variables for each dropdown
  final _departmentController = TextEditingController();
  final _designationController = TextEditingController();
  final _roleController = TextEditingController();
  final _genderController = TextEditingController();
  final _bloodController = TextEditingController();

  String selectedDepartment = 'Select Option';
  String selectedDesignation = 'Select Option';
  String selectedRole = 'Select Option';
  String selectedGender = 'Select Option';
  String selectedBlood = 'Select Option';

  bool isDepartmentDropdownOpen = false;
  bool isDesignationDropdownOpen = false;
  bool isRoleDropdownOpen = false;
  bool isGenderDropdownOpen = false;
  bool isBloodDropdownOpen = false;

  // GlobalKey to access DateSelector state
  final dobSelectorKey = GlobalKey<DateSelectorState>();
  final joinSelectorKey = GlobalKey<DateSelectorState>();

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _employeecodeController.dispose();
    _departmentController.dispose();
    _designationController.dispose();
    _roleController.dispose();
    _genderController.dispose();
    _bloodController.dispose();
    _contactController.dispose();
    _dobController.dispose();
    _joinController.dispose();
    _nationalityController.dispose();
    _addressController.dispose();
    _bankController.dispose();
    _accountnumberController.dispose();
    _passwordController.dispose();
    super.dispose();
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
      drawer: MyDrawer.MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Add Employees',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Employee Details',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextBox(
                      labelText: 'First Name',
                      controller: _firstnameController,
                    ),
                    TextBox(
                      labelText: 'Last Name',
                      controller: _lastnameController,
                    ),
                    TextBox(
                      labelText: 'Employee Code',
                      controller: _employeecodeController,
                    ),
                    SizedBox(height: 10.0),
                    DropdownList(
                      labelText: 'Department',
                      usedController: _departmentController,
                      options: ['CSE', 'CE', 'ME', 'EC', 'EEE'],
                      selectedOption: selectedDepartment,
                      isOpen: isDepartmentDropdownOpen,
                      onOptionSelected: (String option) {
                        setState(() {
                          selectedDepartment = option;
                          _departmentController.text = option;
                          isDepartmentDropdownOpen = false;
                        });
                      },
                      toggleDropdown: () {
                        setState(() {
                          isDepartmentDropdownOpen = !isDepartmentDropdownOpen;
                          isDesignationDropdownOpen = false;
                          isRoleDropdownOpen = false;
                          isGenderDropdownOpen = false;
                          isBloodDropdownOpen = false;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    DropdownList(
                      labelText: 'Designation',
                      usedController: _designationController,
                      options: ['Manager', 'Engineer', 'Developer'],
                      selectedOption: selectedDesignation,
                      isOpen: isDesignationDropdownOpen,
                      onOptionSelected: (String option) {
                        setState(() {
                          selectedDesignation = option;
                          _designationController.text = option;
                          isDesignationDropdownOpen = false;
                        });
                      },
                      toggleDropdown: () {
                        setState(() {
                          isDesignationDropdownOpen =
                              !isDesignationDropdownOpen;
                          isDepartmentDropdownOpen = false;
                          isRoleDropdownOpen = false;
                          isGenderDropdownOpen = false;
                          isBloodDropdownOpen = false;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    DropdownList(
                      labelText: 'Role',
                      usedController: _roleController,
                      options: ['Manager', 'Employee', 'Others'],
                      selectedOption: selectedRole,
                      isOpen: isRoleDropdownOpen,
                      onOptionSelected: (String option) {
                        setState(() {
                          selectedRole = option;
                          _roleController.text = option;
                          isRoleDropdownOpen = false;
                        });
                      },
                      toggleDropdown: () {
                        setState(() {
                          isRoleDropdownOpen = !isRoleDropdownOpen;
                          isDepartmentDropdownOpen = false;
                          isDesignationDropdownOpen = false;
                          isGenderDropdownOpen = false;
                          isBloodDropdownOpen = false;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    DropdownList(
                      labelText: 'Gender',
                      usedController: _genderController,
                      options: ['MALE', 'FEMALE', 'OTHERS'],
                      selectedOption: selectedGender,
                      isOpen: isGenderDropdownOpen,
                      onOptionSelected: (String option) {
                        setState(() {
                          selectedGender = option;
                          _genderController.text = option;
                          isGenderDropdownOpen = false;
                        });
                      },
                      toggleDropdown: () {
                        setState(() {
                          isGenderDropdownOpen = !isGenderDropdownOpen;
                          isDepartmentDropdownOpen = false;
                          isDesignationDropdownOpen = false;
                          isRoleDropdownOpen = false;
                          isBloodDropdownOpen = false;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    DropdownList(
                      labelText: 'Blood Group',
                      usedController: _bloodController,
                      options: [
                        'A+',
                        'A-',
                        'B+',
                        'B-',
                        'O+',
                        'O-',
                        'AB+',
                        'AB-'
                      ],
                      selectedOption: selectedBlood,
                      isOpen: isBloodDropdownOpen,
                      onOptionSelected: (String option) {
                        setState(() {
                          selectedBlood = option;
                          _bloodController.text = option;
                          isBloodDropdownOpen = false;
                        });
                      },
                      toggleDropdown: () {
                        setState(() {
                          isBloodDropdownOpen = !isBloodDropdownOpen;
                          isDepartmentDropdownOpen = false;
                          isDesignationDropdownOpen = false;
                          isRoleDropdownOpen = false;
                          isGenderDropdownOpen = false;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextBox(
                      labelText: 'Contact Number',
                      controller: _contactController,
                    ),
                    SizedBox(height: 20.0),
                    DateSelector(
                      labelText: "Date of Birth",
                      key: dobSelectorKey, // Assign the GlobalKey
                      controller: _dobController,
                    ),
                    SizedBox(height: 20.0),
                    DateSelector(
                        labelText: "Date of Joining",
                        key: joinSelectorKey,
                        controller: _joinController),
                    SizedBox(
                      height: 20,
                    ),
                    TextBox(
                        labelText: "Nationality",
                        controller: _nationalityController),
                    SizedBox(
                      height: 20,
                    ),
                    TextBox(
                        labelText: "Address", controller: _addressController),
                    SizedBox(
                      height: 20,
                    ),
                    TextBox(
                        labelText: "Bank Name", controller: _bankController),
                    SizedBox(
                      height: 20,
                    ),
                    TextBox(
                        labelText: "Bank Account Number",
                        controller: _accountnumberController),
                    SizedBox(
                      height: 20,
                    ),
                    TextBox(
                        labelText: "Email Id", controller: _emailController),
                    SizedBox(
                      height: 20,
                    ),
                    TextBox(
                        labelText: "Password", controller: _passwordController),
                    SizedBox(height: 20),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          // Aligns children horizontally with space evenly distributed
                          ElevatedButton(
                            onPressed: () {
                              // Print statements for testing, you can remove these
                              print('First Name: ${_firstnameController.text}');
                              print('Last Name: ${_lastnameController.text}');
                              print(
                                  'Employee Code: ${_employeecodeController.text}');
                              print(
                                  'Selected Department: ${_departmentController.text}');
                              print(
                                  'Selected Designation: ${_designationController.text}');
                              print('Selected Role: ${_roleController.text}');
                              print(
                                  'Selected Gender: ${_genderController.text}');
                              print(
                                  'Selected Blood Group: ${_bloodController.text}');
                              print(
                                  'Contact Number: ${_contactController.text}');
                              print('Date of Birth: ${_dobController.text}');
                              print("Date of Join: ${_joinController.text}");
                              print(
                                  "Nationality: ${_nationalityController.text}");
                              print("Address: ${_addressController.text}");
                              print("Bank Name: ${_bankController.text}");
                              print(
                                  "Bank Account Number: ${_accountnumberController.text}");
                              print("Password: ${_passwordController.text}");

                              Employee newEmployee = Employee(
                                firstName: _firstnameController.text,
                                lastName: _lastnameController.text,
                                employeeCode: _employeecodeController.text,
                                department: _departmentController.text,
                                designation: _designationController.text,
                                role: _roleController.text,
                                gender: _genderController.text,
                                bloodGroup: _bloodController.text,
                                contactNumber: _contactController.text,
                                dob: _dobController.text,
                                dateOfJoining: _joinController.text,
                                nationality: _nationalityController.text,
                                address: _addressController.text,
                                bankName: _bankController.text,
                                accountNumber: _accountnumberController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              );

                              // Add the new employee to the list
                              employeesList.add(newEmployee);

                              // Add logic to save or process employee data

                              // Clear all fields after submission
                              _firstnameController.clear();
                              _lastnameController.clear();
                              _employeecodeController.clear();
                              _departmentController.text = 'Select Option';
                              selectedDepartment = 'Select Option';
                              _designationController.text = 'Select Option';
                              selectedDesignation = 'Select Option';
                              _roleController.text = 'Select Option';
                              selectedRole = 'Select Option';
                              _genderController.text = 'Select Option';
                              selectedGender = 'Select Option';
                              _bloodController.text = 'Select Option';
                              selectedBlood = 'Select Option';
                              _contactController.clear();
                              _nationalityController.clear();
                              _addressController.clear();
                              _bankController.clear();
                              _accountnumberController.clear();
                              _emailController.clear();
                              _passwordController.clear();
                              _dobController.clear();
                              _joinController.clear();


                              // Clear date selected in DateSelector
                              dobSelectorKey.currentState?.clearDate();
                              joinSelectorKey.currentState?.clearDate();


                              // Update state to reflect changes
                              setState(() {
                                isDepartmentDropdownOpen = false;
                                isDesignationDropdownOpen = false;
                                isRoleDropdownOpen = false;
                                isGenderDropdownOpen = false;
                                isBloodDropdownOpen = false;
                              });
                            },
                            child: Text('Add Employee'),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
// Clear all fields
                              _firstnameController.clear();
                              _lastnameController.clear();
                              _employeecodeController.clear();
                              _departmentController.text = 'Select Option';
                              selectedDepartment = 'Select Option';
                              _designationController.text = 'Select Option';
                              selectedDesignation = 'Select Option';
                              _roleController.text = 'Select Option';
                              selectedRole = 'Select Option';
                              _genderController.text = 'Select Option';
                              selectedGender = 'Select Option';
                              _bloodController.text = 'Select Option';
                              selectedBlood = 'Select Option';
                              _contactController.clear();

// Clear date selected in DateSelector
                              dobSelectorKey.currentState?.clearDate();

// Update state to reflect changes
                              setState(() {
                                isDepartmentDropdownOpen = false;
                                isDesignationDropdownOpen = false;
                                isRoleDropdownOpen = false;
                                isGenderDropdownOpen = false;
                                isBloodDropdownOpen = false;
                              });
                            },
                            child: Text('Reset'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Container to display employeesList in a DataTable
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Employee Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 20.0,
                        headingTextStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                        columns: [
                          DataColumn(label: Text('First Name')),
                          DataColumn(label: Text('Last Name')),
                          DataColumn(label: Text('Employee Code')),
                          DataColumn(label: Text('Department')),
                          DataColumn(label: Text('Designation')),
                          DataColumn(label: Text('Role')),
                          DataColumn(label: Text('Gender')),
                          DataColumn(label: Text('Blood Group')),
                          DataColumn(label: Text('Contact Number')),
                          DataColumn(label: Text('Date of Birth')),
                          DataColumn(label: Text('Date of Joining')),
                          DataColumn(label: Text('Nationality')),
                          DataColumn(label: Text('Address')),
                          DataColumn(label: Text('Bank Name')),
                          DataColumn(label: Text('Bank Account Number')),
                          DataColumn(label: Text('Email Id')),
                          DataColumn(label: Text('Password')),
                        ],
                        rows: employeesList
                            .map((employee) => DataRow(
                                  cells: [
                                    DataCell(Text(employee.firstName)),
                                    DataCell(Text(employee.lastName)),
                                    DataCell(Text(employee.employeeCode)),
                                    DataCell(Text(employee.department)),
                                    DataCell(Text(employee.designation)),
                                    DataCell(Text(employee.role)),
                                    DataCell(Text(employee.gender)),
                                    DataCell(Text(employee.bloodGroup)),
                                    DataCell(Text(employee.contactNumber)),
                                    DataCell(Text(employee.dob)),
                                    DataCell(Text(employee.dateOfJoining)),
                                    DataCell(Text(employee.nationality)),
                                    DataCell(Text(employee.address)),
                                    DataCell(Text(employee.bankName)),
                                    DataCell(Text(employee.accountNumber)),
                                    DataCell(Text(employee.email)),
                                    DataCell(Text(employee.password)),
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  TextBox({
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.0),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdownList extends StatelessWidget {
  final TextEditingController usedController;
  final String selectedOption;
  final List<String> options;
  final bool isOpen;
  final String labelText;
  final Function(String) onOptionSelected;
  final VoidCallback toggleDropdown;

  DropdownList({
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

class DateSelector extends StatefulWidget {
  final String labelText; // Label text to display before the text field
  final TextEditingController controller; // Customize the controller name

  const DateSelector(
      {Key? key, required this.labelText, required this.controller})
      : super(key: key);

  @override
  State<DateSelector> createState() => DateSelectorState();
}

class DateSelectorState extends State<DateSelector> {
  DateTime selectedDate = DateTime.now();

  void clearDate() {
    setState(() {
      selectedDate = DateTime.now(); // Reset to current date
      widget.controller.clear(); // Clear the text field
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        widget.controller.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: IgnorePointer(
        child: TextFormField(
          controller: widget.controller,
          enabled: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
            labelText: widget.labelText,
            hintText: "Select Date", // Use labelText as hintText
          ),
        ),
      ),
    );
  }
}
