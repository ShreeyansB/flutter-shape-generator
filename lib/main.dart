import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Xyz());
  }
}

class Xyz extends StatefulWidget {
  @override
  _XyzState createState() => _XyzState();
}

class _XyzState extends State<Xyz> {
  var shape = ['Circle', 'Square'];
  var currentItem = 'Square';
  var inputText = TextEditingController();
  double size = 220;
  double shapeRadius = 0;

  void dispose() {
    inputText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfff7f7f7),
        appBar: AppBar(
          title: Text('SHAPE CHANGER',
              style: TextStyle(
                  color: Color(0xfff7f7f7),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1)),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color(0xffff9a9e),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              "SHAPE",
              style: TextStyle(
                  color: Colors.grey[350],
                  fontSize: 17,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: Color(0xffff9a9e),
                    style: BorderStyle.solid,
                    width: 2),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.grey[100],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    elevation: 1,
                    iconEnabledColor: Color(0xffff9a9e),
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: shape.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: TextStyle(
                              color: Color(0xffff9a9e),
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      setState(() {
                        this.currentItem = value;
                        print(value);
                        if (value == 'Circle') {
                          shapeRadius = MediaQuery.of(context).size.width / 2;
                        } else
                          shapeRadius = 0;
                      });
                    },
                    value: currentItem,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "EDIT SHAPE",
              style: TextStyle(
                  color: Colors.grey[350],
                  fontSize: 17,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(primary: Colors.red[200])),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                  child: Slider(
                    activeColor: Color(0xffff9a9e),
                    min: 0,
                    max: MediaQuery.of(context).size.width,
                    onChanged: (newValue) {
                      setState(() {
                        size = newValue;
                      });
                    },
                    value: size,
                  )),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(primary: Colors.red[200])),
              child: Padding(
                padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                child: Slider(
                  activeColor: Color(0xffff9a9e),
                  min: 0,
                  max: MediaQuery.of(context).size.width / 2,
                  onChanged: (newValue) {
                    setState(() {
                      if (currentItem == 'Square')
                        shapeRadius = newValue;
                      else
                        shapeRadius = MediaQuery.of(context).size.width / 2;
                    });
                  },
                  value: shapeRadius,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(shapeRadius),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0, 0.8],
                    colors: [Color(0xfffad0c4), Color(0xffff9a9e)]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
