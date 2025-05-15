import 'package:bmi_app/Splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
      ),
      home: Splashscreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    setState(() {

    });
  }

  var weCh = TextEditingController();
  var inCh = TextEditingController();
  var feCh = TextEditingController();

  var result= "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("BMI Checker", style: TextStyle(color: Colors.white),),
      ),
      body:
      Container(
        color: Colors.grey.shade100,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: Colors.grey.shade100,
              child: Center(
                child: Container(
                  width: 370,
                  height: 480,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("BMI", style: TextStyle(color: Colors.black54, fontSize: 30, fontWeight: FontWeight.w700,),),
                      SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: weCh,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text("Enter your Weight(kg)"),
                          prefixIcon: Icon(Icons.monitor_weight),
                          border: OutlineInputBorder()
                        ),

                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: feCh,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            label: Text("Enter your Height(feet)"),
                            prefixIcon: Icon(Icons.height),
                            border: OutlineInputBorder()
                        ),

                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: inCh,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            label: Text("Enter your Height(inch)"),
                            prefixIcon: Icon(Icons.height),
                            border: OutlineInputBorder()
                        ),

                      ),
                      SizedBox(
                        height: 18,
                      ),
                      ElevatedButton(onPressed: (){
                        var wt = weCh.text.toString();
                        var inch = inCh.text.toString();
                        var ft = feCh.text.toString();

                        if(wt!= "" && inch!= "" && ft!= "")
                          {
                            var inwt = int.parse(wt);
                            var inunch = int.parse(inch);
                            var inft = int.parse(ft);

                            var tinch = (inft*12) + inunch;
                            var tCm = tinch * 2.54;
                            var tM = tCm/100;
                            var bmi = inwt / (tM*tM);

                            setState(() {
                              result = "Your BMI is: ${bmi.toStringAsFixed(5)}";
                            });

                          }
                        else{
                          setState(() {
                            result = "Please fill required spaces!!";
                          });
                        }

                      } , child: Text("Calculate", style: TextStyle(color: Colors.grey),),),
                      SizedBox(
                        height: 18,
                      ),
                      Text(result, style: TextStyle(fontSize: 10),),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
