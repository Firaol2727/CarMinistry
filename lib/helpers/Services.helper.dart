import 'package:road_ministry/constants/DriverServices.dart';
import 'package:road_ministry/constants/Services.dart';
import 'package:road_ministry/constants/VehicleServices.dart';

List<Services> getDriverServices(String locale) {
  if (locale == "am") {
    return DriverAmharicService;
  } else {
    return DriverAfaanOromooService;
  }
}

List<Services> getVehicleServices(String locale) {
  if (locale == "am") {
    return VehicleAmharicService;
  } else {
    return VehicleAfaanOromooService;
  }
}

Services findServiceByTypeAndIndex(int index, String type, String locale) {
  if (locale == "am") {
    if (type == "driver") {
      return DriverAmharicService[index];
    } else {
      return VehicleAmharicService[index];
    }
  } else {
    if (type == "driver") {
      return DriverAfaanOromooService[index];
    } else {
      return VehicleAfaanOromooService[index];
    }
  }
}
