import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'CAD',
  'EUR',
  'INR',
  'JPY',
  'SGD',
  'USD',
];

const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];
// add ripple

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const cryptoURL = 'https://rest.coinapi.io/assets';
const apiKey = '84C3F943-197B-40B4-87D0-799C786971CF';


class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestURL1 =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response1 = await http.get(Uri.parse(requestURL1));
       //crypto name and hour percent
      // String requestURL2 =
      //     '$cryptoURL/$crypto?apikey=$apiKey';
      // http.Response response2 = await http.get(Uri.parse(requestURL2));

      if (response1.statusCode == 200 ) {
        var decodedData = jsonDecode(response1.body);
        double price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response1.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
