
import 'package:edtech/common/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService{
  late final SharedPreferences _pref;

  Future<StorageService>int() async{
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async{
    return await _pref.setString(key, value);
  }
  Future<bool> setBool(String key, bool value) async{
    return await _pref.setBool(key, value);
  }
  bool getDeviceFirstOpen(){
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY)??false;
  }
}