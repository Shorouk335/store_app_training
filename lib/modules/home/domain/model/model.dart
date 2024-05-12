class HomeModel {
  int? id;

  HomeModel();

  HomeModel.fromjson(Map<String, dynamic> json) {
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = this.id;
    return data;
  }
}
