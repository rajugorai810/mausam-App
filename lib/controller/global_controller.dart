import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/api/fetch_weather.dart';
import 'package:weatherapp_starter_project/models/weather_data.dart';

class GlobalController extends GetxController {
  // create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex =0.obs;

//instance to be called

  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  final weatherdata = WeatherData().obs;
  WeatherData getData(){
    return weatherdata.value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if(_isLoading.isTrue){
    getLocation();
    }else{
      getIndex();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    // return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error("Location service is not enabled");
    }

    // current status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission is denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      // request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    // getting the current location of user
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {

      // update our latitiude and longitiude
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;

      // calling our weather API
      return FetchWeatherAPI().processData(value.latitude, value.longitude).then((value) {
        weatherdata.value=value;
      _isLoading.value = false;

      });
    });
  }
  RxInt getIndex(){
    return _currentIndex;
  }
}
