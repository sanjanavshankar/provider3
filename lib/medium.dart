import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Medium extends StatelessWidget {

  PageController pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20,),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              backgroundColor: Colors.white,
              elevation: 10.0,
              centerTitle: true,
              title: Container(
                  child: Consumer<MyModel>(
                    builder: (context, myModel, child){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.shopping_cart, color: Colors.black, size: 30),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.black
                            ),
                            child: Center(child: Text(myModel.cartVal.toString(),
                              style: TextStyle(color: Colors.yellow, fontSize: 20), )),
                          )
                        ],
                      );
                    },
                  )
              ),
            ),
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              controller: pageController,
              children: <Widget>[

                Center(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        child: buildCartItems(Colors.green[200], Icons.fastfood, 50, 150, 200),
                        onTap: (){
                          pageController.jumpToPage(1);
                        },
                      ),
                      GestureDetector(
                        child: buildCartItems(Colors.blue[200], Icons.local_drink, 50, 150, 200),
                        onTap: (){
                          pageController.jumpToPage(2);
                        },
                      ),
                      GestureDetector(
                        child: buildCartItems(Colors.yellow[200], Icons.cake, 50, 150, 200),
                        onTap: (){
                          pageController.jumpToPage(3);
                        },
                      ),
                    ],
                  ),
                ),

                Container(
                    color: Colors.green[200],
                    child: Column(
                      children: <Widget>[

                        Container(
                          child: Column(
                            children: <Widget>[

                              detailsTopView(),
                              SizedBox(height: 30),
                              buildCartItems(Colors.transparent, Icons.fastfood, 100, 300, 300),

                            ],
                          ),
                        )
                      ],
                    )
                ),

                Container(
                    color: Colors.blue[200],
                    child: Column(
                      children: <Widget>[

                        Container(
                          child: Column(
                            children: <Widget>[

                              detailsTopView(),
                              SizedBox(height: 30),
                              buildCartItems(Colors.transparent, Icons.local_drink, 100, 300, 300),

                            ],
                          ),
                        )
                      ],
                    )
                ),

                Container(
                    color: Colors.yellow[200],
                    child: Column(
                      children: <Widget>[

                        Container(
                          child: Column(
                            children: <Widget>[

                              detailsTopView(),
                              SizedBox(height: 30),
                              buildCartItems(Colors.transparent, Icons.cake, 100, 300, 300),

                            ],
                          ),
                        )
                      ],
                    )
                )
              ],
            )
        ),
      ),
    );
  }

  buildCartItems(var colors, var icon, double iconsize, double height, double wid){
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
          height: height,
          width: wid,
          color: colors,
          child: Consumer<MyModel>( //                  <--- Consumer
            builder: (context, myModel, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Icon(icon, color: Colors.black, size: iconsize),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Container(
                            child: GestureDetector(
                                child: Icon(Icons.add, color: Colors.black, size: 20,),
                                onTap: (){
                                  myModel.addItem();
                                  //Provider.of<MyModel>(context, listen: false).addItem;
                                }
                            )
                        ),
                        Container(
                            child: Consumer<MyModel>(
                              builder: (context, myModel, child){
                                return GestureDetector(
                                    child: Icon(Icons.remove, color: Colors.black, size: 20,),
                                    onTap: (){
                                      myModel.removeItem();
                                    }
                                );
                              },
                            )
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          )
      ),
    );
  }

  detailsTopView(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          iconSize: 25,
          onPressed: (){
            pageController.jumpToPage(0);
          },
        ),

        IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.black,
          iconSize: 25,
        ),
      ],
    );
  }
}

class MyModel with ChangeNotifier{
  int cartVal = 0;

  void addItem(){
    if(cartVal>=0){
      cartVal = cartVal+1;
      notifyListeners();
    }
  }

  void removeItem(){
    if(cartVal>=1){
      cartVal = cartVal - 1;
      notifyListeners();
    }
  }
}
