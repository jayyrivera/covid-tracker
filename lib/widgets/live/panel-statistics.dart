import 'package:covidapp/constants/constants.dart';
import 'package:covidapp/model/countries.dart';
import 'package:covidapp/services/countries-data.dart';
import 'package:covidapp/services/country-name.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PanelStatsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _countryData = Provider.of<CountryData>(context, listen: false);
    Countries _countries = _countryData.getCountries();
    CountryName _countryName = Provider.of<CountryName>(context);
    var index = _countries.areas
        .indexWhere((prod) => prod.displayName == _countryName.countryName);
    var active = _countries.areas[index].totalConfirmed -
        _countries.areas[index].totalDeaths -
        _countries.areas[index].totalRecovered;
    final formatter = new NumberFormat("#,###");
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Text("${_countryName.countryName}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Cases",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: new Color(Constants.colorCases),
                                    fontWeight: FontWeight.bold)),
                            Text(
                                "${formatter.format(_countries.areas[index].totalConfirmed)}",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ))),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Deaths",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: new Color(Constants.colorDeaths),
                                    fontWeight: FontWeight.bold)),
                            Text(
                                "${formatter.format(_countries.areas[index].totalDeaths)}",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ))),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Recovered",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: new Color(Constants.colorRecoveries),
                                    fontWeight: FontWeight.bold)),
                            Text(
                                "${formatter.format(_countries.areas[index].totalRecovered)}",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ))),
              ),
            ),
          ],
        ),
      ],
    );
  }
}