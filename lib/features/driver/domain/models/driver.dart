class Driver {
  final String id;
  final String name;
  final String phone;
  final String vehicleModel;
  final String vehicleNumber;
  final String licenseImageUrl;
  final bool isApproved;
  final DateTime createdAt;

  const Driver({
    required this.id,
    required this.name,
    required this.phone,
    required this.vehicleModel,
    required this.vehicleNumber,
    required this.licenseImageUrl,
    this.isApproved = false,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'vehicleModel': vehicleModel,
        'vehicleNumber': vehicleNumber,
        'licenseImageUrl': licenseImageUrl,
        'isApproved': isApproved,
        'createdAt': createdAt.toIso8601String(),
      };

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        id: json['id'] as String,
        name: json['name'] as String,
        phone: json['phone'] as String,
        vehicleModel: json['vehicleModel'] as String,
        vehicleNumber: json['vehicleNumber'] as String,
        licenseImageUrl: json['licenseImageUrl'] as String,
        isApproved: json['isApproved'] as bool? ?? false,
        createdAt: DateTime.parse(json['createdAt'] as String),
      );
}
