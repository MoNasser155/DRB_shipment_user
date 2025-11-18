class BaseGovernmentsModel {
  List<GovernmentsData> data;

  BaseGovernmentsModel({
    required this.data,
  });

  factory BaseGovernmentsModel.fromJson(Map<String, dynamic> json) {
    return BaseGovernmentsModel(
        data: List<GovernmentsData>.from(
            json['data'].map((x) => GovernmentsData.fromJson(x))));
  }

  factory BaseGovernmentsModel.initial() => BaseGovernmentsModel(data: []);
}

class GovernmentsData {
  String governmentAr, governmentEn;
  List<Cities> cities;

  GovernmentsData(
      {required this.governmentAr,
      required this.governmentEn,
      required this.cities});

  factory GovernmentsData.fromJson(Map<String, dynamic> json) {
    return GovernmentsData(
      governmentAr: json['governorateNameAr'],
      governmentEn: json['governorateNameEn'],
      cities:
          List<Cities>.from(json['citiesName'].map((x) => Cities.fromJson(x))),
    );
  }

  factory GovernmentsData.initial() =>
      GovernmentsData(governmentAr: '', governmentEn: '', cities: []);
}

class Cities {
  String cityAr, cityEn;

  Cities({required this.cityAr, required this.cityEn});

  factory Cities.fromJson(Map<String, dynamic> json) {
    return Cities(
      cityAr: json['arabic'],
      cityEn: json['english'],
    );
  }

  factory Cities.initial() => Cities(cityAr: '', cityEn: '');
}
