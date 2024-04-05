import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';
import '../blocs.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc cartBloc;
  final StudentRepository studentRepository;
  CheckoutBloc({required this.cartBloc, required this.studentRepository})
      : super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(cart: (cartBloc.state as CartLoaded).cart)
            : CheckoutLoading()) {
    on<UpdateCheckoutEvent>(_onUpdateCheckout);
    on<ConfirmCheckoutEvent>(_onConfirmCheckout);
  }

  Future<void> _onUpdateCheckout(
      UpdateCheckoutEvent event, Emitter<CheckoutState> emit) async {
    if (this.state is CheckoutLoaded) {
      // final state = this.state as CheckoutLoaded;
      emit(CheckoutLoaded(cart: (cartBloc.state as CartLoaded).cart));
    }
  }

  Future<void> _onConfirmCheckout(
      ConfirmCheckoutEvent event, Emitter<CheckoutState> emit) async {
    emit(ConfirmLoading());
  
      try {
        final result =
            await studentRepository.createOrder(event.createOrderModel);
        if (result != null) {
          emit(CheckoutSuccess(orderModel: result));
        } else {
          emit(CheckoutFailed(error: 'Mua thất bại!'));
        }
      } catch (_) {
        emit(CheckoutFailed(error: 'Mua thất bại'));
      }
  }
}
