import 'package:flutter/material.dart';
import 'package:flutter_app_smart_home/models/Device.dart';
import 'package:flutter_app_smart_home/screens/DeviceListScreen.dart';

import 'package:http/http.dart' as http;

class DeviceDetailScreen extends StatelessWidget{

  final Device objDevice;

  var url = "http://127.0.0.1:3000/arduino/interruptor";
  //var url = "http://10.0.2.2:3000/arduino/interruptor";


  DeviceDetailScreen ({Key key, @required this.objDevice}) : super (key:key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("${objDevice.name}"),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => MyHomePage(),
                    ),

                  );
                },
              );
            },
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
                child: Column(
                  children: <Widget>[
                    //Image.network('${objDevice.name}'),
                    RaisedButton(
                      child: Text('On'),
                      onPressed: () {
                        http.post(url, body:{'status' : '1','pin' : '${objDevice.pin}','time' : '0'});
                        },
                    ),
                    RaisedButton(
                      child: Text('Off'),
                      onPressed: () {
                        http.post(url, body:{'status' : '0','pin' : '${objDevice.pin}','time' : '0'});
                      },
                    ),

                  ],
                )
            )
        )
    );
  }
}