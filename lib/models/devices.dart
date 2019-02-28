class Device {
  final String id;
  final String pin;
  final String name;
  final String status;
  final String time;

  Device({this.id, this.pin, this.name, this.status, this.time});

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'] as String,
      pin: json['pin'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      time: json['time'] as String,
    );
  }
}