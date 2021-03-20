import 'package:CureAssit/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool unavailableAllDay = false;

  bool firstTime = false;

  bool secondTime = false;

  bool thirdTime = false;

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: SafeArea(
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4,
              tabs: [
                Tab(
                  text: "Bookings",
                ),
                Tab(
                  text: "Availability",
                  icon: Icon(Icons.calendar_today),
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.cancel),
            Column(
              children: [
                SizedBox(height: 5),
                TabBar(
                  controller: TabController(length: 5, vsync: this),
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.grey,
                  indicator: CircleTabIndicator(color: Colors.green, radius: 3),
                  tabs: [
                    Container(
                        width: 100,
                        child: Tab(
                            child:
                                Text("2020", style: TextStyle(fontSize: 20)))),
                    Container(
                        width: 100,
                        child: Tab(
                            child:
                                Text("2021", style: TextStyle(fontSize: 20)))),
                    SizedBox(width: 500),
                    SizedBox(width: 500),
                    SizedBox(width: 500),
                  ],
                ),
                SizedBox(height: 10),
                TabBar(
                    controller: TabController(length: 12, vsync: this),
                    labelColor: Colors.green,
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    unselectedLabelColor: Colors.grey,
                    indicator:
                        CircleTabIndicator(color: Colors.green, radius: 3),
                    isScrollable: true,
                    tabs: [
                      Tab(text: "January"),
                      Tab(text: "Feburary"),
                      Tab(text: "March"),
                      Tab(text: "April"),
                      Tab(text: "May"),
                      Tab(text: "June"),
                      Tab(text: "July"),
                      Tab(text: "August"),
                      Tab(text: "September"),
                      Tab(text: "October"),
                      Tab(text: "November"),
                      Tab(text: "December"),
                    ]),
                SizedBox(height: 20),
                PreferredSize(
                  preferredSize:
                      Size(MediaQuery.of(context).size.width * 0.95, 200),
                  child: Container(
                    height: 70,
                    child: TabBar(
                      controller: TabController(length: 31, vsync: this),
                      labelColor: Colors.greenAccent,
                      isScrollable: true,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightGreen[100]),
                      tabs: getDates(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.black38,
                        offset: Offset(0, -4),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Thursday, 6 August",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "UNAVAILABLE ALL DAY",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: LiteRollingSwitch(
                            value: unavailableAllDay,
                            iconOn: Icons.check,
                            iconOff: Icons.clear,
                            colorOn: Colors.green,
                            colorOff: Colors.red,
                            textOn: "Available",
                            textOff: "Unavailable",
                            onChanged: (value) {
                              if(value != unavailableAllDay)
                              setState((){             
                                unavailableAllDay = value;
                              });
                            },),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "YOUR TIME SLOTS",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                            color: (firstTime)
                                ? Colors.lightGreen[100]
                                : Colors.red[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("10 AM - 12 PM",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: (firstTime)
                                            ? Colors.green
                                            : Colors.red,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: LiteRollingSwitch(
                                    value: firstTime,
                                    iconOn: Icons.check,
                                    iconOff: Icons.clear,
                                    colorOn: Colors.green,
                                    colorOff: Colors.red,
                                    textOn:"Available",
                                    textOff:"Unavailable",
                                    onChanged: (value) {
                                      if(value!= firstTime)
                                      setState(() {
                                        firstTime = value;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                            color: (secondTime)
                                ? Colors.lightGreen[100]
                                : Colors.red[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("2 PM - 4 PM",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: (secondTime)
                                            ? Colors.green
                                            : Colors.red,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: LiteRollingSwitch(
                                    value: secondTime,
                                    iconOn: Icons.check,
                                    iconOff: Icons.clear,
                                    colorOn: Colors.green,
                                    colorOff: Colors.red,
                                    textOn: "Available",
                                    textOff: "Unavailable",
                                    onChanged: (value) {
                                      if(value != secondTime)
                                      setState(() {
                                        secondTime = value;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                            color: (thirdTime)
                                ? Colors.lightGreen[100]
                                : Colors.red[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("5 PM - 6 PM",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: (thirdTime)
                                            ? Colors.green
                                            : Colors.red,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: LiteRollingSwitch(
                                    value: thirdTime,
                                    iconOn: Icons.check,
                                    iconOff: Icons.clear,
                                    colorOn: Colors.green,
                                    colorOff: Colors.red,
                                    textOn: "Available",
                                    textOff: "Unavailable",
                                    onChanged: (value) {
                                      if(value !=thirdTime)
                                      setState(() {
                                        thirdTime = value;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
