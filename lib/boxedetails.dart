import 'package:flutter/material.dart';

class Boxes extends StatelessWidget {
  final Color colors;
  final String number;
  final String heading;
  final IconData design;
  final VoidCallback function;

  Boxes({
    required this.colors,
    required this.number,
    required this.heading,
    required this.design,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.all(20),
        height: 220, // Adjusted height for the whole box
        width: 300,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              right: 0,
              child: Icon(
                design,
                color: Colors.black12,
                size: 140, // Adjusted size for the additional icon
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 12),
                  child: Text(
                    number.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 64, // Adjusted font size for number
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 8),
                  child: Text(
                    heading,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32, // Adjusted font size for heading
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 40, // Adjusted height for the "More Info" container
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "More Info",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18, // Adjusted font size for "More Info"
                        ),
                      ),
                      SizedBox(width: 5), // Spacer between text and icon
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
