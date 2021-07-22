import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //! Required Variables
  // Default bill amount
  static const defaultBillAmount = 0.0;

  // Default tip percentage
  static const defaultTipPercentage = 15.0;

  // TextEditing Controller which is used to keep track of the change in bill amount
  final _billAmountController =
      TextEditingController(text: defaultBillAmount.toString());

  // TextEditing Controller which is used to keep track of the change in tip percentage
  final _tipPercentageController =
      TextEditingController(text: defaultTipPercentage.toString());

  // Stores the Latest Value of the bill amount calculated.
  double _billAmount = defaultBillAmount;

  // Stores the Latest Value of the tip percentage calculated.
  double _tipPercentage = defaultTipPercentage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Tip Calculator",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white70,
      ),
      body: Container(
        color: Colors.white70,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                key: Key("billAmount"),
                controller: _billAmountController,
                //* keyboardType property enables us to show the required type of keyboard,
                //* when the user taps on the input field. 
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                //* Style our input fields
                decoration: InputDecoration(
                  hintText: 'Enter Bill Amount',
                  labelText: 'Bill Amount',
                  labelStyle: TextStyle(
                      fontSize: 25,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                  fillColor: Colors.white,
                  //* to show a curved outline border
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              TextFormField(key: Key("tipPercentage"),
              controller: _tipPercentageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter the Tip Percentage',
                labelText: 'Tip Percentage',
                labelStyle: TextStyle(
                  fontSize: 25,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold
                ),
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
