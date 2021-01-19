import 'package:flutter/material.dart';

class Scafolder extends StatelessWidget {
  _onPressedButton() {
    debugPrint("Icon Tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FIRST APP"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
        actions: [
          IconButton(
            icon: Icon(Icons.access_alarm),
            onPressed: _onPressedButton(),
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: _onPressedButton(),
          )
        ],
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(),

            // InkWell(
            //   child: Text(
            //     "Hello",
            //     style: TextStyle(color: Colors.white, fontSize: 25),
            //   ),
            //   onTap: () => _onPressedButton,
            // )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Next page Connecting....!!!"),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          "Tap this",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.redAccent,
      child: Center(
        child: Text(
          "Hello Sany",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 25),
        ),
      ),
    );
  }
}
