import 'package:expenseapp/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
                "https://icon-library.com/images/expenses-icon/expenses-icon-20.jpg"),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Text("Spenderly",
                    style:
                        GoogleFonts.aBeeZee(fontSize: 50, color: Colors.black)),
              ),
              Material(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    )),
              )
            ],
          )
        ],
      )),
    );
  }
}
