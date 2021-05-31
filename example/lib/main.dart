import 'package:country_list/country_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale("en"),
        Locale("ja"),
        Locale("ru"),
      ],
      locale: _locale,
      localizationsDelegates: const [
        CountryListLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CountryPicker Example'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Builder(
                builder: (context) {
                  final countries = CountryList().getCountries(context);
                  return ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (context, index) => Text(countries[index].name),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _locale = const Locale('ru')),
                  child: const Text('ru'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => _locale = const Locale('en')),
                  child: const Text('en'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => _locale = const Locale('ja')),
                  child: const Text('ja'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
