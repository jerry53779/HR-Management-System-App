import 'package:flutter/material.dart';
import 'package:internapp/login.dart';

class InputBoxes extends StatefulWidget {
  final String detail;
  final IconData design;
  final TextEditingController? controller;

  InputBoxes({required this.detail, required this.design,required this.controller});

  @override
  _InputBoxesState createState() => _InputBoxesState();
}

class _InputBoxesState extends State<InputBoxes> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    // Initialize controller with the provided one or create a new instance
    _textController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed of
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: _textController, // Set the controller for the TextField
        decoration: InputDecoration(
          labelText: widget.detail,
          suffixIcon: Icon(widget.design),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}



class Check extends StatefulWidget {
  final String checkname;

  Check({required this.checkname});

  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
          activeColor: Colors.blue, // Color when checked
        ),
        SizedBox(width: 8), // Adjust the spacing between checkbox and text
        Text(
          widget.checkname, // Accessing checkname from widget parameter
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}



class Submit extends StatelessWidget {
  final VoidCallback onPressed;

  Submit({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Background color of the button
      ),
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.white, // Text color of the button
          fontSize: 16,
        ),
      ),
    );
  }
}
