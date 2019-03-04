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

/*
  Map toMap(){

    var map = Map<int, dynamic>();
    //map[name] = name;
    map[status] = status;
    map[pin] = pin;
    map[time] = time;

    return map;
  }
  */


  /*
  Map<int, dynamic> toJson() =>
      {
        //'name': name,
        status: status,
        pin: pin,
        time: time
      };
      */

}

