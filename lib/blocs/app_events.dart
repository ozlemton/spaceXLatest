import 'package:spacex/models/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SpaceXEvent extends Equatable {
  const SpaceXEvent();
}

class LoadSpaceXEvent extends SpaceXEvent {
  @override
  List<Object?> get props => [];
}
