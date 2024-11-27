import 'package:currency_converter/features/presentation/views/splash/widget/drop_down.dart';
import 'package:currency_converter/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../service/currency_api_service.dart';
import '../../common/appbar.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  CurrencyApiService client = CurrencyApiService();

  List<String>? currencies;
  String? from;
  List<String> toCurrencies = [];
  Map<String, double> results = {};

  @override
  void initState() {
    super.initState();
    fetchCurrencies();
    loadSavedCurrencies();
  }

  Future<void> fetchCurrencies() async {
    try {
      List<String> list = await client.getCurrencies();
      setState(() {
        currencies = list;
        from = list.first; // Default value for `from`
      });
    } catch (e) {
      print("Error fetching currencies: $e");
    }
  }

  Future<void> convertCurrencies(String value) async {
    try {
      Map<String, double> tempResults = {};
      for (String toCurrency in toCurrencies) {
        double rate = await client.getRate(from!, toCurrency);
        tempResults[toCurrency] = rate * double.parse(value);
      }
      setState(() {
        results = tempResults;
      });
    } catch (e) {
      print("Error during conversion: $e");
    }
  }

  void addCurrency() {
    String? selectedCurrency;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: Center(
              child: const Text(
            "Add Currency",
            style: TextStyle(color: AppColors.colorDark),
          )),
          content: currencies == null
              ? const CircularProgressIndicator()
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.colorDark)),
                  child: DropdownButton<String>(
                    dropdownColor: AppColors.fontColorGray,
                    hint: Text("   Select New Currency"),
                    value: selectedCurrency,
                    items: currencies!
                        .where((currency) => !toCurrencies.contains(currency))
                        .map((currency) => DropdownMenuItem(
                              value: currency,
                              child: Text(
                                currency,
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCurrency = value;
                      });
                    },
                  ),
                ),
          actions: [
            TextButton(
              onPressed: () async {
                if (selectedCurrency != null) {
                  setState(() {
                    toCurrencies.add(selectedCurrency!);
                  });
                  await saveCurrencies();
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  Future<void> saveCurrencies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('toCurrencies', toCurrencies);
  }

  Future<void> loadSavedCurrencies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedCurrencies = prefs.getStringList('toCurrencies');
    if (savedCurrencies != null) {
      setState(() {
        toCurrencies = savedCurrencies;
      });
    }
  }

  void deleteCurrency(int index) async {
    setState(() {
      toCurrencies.removeAt(index);
    });
    await saveCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDark,
      appBar: CurrencyAppBar(
        title: "Advanced Exchanger",
      ),
      body: currencies == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "INSERT AMOUNT:",
                    style: TextStyle(color: AppColors.fontColorWhite),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border:
                          Border.all(width: 2, color: AppColors.fontColorGray),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextField(
                            onSubmitted: (value) => convertCurrencies(value),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                              filled: true,
                              fillColor: AppColors.colorDark,
                            ),
                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: customDropDown(
                            items: currencies!,
                            value: from!,
                            onChange: (String? newFrom) {
                              setState(() {
                                from = newFrom;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("CONVERT TO:",
                      style: TextStyle(color: AppColors.fontColorWhite)),
                  const SizedBox(height: 20),
                  Column(
                    children: List.generate(toCurrencies.length, (index) {
                      String currency = toCurrencies[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          padding: EdgeInsets.only(left: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 2, color: AppColors.fontColorGray),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  results[currency]?.toStringAsFixed(3) ?? "-",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: customDropDown(
                                  items: currencies!,
                                  value: currency,
                                  onChange: (String? newTo) {
                                    setState(() {
                                      toCurrencies[index] = newTo!;
                                    });
                                    saveCurrencies();
                                  },
                                ),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => deleteCurrency(index),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                      onPressed: addCurrency,
                      child: const Text(
                        "+ Add Converter",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
