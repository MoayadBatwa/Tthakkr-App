import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

part 'qibla_event.dart';
part 'qibla_state.dart';

class QiblaBloc extends Bloc<QiblaEvent, QiblaState> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  QiblaBloc() : super(QiblaInitial()) {
    on<QiblaStartEvent>((event, emit) async {
      await Future.delayed(Duration(seconds: 5));

      if (!(await _deviceSupport ?? false)) {
        log('Qibla bloc error: device not supported');
        emit(QiblaError(error: 'The device is not supported'));
        return;
      }

      final locationStatus = await checkLocationStatus();

      if (!(locationStatus?.enabled ?? false)) {
        emit(QiblaError(error: 'Location is disabled'));
        return;
      }

      if (locationStatus?.status == LocationPermission.denied) {
        emit(QiblaError(error: 'Location permission is denied'));
        return;
      }

      FlutterQiblah.qiblahStream
          .listen((direction) {
            add(UpdateQiblaDirection(direction: direction));
          })
          .onError((error, stackTrace) {
            log('Qibla stream error: $error');
            emit(QiblaError(error: error.toString()));
          });
    });

    on<UpdateQiblaDirection>((event, emit) {
      emit(QiblaSuccess(direction: event.direction));
    });

    on<RequestPermissionEvent>((event, emit) async {
      emit(QiblaInitial());

      await checkLocationStatus().then((locationStatus) {
        if (!locationStatus!.enabled) {
          emit(QiblaError(error: 'Location is disabled'));
          return;
        }

        if (locationStatus.status == LocationPermission.denied) {
          emit(QiblaError(error: 'Location permission is denied'));
          return;
        }
        add(QiblaStartEvent());
      });
    });
  }

  Future<LocationStatus?> checkLocationStatus() async {
    await Geolocator.requestPermission();
    final locationStatus = await FlutterQiblah.checkLocationStatus();

    if (!locationStatus.enabled) return LocationStatus(false, .denied);

    if (locationStatus.status == LocationPermission.denied ||
        locationStatus.status == LocationPermission.deniedForever) {
      log('location is enabled, but denied');
      return LocationStatus(true, .denied);
    }
    log('location is enabled, and accepted');
    return locationStatus;
  }
}
