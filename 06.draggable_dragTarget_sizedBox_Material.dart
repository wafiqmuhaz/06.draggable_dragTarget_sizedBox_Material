import "package:flutter/material.dart";

void main() {
  runApp(allone());
}

class allone extends StatefulWidget {
  const allone({Key? key}) : super(key: key);

  @override
  _alloneState createState() => _alloneState();
}

class _alloneState extends State<allone> {
  Color color1 = Colors.red;
  Color color12 = Colors.pink;
  late Color target;
  bool acc = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("AllOne"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Draggable<Color>(
                    data: color1,
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Material(
                        color: color1,
                        shape: StadiumBorder(),
                        elevation: 5,
                      ),
                    ),
                    childWhenDragging: SizedBox(
                      height: 50,
                      width: 50,
                      child: Material(
                        color: Colors.grey,
                        shape: StadiumBorder(),
                        elevation: 5,
                      ),
                    ),
                    feedback: SizedBox(
                      height: 50,
                      width: 50,
                      child: Material(
                        color: color1.withOpacity(0.5),
                        shape: StadiumBorder(),
                        elevation: 5,
                      ),
                    ),
                  ),
                ],
              ),
              DragTarget<Color>(
                onWillAccept: (value) => true,
                onAccept: (value) {
                  acc = true;
                  target = value;
                },
                builder: (context, candidate, rejected) {
                  return (acc)
                      ? SizedBox(
                          height: 100,
                          width: 100,
                          child: Material(
                            color: target,
                            shape: StadiumBorder(),
                            elevation: 5,
                          ),
                        )
                      : SizedBox(
                          height: 100,
                          width: 100,
                          child: Material(
                            color: Colors.black26,
                            shape: StadiumBorder(),
                            elevation: 5,
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
