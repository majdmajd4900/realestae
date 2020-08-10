/*
import 'package:firebase_login_app/provider/providers_.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderOfFilter extends StatefulWidget {
  @override
  _SliderOfFilterState createState() => _SliderOfFilterState();
}

class _SliderOfFilterState extends State<SliderOfFilter> {
  @override
  Widget build(BuildContext context) {
      double _value = Provider.of<EstateAtrributeProvider>(context).minPriceBar;

    return 
    Row(
          children:<Widget>[ SliderTheme(
  data: SliderTheme.of(context).copyWith(
      activeTrackColor: Colors.red[700],
      inactiveTrackColor: Colors.red[100],
      trackShape: RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
      thumbColor: Colors.redAccent,
      overlayColor: Colors.red.withAlpha(32),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
      tickMarkShape: RoundSliderTickMarkShape(),
      activeTickMarkColor: Colors.red[700],
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      valueIndicatorColor: Colors.redAccent,
      valueIndicatorTextStyle: TextStyle(
        color: Colors.white,
      ),
  ),
  child: Slider(
      value: _value,
      min: Provider.of<EstateAtrributeProvider>(context).minPriceBar,
      max: Provider.of<EstateAtrributeProvider>(context).maxPriceBar,
      divisions: Provider.of<EstateAtrributeProvider>(context).divisionsPriceBar,
      label: '$_value',
      onChanged: (value) {
        setState(
          () {
            _value = value;
            print(value);
          },
        );
      },
  ),
),
Text(_value.toString())
          ]);
  }
}*/