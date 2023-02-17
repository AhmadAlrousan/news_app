import 'package:shared_preferences/shared_preferences.dart';


class CacheHelper
{
 static Future<bool> setData({required String key , required bool value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

static Future<bool> getData({required String key}) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getBool(key) ?? false;
 }

}



// static SharedPreferences? sharedPreferences;
//
// static init()async
// {
//   sharedPreferences=await SharedPreferences.getInstance();
// }
//
// // Create a method that returns a boolean to store the value
// static Future<bool> putData({required String key , required bool value})async{
// return await sharedPreferences!.setBool(key, value);
// }
//
// // Create a method that returns a boolean to return the value
//
// static bool? getData({required String key }){
// return  sharedPreferences?.getBool(key);
// }