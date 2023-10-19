import 'storage/preferences.dart';

int convertUnit(int number) {
  late double converted;

  if (preferences["weight_unit"] == "lbs") {
    converted = number * 2.205;
  }
  else if (preferences["weight_unit"] == "kg") {
    converted = number.toDouble();
  }

  return converted.round();
}
