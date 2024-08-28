class GovernRateModel {
  List<DataGovernorates>? data;
  String? message;
  List<Null>? error;
  int? status;

  GovernRateModel({this.data, this.message, this.error, this.status});

  GovernRateModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataGovernorates>[];
      json['data'].forEach((v) {
        data!.add(DataGovernorates.fromJson(v));
      });
    }
    message = json['message'];
    if (json['error'] != null) {
      error = <Null>[];
      json['error'].forEach((v) {
        //error!.add(Null.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    if (error != null) {
     // data['error'] = this.error!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class DataGovernorates {
  int? id;
  String? governorateNameEn;

  DataGovernorates({this.id, this.governorateNameEn});

  DataGovernorates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    governorateNameEn = json['governorate_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['governorate_name_en'] = governorateNameEn;
    return data;
  }
}