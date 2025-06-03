class BrandModelEntity {
  int? results;

  List<DataEntity>? data;

  BrandModelEntity({this.results, this.data});

  BrandModelEntity.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    if (json['data'] != null) {
      data = <DataEntity>[];
      json['data'].forEach((v) {
        data!.add(new DataEntity.fromJson(v));
      });
    }
  }
}

class DataEntity {
  String? sId;
  String? name;
  String? slug;
  String? image;

  DataEntity({
    this.sId,
    this.name,
    this.slug,
    this.image,
  });

  DataEntity.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}
