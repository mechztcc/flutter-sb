class AddressModel {
  String? zipCode;
  String? street;
  String? number;
  String? city;
  String? state;

  AddressModel({
    this.zipCode,
    this.street,
    this.number,
    this.city,
    this.state,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    zipCode = json['zipcode'];
    street = json['street'];
    number = json['number'];
    city = json['city'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['zip_code'] = zipCode;
    data['street'] = street;
    data['number'] = number;
    data['city'] = city;
    data['state'] = state;
    return data;
  }
}
