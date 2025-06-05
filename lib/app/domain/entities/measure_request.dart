import 'measure_type.dart';
import 'parameters_measure/location_entity.dart';
import 'parameters_measure/sortiment_entity.dart';
import 'parameters_measure/bread_entity.dart';
import 'parameters_measure/vehicle_type_entity.dart';

class MeasureRequest {
  final LocationEntity location;
  final SortimentEntity timberType;
  final VehicleTypeEntity? vehicleType;
  final List<BreadEntity> treeSpecies;
  final int length;
  // final XFile image;
  // final String? baseUrl;
  // final bool useDepth;
  final String provider;
  final String carNumber;
  final MeasureType type;

  MeasureRequest({
    required this.location,
    required this.timberType,
    required this.treeSpecies,
    required this.length,
    this.vehicleType,
    // required this.image,
    // this.baseUrl,
    // this.useDepth = true,
    required this.provider,
    required this.carNumber,
    required this.type,
  });

  Map<String, dynamic> toRequest() => {
        "length": length,
        "sortiment": timberType.name,
        "location": location.name,
        "provider": provider,
        if (treeSpecies.length == 1)
          "breed": treeSpecies.first.name
        else
          "breeds": treeSpecies.map((e) => e.name).toList(),

        // "user_id": uid,
        "license_plate_text": carNumber,
        "recognition_type": type.toSend(),
        if (vehicleType != null) 'vehicle_type': vehicleType!.name,
        // "use_depth": useDepth,
      };
}
