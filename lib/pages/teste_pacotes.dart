import 'dart:async';
import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class TestesPacotes extends StatefulWidget {
  const TestesPacotes({super.key});

  @override
  State<TestesPacotes> createState() => _TestesPacotesState();
}

class _TestesPacotesState extends State<TestesPacotes> {
  final TextEditingController controllerPhone = TextEditingController();
  var battery = Battery();
  var statusBateria = '';
  final String _url = 'https://www.xpi.com.br/';

  @override
  void initState() {
    super.initState();
    carregarBateria();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (kDebugMode) {
        print(result);
      }
    });
  }

  carregarBateria() async {
    statusBateria = (await battery.batteryLevel).toString();
    setState(() {});
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF820AD1),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'CEP',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 16, bottom: 16)),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),
            const Text(
              'Telefone',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 16, bottom: 16)),
            TextFormField(
              controller: controllerPhone,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 16, bottom: 16)),
            Text(
              'Indicador da Bateria: $statusBateria',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 16, bottom: 16)),
            InkWell(
              child: const Text(
                'Abrir XP',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => _launchUrl(),
            ),
            const Padding(padding: EdgeInsets.only(top: 16, bottom: 16)),
            InkWell(
              child: const Text(
                'Compartilhar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () =>
                  Share.share('De uma olhada nesse site! https://dio.me'),
            ),
            const Padding(padding: EdgeInsets.only(top: 16, bottom: 16)),
            InkWell(
              child: const Text(
                'Abrir Arquivo',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () async {
                var directory = await getApplicationDocumentsDirectory();
                var directoryTwo = await getDownloadsDirectory();
                if (kDebugMode) {
                  print(directory);
                }
                if (kDebugMode) {
                  print(directoryTwo);
                }
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 16, bottom: 16)),
            InkWell(
              child: const Text(
                'Informações do Sistema',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () async {
                PackageInfo packageInfo = await PackageInfo.fromPlatform();
                String appName = packageInfo.appName;
                String packageName = packageInfo.packageName;
                String version = packageInfo.version;
                String buildNumber = packageInfo.buildNumber;
                if (kDebugMode) {
                  print(appName);
                }
                if (kDebugMode) {
                  print(packageName);
                }
                if (kDebugMode) {
                  print(version);
                }
                if (kDebugMode) {
                  print(buildNumber);
                }
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 16, bottom: 16)),
            InkWell(
              child: const Text(
                'Informações do Dispositivo',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () async {
                DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                if (Platform.isAndroid) {
                  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                  if (kDebugMode) {
                    print('Running on ${androidInfo.model}');
                  }
                } else if (Platform.isIOS) {
                  IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
                  if (kDebugMode) {
                    print('Running on ${iosInfo.utsname.machine}');
                  }
                } else {
                  WebBrowserInfo webBrowserInfo =
                      await deviceInfo.webBrowserInfo;
                  if (kDebugMode) {
                    print('Running on ${webBrowserInfo.userAgent}');
                  }
                }
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 16, bottom: 16)),
            InkWell(
              child: const Text(
                'Verificar Conexão',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () async {
                final connectivityResult =
                    await (Connectivity().checkConnectivity());
                if (connectivityResult == ConnectivityResult.mobile) {
                  stdout.write(connectivityResult);
                } else if (connectivityResult == ConnectivityResult.wifi) {
                  stdout.write(connectivityResult);
                } else if (connectivityResult == ConnectivityResult.ethernet) {
                  stdout.write(connectivityResult);
                } else if (connectivityResult == ConnectivityResult.vpn) {
                  stdout.write(connectivityResult);
                } else if (connectivityResult == ConnectivityResult.bluetooth) {
                  stdout.write(connectivityResult);
                } else if (connectivityResult == ConnectivityResult.other) {
                  stdout.write(connectivityResult);
                } else if (connectivityResult == ConnectivityResult.none) {
                  stdout.write(connectivityResult);
                }
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 16, bottom: 16)),
            InkWell(
              child: const Text(
                'Obter Localização',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () async {
                Position position = await _determinePosition();
                stdout.write(position);
              },
            ),
          ],
        ),
      ),
    );
  }
}
