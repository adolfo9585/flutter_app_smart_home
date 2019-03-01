class Device {
  final int id;
  final int pin;
  final String name;
  final int status;
  final int time;

  Device({this.id, this.pin, this.name, this.status, this.time});

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'] as int,
      pin: json['pin'] as int,
      name: json['name'] as String,
      status: json['status'] as int,
      time: json['time'] as int,
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'status': status,
        'time': time
      };
}