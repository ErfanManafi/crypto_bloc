import 'package:bloc/bloc.dart';
import 'package:crypto_test/model/crypto_model.dart';
import 'package:crypto_test/repository/repo.dart';
import 'package:equatable/equatable.dart';
part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository repository;

  CryptoBloc(this.repository) : super(CryptoInitial()) {
    on<FetchCryptoData>((event, emit) async {
      emit(CryptoLoading());
      try {
        final cryptoData = await repository.fetchCryptoData();
        emit(CryptoLoaded(cryptoData));
      } catch (e) {
        emit(CryptoError("خطا در بارگزاری اطلاعات ${e.toString()}"));
      }
    });
  }
}
