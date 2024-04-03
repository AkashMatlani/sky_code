class CuteCatModel {
  String? sId;
  String? mimetype;
  int? size;
  List<String>? tags;

  CuteCatModel({this.sId, this.mimetype, this.size, this.tags});

  CuteCatModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mimetype = json['mimetype'];
    size = json['size'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['mimetype'] = mimetype;
    data['size'] = size;
    data['tags'] = tags;
    return data;
  }
}