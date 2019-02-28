import 'package:flutter/material.dart';
import 'package:flutter_app_smart_home/models/Device.dart';

class DeviceDetailScreen extends StatelessWidget{

  final Device objDevice;

  DeviceDetailScreen ({Key key, @required this.objDevice}) : super (key:key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("${objDevice.pin}"),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
                child: Column(
                  children: <Widget>[
                    Image.network('${objDevice.name}'),

                    RaisedButton(
                      child: Text('ON/OFF'),
                      onPressed: () {
                        Image.network('https://via.placeholder.com/150/771796');
                      },
                    ),
                  ],
                )
            )
        )
    );
  }
}