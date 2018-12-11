class Event {
  String _name;
  String _description;
  Event(this._name, this._description);

  Event.map(dynamic obj) {
    this._name = obj["name"];
    this._description = obj["description"];
  }

  String get name => _name;
  String get description => _description;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["description"] = _description;

    return map;
  }
}