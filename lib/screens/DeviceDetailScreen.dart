import 'package:flutter/material.dart';
import 'package:flutter_app_smart_home/models/Device.dart';
import 'package:flutter_app_smart_home/screens/DeviceListScreen.dart';

import 'package:http/http.dart' as http;

class DeviceDetailScreen extends StatefulWidget{

  final Device objDevice;


  final url = "http://127.0.0.1:3000/arduino/interruptor";
  //var url = "http://10.0.2.2:3000/arduino/interruptor";

  DeviceDetailScreen ({Key key, @required this.objDevice}) : super (key:key);

  @override
  _MyHomePageState createState() => _MyHomePageState();


}


class _MyHomePageState extends State<DeviceDetailScreen> {

  var _ulrImage = '';
  var status = 0;

  void _lightSwitch() {
    setState(() {
      status == 1 ?
      _ulrImage ='res/images/lightbulbON.png' :
      _ulrImage ='res/images/lightbulbOFF.png';
    });

  }

  void statusOff(){
    status = 0;
    http.post(widget.url, body:{'status' : '0','pin' : '${widget.objDevice.pin}','time' : '0'});
    _lightSwitch();
  }

  void statusOn(){
    status = 1;
    http.post(widget.url, body:{'status' : '1','pin' : '${widget.objDevice.pin}','time' : '0'});
    _lightSwitch();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.objDevice.name}"),
        ),
        body:
        Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
                child: Column(
                  children: <Widget>[
                    //Image.network('${objDevice.name}'),
                    new Card(
                      child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Image.asset(
/*
                            widget.objDevice.status == 1 ?
                            _ulrImage ='res/images/lightbulbON.png' :
                            _ulrImage ='res/images/lightbulbOFF.png',
                            */
                            _ulrImage == '' ?
                            widget.objDevice.status == 1 ?
                            _ulrImage ='res/images/lightbulbON.png' :
                            _ulrImage ='res/images/lightbulbOFF.png':
                            '$_ulrImage',
//
                            fit: BoxFit.fill,
                          ),
                          const ListTile(
                            title: const Text('Esto es un titulo 2'),
                            subtitle: const Text('Esto es un sibtitulo de la tarjeta.'),
                          ),
                          new ButtonTheme.bar(
                            // make buttons use the appropriate styles for cards
                            child: new ButtonBar(
                              alignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new FlatButton(
                                  child: const Text('Cancelar'),
                                  onPressed: () {},
                                ),
                                new FlatButton(
                                  child: const Text('Aceptar'),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    RaisedButton(
                      child: Text('On'),
                      onPressed: statusOn,

                    ),

                    RaisedButton(
                      child: Text('Off'),
                      onPressed: statusOff,

                    ),

                  ],
                )
            )
        )
    );
  }

}