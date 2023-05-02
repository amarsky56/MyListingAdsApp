class StatesModel {
/*
{
  "state": "Alabama, US",
  "code": "AL"
}
*/

  String? state;
  String? code;

  StatesModel({
    this.state,
    this.code,
  });

  StatesModel.fromJson(Map<String, dynamic> json) {
    state = json['state']?.toString();
    code = json['code']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['state'] = state;
    data['code'] = code;
    return data;
  }
}
