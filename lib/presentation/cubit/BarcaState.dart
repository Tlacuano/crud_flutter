import 'package:crud_flutter/data/model/Barca.dart';
import 'package:equatable/equatable.dart';

abstract class BarcaState extends Equatable {
  @override
  List<Object> get props => [];
}

class BarcaInitial extends BarcaState {}

class BarcaLoading extends BarcaState {}

class BarcaSuccess extends BarcaState {
  final List<BarcaModel> barcas;

  BarcaSuccess({required this.barcas});

  @override
  List<Object> get props => [barcas];
}

class BarcaFailure extends BarcaState {
  final String message;

  BarcaFailure({required this.message});

  @override
  List<Object> get props => [message];
}
