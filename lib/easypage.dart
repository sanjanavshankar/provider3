import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EasyPage extends StatelessWidget {

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 20.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20,),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                  padding: EdgeInsets.all(10.0),
                  child: Consumer<MyModel>(
                    builder: (context, myModel, child){
                      return TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Enter name',
                        ),
                      );
                    },
                  )
              ),

              Container(
                  padding: const EdgeInsets.all(20),
                  child: Consumer<MyModel>(
                    builder: (context, myModel, child) {
                      return RaisedButton(
                        child: Text('Done'),
                        onPressed: (){
                          var name = _controller.text;
                          myModel.doSomething(name);
                        },
                      );
                    },
                  )
              ),

              Container(
                padding: const EdgeInsets.all(35),
                child: Consumer<MyModel>(
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MyModel with ChangeNotifier {
  var someValue = '';

  void doSomething(name) {
    someValue = '$name';
    print(someValue);
    notifyListeners();
  }
}

