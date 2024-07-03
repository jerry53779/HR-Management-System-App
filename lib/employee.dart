// Create a new file named employee.dart
class Employee {
  final String firstName;
  final String lastName;
  final String employeeCode;
  final String department;
  final String designation;
  final String role;
  final String gender;
  final String bloodGroup;
  final String contactNumber;
  final String dob;
  final String dateOfJoining;
  final String nationality;
  final String address;
  final String bankName;
  final String accountNumber;
  final String email;
  final String password;

  Employee({
    required this.firstName,
    required this.lastName,
    required this.employeeCode,
    required this.department,
    required this.designation,
    required this.role,
    required this.gender,
    required this.bloodGroup,
    required this.contactNumber,
    required this.dob,
    required this.dateOfJoining,
    required this.nationality,
    required this.address,
    required this.bankName,
    required this.accountNumber,
    required this.email,
    required this.password,
  });
}

List<Employee> employeesList = [];

class ApplyLeave {
  final String name;
  final String date;
  final String type;
  final String reason;

  ApplyLeave(
      {required this.name,
      required this.date,
      required this.type,
      required this.reason});
}
List<ApplyLeave>leaveList=[];
