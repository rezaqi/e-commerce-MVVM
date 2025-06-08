class ModelGetAccount {
  int? results;
  String? status;
  List<Data>? data;

  ModelGetAccount({this.results, this.status, this.data});

  ModelGetAccount.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? sId;
  String? name;
  String? details;
  String? phone;
  String? city;

  Data({this.sId, this.name, this.details, this.phone, this.city});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    details = json['details'];
    phone = json['phone'];
    city = json['city'];
  }
}
