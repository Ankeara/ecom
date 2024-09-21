import 'package:ecom/screens/home_screen.dart';
import 'package:flutter/material.dart';

class home_appbar extends StatelessWidget {
  const home_appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(), // Pass the destination page
            ),
          );
        },
      ),
      title: Text(
        'Your Cart',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
