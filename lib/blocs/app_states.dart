import 'package:spacex/models/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SpaceXState extends Equatable {}

class SpaceXLoadingState extends SpaceXState {
  @override
  List<Object?> get props => [];
}

class SpaceXLoadedState extends SpaceXState {
  late List<SpaceX> spaceX;
  SpaceXLoadedState(this.spaceX);
  @override
  List<Object?> get props => [spaceX];
}

class SpaceXErrorState extends SpaceXState {
  late String error;
  SpaceXErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
