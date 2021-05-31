import 'package:country_list/country_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      supportedLocales: [
        Locale("en"),
        Locale("ja"),
        Locale("ru"),
      ],
      locale: Locale('en'),
      localizationsDelegates: [
        CountryListLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('CountryPicker Example'),
        ),
        body: ListView.builder(
          itemCount: CountryList().getCountries(context).length,
          itemBuilder: (context, index) {
            return Text(CountryList().getCountries(context)[index].name);
          },
        ),
      ),
    );
  }
}
