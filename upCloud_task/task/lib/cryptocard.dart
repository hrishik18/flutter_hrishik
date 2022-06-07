import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/settings.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    Key? key,
    required this.value,
    required this.selectedCurrency,
    required this.cryptoCurrency,
  }) : super(key: key);
  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    String ic = cryptoCurrency.substring(0,1);
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 1.0, 18.0, 0),
      child: Card(
          color: Colors.white,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
              leading: 
              Container(
                width: 50,
                height: 50,
          //margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            shape: BoxShape.circle,
          ),
           child: Center(
             child: Text(
                    ic,
                    style: const TextStyle(fontSize: 15, color: Color.fromARGB(255, 9, 9, 9)),
                  ),
           ),
        ),
              title: Text(
                cryptoCurrency,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              subtitle: Text(
                '$value $selectedCurrency',
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 10.0, color: Colors.black),
              ),
              onTap: () => print("ListTile"))),
    );
  }
}
