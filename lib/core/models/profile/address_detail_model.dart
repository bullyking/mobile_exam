class AddressDetailModel {
  final String? pincode;
  final String? address;
  final String? city;
  final String? state;
  final String? country;

  AddressDetailModel({
    this.pincode,
    this.address,
    this.city,
    this.state,
    this.country,
  });

  AddressDetailModel.mock({
    this.pincode = '1234',
    this.address = 'Jalan Raya',
    this.city = 'Jakarta',
    this.state = 'DKI Jakarta',
    this.country = 'Indonesia',
  });

  factory AddressDetailModel.init() {
    return AddressDetailModel(
      pincode: null,
      address: null,
      city: null,
      state: null,
      country: null,
    );
  }

  factory AddressDetailModel.fromMap(Map<String, dynamic> map) {
    return AddressDetailModel(
      pincode: map['pincode'],
      address: map['address'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pincode': pincode,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
    };
  }

  AddressDetailModel copyWith({
    String? pincode,
    String? address,
    String? city,
    String? state,
    String? country,
  }) {
    return AddressDetailModel(
      pincode: pincode ?? this.pincode,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
    );
  }
}
