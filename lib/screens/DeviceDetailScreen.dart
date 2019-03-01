import 'package:flutter/material.dart';
import 'package:flutter_app_smart_home/models/Device.dart';

import 'package:http/http.dart' as http;

class DeviceDetailScreen extends StatelessWidget{

  final Device objDevice;

  var url = "http://192.168.1.134:3000/arduino/interruptor";

  DeviceDetailScreen ({Key key, @required this.objDevice}) : super (key:key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("${objDevice.name}"),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
                child: Column(
                  children: <Widget>[
                    Image.network('${objDevice.name}'),

                    RaisedButton(
                      child: Text('ON'),
                      onPressed: () {
                        http.post(url, body:{'status' : 1,'pin' : '12','time' : '0'});
                      },

                    ),
                    RaisedButton(
                      child: Text('OFF'),
                      onPressed: () {
                        http.post(url, body:{'status' : 0,'pin' : '12','time' : '0'});
                      },

                    ),
                  ],
                )
            )
        )
    );
  }
}