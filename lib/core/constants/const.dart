import 'package:flutter/material.dart';

//size
const double kGutter = 16;
const double kRadius = 8;
//color
const Color kScaffordColor = Color(0xFFebf0f3);
const Color kBackgroundColor = Color(0xFFeeeeee);
const Color kBackgroundColor2 = Color.fromARGB(255, 174, 222, 236);

const Color kWhite = Colors.white;
const Color kDarkBlue = Color.fromARGB(255, 0, 107, 137);
const Color kDarkMain = Color.fromARGB(255, 1, 7, 9);
const Color kInfoSuccess = Color(0xFF45BD75);
const Color kRent = Color(0xFFFFA5A5);
const Color kRed = Colors.red;
const Color kTextColor = Color.fromARGB(255, 2, 6, 7);
const Color kInputDisableColor = Color(0xFFE0E0E0);
const Color kColorOTP = Color.fromARGB(255, 220, 218, 218);
const Gradient kGradientColor = LinearGradient(
  colors: [
    Color(0xFF6dbcd3),
    Color(0xFF007495),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
//notifications
const String kFireAlarm = 'fire_alarm';
const String kEmotelAlarm = 'emotel_alarm';
const String kTheifAlarm = 'thief_alarm';

const String fireAlarmKeyName = 'custom_notification_channel_01';
const String fireAlarmDes = 'Fire Alarm Notification';
const String thiefAlarmKeyName = 'custom_notification_channel_02';
const String thiefAlarmDes = 'Thief Alarm Notification';
const String emotelAlarmKeyName = 'custom_notification_channel_03';
const String emotelAlarmDes = 'Emotel Notification';

const double maxPriceRent = 20000000;

const ownerCode = "333333333333333333333333";
const saleCode = "555555555555555555555555";
const renterCode = "666666666666666666666666";
const fixMaintenanceCode = "777777777777777777777777";
const cleanerCode = "888888888888888888888888";
const tranferCode = "999999999999999999999999";
const liquidationCode = "101010101010101010101010";
const refrigerationMaintenanceCode = "121212121212121212121212";
const electricMaintenanceCode = "131313131313131313131313";
const waterMaintenanceCode = "141414141414141414141414";
const buildingMaintenanceCode = "151515151515151515151515";

const bundleId = 'com.scobuilding.app';
const packageName = 'com.scobuilding.app';

Color backGroundChatUser = const Color(0xFF343541);
Color cardColorChatGPT = const Color(0xFF444653);
Color scaffoldBackbacgroundColorChatGPT = const Color(0xFF202123);
Color scaffoldBackbacgroundColorIntroChatGPT = const Color(0xFF384152);
Color backgroundCardFieldChatGPT = const Color(0xFF353541);
Color colorFieldChatGPT = const Color(0xFF3f414e);

const bool enableChatGPT = true;
const bool enableShowInfoOwner = false;
