import 'package:flutter/material.dart';
import 'package:task/settings.dart';
import 'coin_data.dart';
import 'cryptocard.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, String> coinValues = {};
  bool isWaiting = false;
  String selectedCurrency = 'INR';

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    DropdownButton<String> androidDropdown() {
      List<DropdownMenuItem<String>> dropdownItems = [];
      for (String currency in currenciesList) {
        var newItem = DropdownMenuItem(
          child: Text(currency),
          value: currency,
        );
        dropdownItems.add(newItem);
      }

      return DropdownButton<String>(
        value: selectedCurrency,
        items: dropdownItems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value ?? 'USD';
            getData();
          });
        },
      );
    }

    CupertinoPicker iOSPicker() {
      List<Text> pickerItems = [];
      for (String currency in currenciesList) {
        pickerItems.add(Text(currency));
      }

      return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          setState(() {
            selectedCurrency = currenciesList[selectedIndex];
            getData();
          });
        },
        children: pickerItems,
      );
    }

    Column makeCards() {
      List<CryptoCard> cryptoCards = [];
      for (String crypto in cryptoList) {
        cryptoCards.add(
          CryptoCard(
            cryptoCurrency: crypto,
            selectedCurrency: selectedCurrency,
            value: isWaiting ? '?' : coinValues[crypto] ?? '?',
          ),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: cryptoCards,
      );
    }

    bool osvalue = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Setting()),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          makeCards(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: osvalue ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(items: const [
      //   //list of coin names from api
      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //       backgroundColor: Colors.green),
      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'search',
      //       backgroundColor: Colors.red),
      // ], type: BottomNavigationBarType.shifting, iconSize: 40, elevation: 5)
    );
  }
}
