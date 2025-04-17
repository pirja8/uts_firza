import 'package:flutter/material.dart';
import 'zodiac_model.dart';

class ZodiacProvider with ChangeNotifier {
  ZodiacInfo? _zodiac;
  ZodiacInfo? _bulan;

  ZodiacInfo? get zodiac => _zodiac;
  ZodiacInfo? get bulan => _bulan;

  void setZodiac(DateTime date, Map<String, String> zodiacData) {
    String name = getZodiacName(date);
    _zodiac = ZodiacInfo(name, zodiacData[name] ?? "Ramalan belum tersedia.");
    notifyListeners();
  }

  void setBulan(DateTime date, Map<String, String> bulanData) {
    String bulanName = getMonthName(date.month);
    String fullText = bulanData[bulanName] ?? "Ramalan belum tersedia.";

    if (fullText.contains("—")) {
      final parts = fullText.split("—");
      final label = parts[0].trim();
      final detail = parts.sublist(1).join("—").trim();
      _bulan = ZodiacInfo("$bulanName, $label", detail);
    } else {
      _bulan = ZodiacInfo(bulanName, fullText);
    }

    notifyListeners();
  }


  String getZodiacName(DateTime date) {
    int day = date.day;
    int month = date.month;

    if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) return "Aquarius";
    if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) return "Pisces";
    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) return "Aries";
    if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) return "Taurus";
    if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) return "Gemini";
    if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) return "Cancer";
    if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) return "Leo";
    if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) return "Virgo";
    if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) return "Libra";
    if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) return "Scorpio";
    if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) return "Sagittarius";
    return "Capricorn";
  }

  String getMonthName(int month) {
    const months = [
      "Januari", "Februari", "Maret", "April", "Mei", "Juni",
      "Juli", "Agustus", "September", "Oktober", "November", "Desember"
    ];
    return months[month - 1];
  }
}
