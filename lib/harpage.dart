import 'package:flutter/material.dart';


class HardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SBuilder(),
    );
  }
}

class SBuilder extends StatefulWidget {
  SBuilder({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<SBuilder> {

  Stream<int> numb = (() async* {
    await Future<void>.delayed(Duration(seconds: 2));
    yield 1;
    await Future<void>.delayed(Duration(seconds: 2));
    yield 2;
    await Future<void>.delayed(Duration(seconds: 2));
    yield 3;
    await Future<void>.delayed(Duration(seconds: 2));
    yield 4;
    await Future<void>.delayed(Duration(seconds: 2));
    yield 5;
    await Future<void>.delayed(Duration(seconds: 2));
  })();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 10.0,
      ),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.button,
        textAlign: TextAlign.center,
        child: Container(
          alignment: FractionalOffset.center,
          color: Colors.white,
          child: StreamBuilder<int>(
            stream: numb,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              List<Widget> children;
              if (snapshot.hasError) {
                children = <Widget>[
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ];
              } else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    children = <Widget>[
                      Icon(
                        Icons.info,
                        color: Colors.orange,
                        size: 60,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Not connected'),
                      )
                    ];
                    break;
                  case ConnectionState.waiting:
                    children = <Widget>[
                      SizedBox(
                        child: const CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Waiting for connection'),
                      )
                    ];
                    break;
                  case ConnectionState.active:
                    children = <Widget>[
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('${snapshot.data}'),
                      )
                    ];
                    break;
                  case ConnectionState.done:
                    children = <Widget>[
                      Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('FINISHED'),
                      )
                    ];
                    break;
                }
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              );
            },
          ),
        ),
      ),
    );
  }
}