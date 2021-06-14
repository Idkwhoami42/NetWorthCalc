import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constraints.dart';
import 'hero_route.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var assetsMap = {
    "Real Estates": 0,
    "Savings": 0,
    "Digital Assets": 0,
    "Securities": 0,
    "Others": 0
  };

  var assetsList = [
    "Real Estates",
    "Savings",
    "Digital Assets",
    "Securities",
    "Others"
  ];

  var liabilityMap = {
    "Mortgages": 0,
    "Loans": 0,
    "CreditCard Bills": 0,
    "Payment plans": 0,
    "Other Debts": 0
  };

  var liabilityList = [
    "Mortgages",
    "Loans",
    "CreditCard Bills",
    "Payment plans",
    "Other Debts"
  ];

  int assetsum = 0, liabilitysum = 0;
  var val;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Darktheme.bgcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: _size.height,
            width: _size.width,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: assetsList.length + 2,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Text(
                                "Assets",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.robotoMono(
                                  color: Darktheme.primarycolor,
                                  fontSize: 28,
                                ),
                              ),
                            );
                          } else if (index <= assetsList.length) {
                            final String name = assetsList[index - 1];
                            final _controller = TextEditingController();
                            return Padding(
                              padding: const EdgeInsets.only(top: 21),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, HeroDialogRoute(
                                    builder: (BuildContext context) {
                                      return Center(
                                        child: AlertDialog(
                                          backgroundColor: Darktheme.bgcolor,
                                          title: InkWell(
                                            onTap: () {},
                                            child: Text(
                                              name,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.robotoMono(
                                                color: Darktheme.accentcolor,
                                                fontSize: 32,
                                              ),
                                            ),
                                          ),
                                          content: Hero(
                                            tag: name,
                                            child: Material(
                                              color: Darktheme.bgcolor,
                                              child: TextField(
                                                controller: _controller,
                                                decoration: InputDecoration(
                                                    prefixText: "\$",
                                                    enabledBorder:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
                                                    hintText:
                                                        "${assetsMap[name]}",
                                                    hintStyle:
                                                        GoogleFonts.robotoMono(
                                                            color: Colors.white,
                                                            fontSize: 21),
                                                    focusColor: Colors.white),
                                                cursorColor:
                                                    Darktheme.primarycolor,
                                                keyboardType:
                                                    TextInputType.number,
                                                maxLength: 8,
                                                enableInteractiveSelection:
                                                    true,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 21),
                                              ),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  assetsum -= assetsMap[name]!;
                                                  assetsMap[name] = (_controller
                                                          .text.isNotEmpty
                                                      ? int.parse(
                                                          _controller.text)
                                                      : assetsMap[name])!;
                                                  assetsum += assetsMap[name]!;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Done',
                                                style: GoogleFonts.robotoMono(
                                                    color:
                                                        Darktheme.accentcolor,
                                                    fontSize: 21),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ));
                                },
                                child: Hero(
                                  tag: name,
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "$name\n",
                                            style: GoogleFonts.robotoMono(
                                                color: Darktheme.accentcolor,
                                                fontSize: 20)),
                                        TextSpan(
                                          text: "\$${assetsMap[name]}",
                                          style: GoogleFonts.robotoMono(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "Total\n",
                                        style: GoogleFonts.robotoMono(
                                            color: Darktheme.primarycolor,
                                            fontSize: 28)),
                                    TextSpan(
                                      text: "\$$assetsum",
                                      style: GoogleFonts.robotoMono(
                                          color: Colors.white, fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: liabilityList.length + 2,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Text(
                                "Liabilities",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.robotoMono(
                                  color: Darktheme.primarycolor,
                                  fontSize: 28,
                                ),
                              ),
                            );
                          } else if (index <= liabilityList.length) {
                            final String name = liabilityList[index - 1];
                            var _controller = TextEditingController();
                            bool focused = false;
                            return Padding(
                              padding: const EdgeInsets.only(top: 21),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, HeroDialogRoute(
                                    builder: (BuildContext context) {
                                      return Center(
                                        child: AlertDialog(
                                          backgroundColor: Darktheme.bgcolor,
                                          title: InkWell(
                                            onTap: () {},
                                            child: Text(
                                              name,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.robotoMono(
                                                color: Darktheme.accentcolor,
                                                fontSize: 32,
                                              ),
                                            ),
                                          ),
                                          content: Hero(
                                            tag: name,
                                            child: Material(
                                              color: Darktheme.bgcolor,
                                              child: TextField(
                                                controller: _controller,
                                                decoration: InputDecoration(
                                                    prefixText: "\$",
                                                    enabledBorder:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
                                                    hintText:
                                                        "${liabilityMap[name]}",
                                                    hintStyle:
                                                        GoogleFonts.robotoMono(
                                                            color: Colors.white,
                                                            fontSize: 21),
                                                    focusColor: Colors.white),
                                                cursorColor:
                                                    Darktheme.primarycolor,
                                                keyboardType:
                                                    TextInputType.number,
                                                enableInteractiveSelection:
                                                    true,
                                                maxLength: 8,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 21),
                                              ),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  liabilitysum -=
                                                      liabilityMap[name]!;
                                                  liabilityMap[
                                                      name] = (_controller
                                                          .text.isNotEmpty
                                                      ? int.parse(
                                                          _controller.text)
                                                      : liabilityMap[name])!;
                                                  liabilitysum +=
                                                      liabilityMap[name]!;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Done',
                                                style: GoogleFonts.robotoMono(
                                                    color:
                                                        Darktheme.accentcolor,
                                                    fontSize: 21),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ));
                                },
                                child: Hero(
                                  tag: name,
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "$name\n",
                                            style: GoogleFonts.robotoMono(
                                                color: Darktheme.accentcolor,
                                                fontSize: 20)),
                                        TextSpan(
                                          text: "\$${liabilityMap[name]}",
                                          style: GoogleFonts.robotoMono(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "Total\n",
                                        style: GoogleFonts.robotoMono(
                                            color: Darktheme.primarycolor,
                                            fontSize: 28)),
                                    TextSpan(
                                      text: "\$$liabilitysum",
                                      style: GoogleFonts.robotoMono(
                                          color: Colors.white, fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "NetWorth: ",
                            style: GoogleFonts.robotoMono(
                                fontSize: 30, color: Darktheme.primarycolor),
                          ),
                          TextSpan(
                            text: "\$${assetsum - liabilitysum}",
                            style: GoogleFonts.robotoMono(
                                fontSize: 30, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
