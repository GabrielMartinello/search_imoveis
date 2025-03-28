class Company {
  String _name;
  String _addressType;
  String _addressName;
  String _city;
  String _uf;

  Company(this._name, this._addressType, this._addressName, this._city,
      this._uf);

  String get uf => _uf;

  set uf(String value) {
    _uf = value;
  }

  String get city => _city;

  set city(String value) {
    _city = value;
  }

  String get addressName => _addressName;

  set addressName(String value) {
    _addressName = value;
  }

  String get addressType => _addressType;

  set addressType(String value) {
    _addressType = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }


}