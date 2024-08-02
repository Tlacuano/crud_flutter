import 'package:bloc/bloc.dart';
import 'package:crud_flutter/data/model/Barca.dart';
import 'package:crud_flutter/data/repository/BarcaRepository.dart';
import 'package:crud_flutter/presentation/cubit/BarcaState.dart';

class BarcaCubit extends Cubit<BarcaState> {
  final BarcaRepository barcaRepository;

  BarcaCubit({required this.barcaRepository}) : super(BarcaInitial());

  Future<void> createBarca(BarcaModel barca) async {
    try {
      emit(BarcaLoading());
      await barcaRepository.createBarca(barca);
      emit(BarcaSuccess(barcas: await barcaRepository.getBarcas()));
    } catch (e) {
      emit(BarcaFailure(message: e.toString()));
    }
  }

  Future<void> getBarcas() async {
    try {
      emit(BarcaLoading());
      final barcas = await barcaRepository.getBarcas();
      emit(BarcaSuccess(barcas: barcas));
    } catch (e) {
      emit(BarcaFailure(message: e.toString()));
    }
  }

  Future<void> updateBarca(BarcaModel barca) async {
    try {
      emit(BarcaLoading());
      await barcaRepository.updateBarca(barca);
      emit(BarcaSuccess(barcas: await barcaRepository.getBarcas()));
    } catch (e) {
      emit(BarcaFailure(message: e.toString()));
    }
  }

  Future<void> deleteBarca(BarcaModel barca) async {
    try {
      emit(BarcaLoading());
      await barcaRepository.deleteBarca(barca);
      emit(BarcaSuccess(barcas: await barcaRepository.getBarcas()));
    } catch (e) {
      emit(BarcaFailure(message: e.toString()));
    }
  }
}
