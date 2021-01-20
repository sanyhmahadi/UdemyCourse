import 'package:flutter/material.dart';

class BizCurd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biz Curd App"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _getContainer(),
            _getavatar(),
          ],
        ),
      ),
    );
  }

  Container _getContainer() {
    return Container(
      width: 350,
      height: 250,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Md. Mahadi Hasan Sany",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          Text(
            "sanykhan227@gmail.com",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.face_rounded),
              Text("FaceBook: Sany H. Mahadi")
            ],
          )
        ],
      ),
    );
  }

  Container _getavatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.redAccent, width: 1.2),
          image: DecorationImage(
              image: NetworkImage("https://bit.ly/2M5qpOP"),
              fit: BoxFit.cover)),
    );
  }
}

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.mail),
        onPressed: null,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_football_sharp), title: Text("FootBall")),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_cricket_sharp), title: Text("Cricket"))
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
          content: Text(
            "Next page Connecting....!!!",
          ),
          backgroundColor: Colors.blue.shade700,
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

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.redAccent,
//       child: Center(
//         child: Text(
//           "Hello Sany",
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontStyle: FontStyle.italic,
//               fontSize: 25),
//         ),
//       ),
//     );
//   }
// }
