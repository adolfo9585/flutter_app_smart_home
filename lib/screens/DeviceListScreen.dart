import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_smart_home/models/Device.dart';
import 'package:flutter_app_smart_home/screens/DeviceDetailScreen.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Device>> fetchDevice(http.Client client) async {
  final response =
  await client.get('http://192.168.1.134:3000/arduino/getAllRooms');

  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseDevice, response.body);
}

// A function that converts a response body into a List<Photo>
List<Device> parseDevice(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Device>((json) => Device.fromJson(json)).toList();
}


class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: FutureBuilder<List<Device>>(
        future: fetchDevice(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? DevicesList(device: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),

    );
  }
}

class DevicesList extends StatelessWidget {

  final List<Device> device;
  DevicesList({Key key, this.device}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: device.length,
      itemBuilder: (context, index) {
        //return Image.network(photos[index].thumbnailUrl);
        return ListTile(
          //title: int(device[index].pin),
          title: Text(device[index].name),
          //leading: Image.network(photos[index].thumbnailUrl),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => DeviceDetailScreen(objDevice: device[index]),
              ),
            );
          },
        );
      },
    );
  }
}