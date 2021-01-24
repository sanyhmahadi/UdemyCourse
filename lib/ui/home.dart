import 'package:flutter/material.dart';

class BillingSystem extends StatefulWidget {
  @override
  _BillingSystemState createState() => _BillingSystemState();
}

class _BillingSystemState extends State<BillingSystem> {
  int _tipPercent = 0;
  int _personCount = 1;
  double _billamont = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      alignment: Alignment.center,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20.5),
        children: [
          Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(16.5)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Person",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "\$ ${calculateTotalPerPerson(_billamont, _personCount, _tipPercent)}",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: Colors.blueGrey.shade500, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(16.5)),
            child: Column(
              children: [
                TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.purple),
                    decoration: InputDecoration(
                        prefixText: "Bill Ammount:-   ",
                        prefixIcon: Icon(Icons.attach_money)),
                    onChanged: (String value) {
                      try {
                        _billamont = double.parse(value);
                      } catch (e) {
                        _billamont = 0.0;
                      }
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Split",
                      style: TextStyle(
                        fontSize: 30.5,
                        color: Colors.green.shade500,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_personCount > 1) {
                                _personCount--;
                              } else {
                                //nothing to do
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.cyanAccent),
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 27.0),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "$_personCount",
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _personCount++;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.cyanAccent),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0),
                              ),
                            ),
                          ),
                        ),

                        //Tip function work
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tip",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      Text(
                        "\% ${(calculteTotalTip(
                          _billamont,
                          _personCount,
                          _tipPercent,
                        )).toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      )
                    ],
                  ),
                ),
                //Slider part
                Column(
                  children: [
                    Text(
                      "$_tipPercent %",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
                Slider(
                  min: 0,
                  max: 100,
                  activeColor: Colors.purple,
                  inactiveColor: Colors.grey,
                  divisions: 10,
                  value: _tipPercent.toDouble(),
                  onChanged: (double newValuse) {
                    setState(() {
                      _tipPercent = newValuse.round();
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercent) {
    var totalPerPerson =
        (calculteTotalTip(billAmount, splitBy, tipPercent) + billAmount) /
            splitBy;

    return totalPerPerson.toStringAsFixed(2);
  }

  calculteTotalTip(double billAmount, int splitBy, int tipPercent) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
      //no go

    } else {
      totalTip = (tipPercent * billAmount) / 100;
    }
    return totalTip;
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best.",
    "Be yourself; everyone else is already taken.",
    "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: 350,
                  height: 200,
                  margin: EdgeInsets.all(14.5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(14.5),
                  ),
                  child: Center(
                      child: Text(
                    quotes[_index % quotes.length],
                    style: TextStyle(
                        color: Colors.yellow.shade600, fontSize: 16.0),
                  )),
                ),
              ),
            ),
            Divider(
              thickness: 2.3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: FlatButton.icon(
                  onPressed: _quotes,
                  icon: Icon(Icons.wb_sunny),
                  color: Colors.green.shade500,
                  label: Text(
                    "Next..!!",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void _quotes() {
    setState(() {
      _index++;
    });
  }
}

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
