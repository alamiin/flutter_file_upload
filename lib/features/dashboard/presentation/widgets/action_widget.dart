import 'package:flutter/material.dart';

Container actionWidget(){
  return Container(
    child: Column(
      children: [
        Text("Perform Action" ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Action 1
              },
              child: Text("Upload"),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                // Action 2
              },
              child: Text("Download"),
            ),
          ],
        ),
      ],
    ),
  );
}