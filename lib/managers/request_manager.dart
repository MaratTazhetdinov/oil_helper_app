import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oil_helper_app/managers/request_state.dart';
import 'package:oil_helper_app/repository/request_repository.dart';

final requestManagerProvider =
    StateNotifierProvider<RequestManager, RequestState>(
  (ref) {
    final repo = RequestRepository.instance;
    return RequestManager(requestRepository: repo);
  },
);

class RequestManager extends StateNotifier<RequestState> {
  final RequestRepository requestRepository;

  RequestManager({required this.requestRepository}) : super(InitialState());

  void addRequest(String fuelType, String manufacturer, String model,
      String engineType, String date) {
    requestRepository.addRequest(
        fuelType, manufacturer, model, engineType, date);
    state = RequestAddedState();
  }
}
