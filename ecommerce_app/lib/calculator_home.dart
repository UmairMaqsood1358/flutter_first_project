import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double price = 0.0;
  int totalperson = 1;
  double tippercentage = 0.0;
  @override
  Widget build(BuildContext context) {
    var mystyle = TextStyle(fontSize: 20);
    var mytext = TextStyle(fontSize: 25, color: Colors.white);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Bill and Tip Calculator",
                    textAlign: TextAlign.center,
                    style: mystyle,
                  ),
                  Container(
                    height: 170,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      color: Colors.purple,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Per Person Bill is",
                          style: mytext,
                        ),
                        Text(
                          "${((price + (tippercentage / 100) * price) / totalperson).toStringAsFixed(0)}",
                          style: mytext,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    onChanged: (v) {
                      setState(() {
                        price = double.parse(v);
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter the Amount",
                      labelText: "Enter the Amount",
                      prefix: Icon(Icons.price_change_outlined),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Split By"),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (totalperson > 1) totalperson--;
                                  });
                                },
                                icon: Icon(Icons.exposure_neg_1)),
                            Text(
                              "$totalperson",
                              style: mystyle,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    totalperson++;
                                  });
                                },
                                icon: Icon(Icons.exposure_plus_1)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Text(
                        "Tip Percentage",
                        style: mystyle,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$tippercentage",
                        style: mystyle,
                      ),
                    ],
                  ),
                  Slider(
                    divisions: 10,
                    value: tippercentage,
                    onChanged: (v) {
                      setState(() {
                        tippercentage = v;
                      });
                    },
                    min: 0,
                    max: 100,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
