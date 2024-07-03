import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for SystemNavigator.pop()
import 'package:internapp/actuallogin.dart';
import 'package:internapp/adddepartment.dart';
import 'package:internapp/adddesignation.dart';
import 'package:internapp/addemployees.dart'; // Assuming 'addemployees.dart' contains AddEmployeesPage
import 'package:internapp/dashboard2.dart';
import 'package:internapp/leave.dart';
import 'package:internapp/main.dart';
import 'assets.dart';
import 'package:internapp/login.dart';// Assuming 'assets.dart' contains the definition of 'dp'

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black87,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(dp), // Load local asset image
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12), // Add spacing between image and text
                      Text(
                        "HRMS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                    child: Center(
                      child: Divider(
                        thickness: 0.15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://media.licdn.com/dms/image/C5603AQEhr_V2ZDpFPA/profile-displayphoto-shrink_800_800/0/1516836395321?e=2147483647&v=beta&t=AF7kLKgrPgZUnCKOwkXyQ3ZP4eex4P7xTZWEHrH6Tjw", // Replace with your actual image URL
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20), // Add spacing between image and text
                      Text(
                        "Admin",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Tiles(
              iconname: Icons.dashboard,
              showtext: "Dashboard",
              redirect: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPage()),
                );
              },
              subMenu: [],
            ),
            Tiles(
              iconname: Icons.book_online,
              showtext: "Organisation",
              redirect: () {},
              subMenu: [
                Tiles(
                  iconname: Icons.add,
                  showtext: "Staff Dashboard",
                  redirect: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard2()),
                    );
                  },
                ),

                Tiles(
                  iconname: Icons.add,
                  showtext: "Edit Department",
                  redirect: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddDepartment()),
                    );
                  },
                ),
                Tiles(
                  iconname: Icons.add,
                  showtext: "Edit Designation",
                  redirect: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddDesignation()),
                    );
                  },
                ),
                Tiles(
                  iconname: Icons.add,
                  showtext: "Apply Leave",
                  redirect: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LeaveApp()),
                    );
                  },
                ),
              ],
            ),
            Tiles(
              iconname: Icons.book,
              showtext: "Employees",
              redirect: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddEmployeesPage()),
                );
              },
              subMenu: [
                Tiles(
                  iconname: Icons.add,
                  showtext: "Add Employee",
                  redirect: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddEmployeesPage()),
                    );
                  },
                ),
              ],
            ),
            Tiles(
              iconname: Icons.book,
              showtext: "Generate",
              redirect: () {},
              subMenu: [],
            ),
            Tiles(
              iconname: Icons.logout,
              showtext: "Logout",
              redirect: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('No', style: TextStyle()),
                        ),
                        TextButton(
                          onPressed: () {
                            // Perform logout action here
                            // Navigator.of(context).pop();
                            // SystemNavigator.pop(); // This exits the app
                            Navigator.of(context).pop(); // Dismiss the dialog
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApplication()),
                            );

                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
              subMenu: [],
            ),
          ], // Closing the children list of ListView
        ), // Closing the ListView
      ),
    );
  }
}

class Tiles extends StatelessWidget {
  final IconData iconname;
  final String showtext;
  final VoidCallback redirect;
  final List<Tiles>? subMenu; // Optional list of sub-menu items

  Tiles({
    required this.iconname,
    required this.showtext,
    required this.redirect,
    this.subMenu,
  });

  @override
  Widget build(BuildContext context) {
    if (subMenu != null && subMenu!.isNotEmpty) {
      return ExpansionTile(
        leading: Icon(iconname, color: Colors.white),
        title: Text(
          showtext,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.arrow_drop_down, color: Colors.white),
        children: subMenu!
            .map((item) => ListTile(
          title: Text(
            item.showtext,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          onTap: item.redirect,
        ))
            .toList(),
      );
    } else {
      return ListTile(
        leading: Icon(iconname, color: Colors.white),
        title: Text(
          showtext,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(Icons.arrow_right, color: Colors.white),
        onTap: redirect,
      );
    }
  }
}
