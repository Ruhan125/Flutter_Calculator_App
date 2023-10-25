// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int num1 = 0;
  int num2 = 0;
  num result = 0;

  final numOneController = TextEditingController();
  final numTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    numOneController.text = num1.toString();
    numTwoController.text = num1.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Casio",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Calculator_display(controller: numOneController),
              SizedBox(
                height: 10,
              ),
              Calculator_display(controller: numTwoController),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    result.toString(),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        result = num.tryParse(numOneController.text)! +
                            num.tryParse(numTwoController.text)!;
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        result = num.tryParse(numOneController.text)! -
                            num.tryParse(numTwoController.text)!;
                      });
                    },
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        result = num.tryParse(numOneController.text)! *
                            num.tryParse(numTwoController.text)!;
                      });
                    },
                    child: Icon(CupertinoIcons.multiply),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        result = num.tryParse(numOneController.text)! /
                            num.tryParse(numTwoController.text)!;
                      });
                    },
                    child: Icon(CupertinoIcons.divide),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(
                    onPressed: () {
                      setState(() {
                        num1 = 0;
                        num2 = 0;
                        result = 0;
                        numOneController.clear();
                        numTwoController.clear();
                      });
                    },
                    label: Text("Clear"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Calculator_display extends StatelessWidget {
  const Calculator_display({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        hintText: "00",
      ),
    );
  }
}
