import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../models/payment_type_model.dart';
import '../../repositories/auth/payment_type/payment_type_repository.dart';
 
part 'payment_type_controller.g.dart';


enum PaymentTypeSateStatus {
  initial,
  loading,
  loaded,
  error,
  showAddOrUpdatePayment,
  saved
}

class PaymentTypeController = PaymentTypeControllerBase
    with _$PaymentTypeController;

abstract class PaymentTypeControllerBase with Store {
  final PaymentTypeRepository _paymentTypeRepository;

  @readonly
  var _status = PaymentTypeSateStatus.initial;

  @readonly
  var _paymentTypes = <PaymentTypeModel>[];

  @readonly
  String? _errorMessage;

  @readonly
  bool? _filterEnabled;

  @readonly
  PaymentTypeModel? _paymentTypeSelected;

  PaymentTypeControllerBase(this._paymentTypeRepository);

  @action
  void changeFilter(bool? enabled) => _filterEnabled = enabled;

  @action
  Future<void> loadPayments() async {
    try {
      _status = PaymentTypeSateStatus.loading;
      _paymentTypes = await _paymentTypeRepository.findAll(_filterEnabled);
      _status = PaymentTypeSateStatus.loaded;
    } on Exception catch (e, s) {
      log('Erro ao carregar as formas de pagamento', error: e, stackTrace: s);
      _status = PaymentTypeSateStatus.error;
      //_errorMessage = 'Erro ao carregar as formas de pagamento';

    }
  }

  @action
  Future<void> addPayment() async {
    _status = PaymentTypeSateStatus.loading;
    await Future.delayed(Duration.zero);
    _paymentTypeSelected = null;
    _status = PaymentTypeSateStatus.showAddOrUpdatePayment;
  }

  Future<void> editPayment(PaymentTypeModel, payment) async {
    _status = PaymentTypeSateStatus.loading;
    await Future.delayed(Duration.zero);
    _paymentTypeSelected = payment;
    _status = PaymentTypeSateStatus.showAddOrUpdatePayment;
  }

  @action
  void savePayment({
    int? id,
    required String name,
    required String acronym,
    required bool enabled,
  }) {
    _status = PaymentTypeSateStatus.loading;
    final paymentTypeModel = PaymentTypeModel(
      id,
      name,
      acronym,
      enabled,
    );
    
    _paymentTypeRepository.save(paymentTypeModel);
    _status = PaymentTypeSateStatus.saved;
  }
}
