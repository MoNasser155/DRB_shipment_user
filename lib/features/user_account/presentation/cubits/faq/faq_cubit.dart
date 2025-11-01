import 'package:drb_shipment_user/features/user_account/data/models/faq_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../domain/usecases/get_faqs_usecase.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqState.initial());

  static FaqCubit get(context) => BlocProvider.of(context);

  final _getFaqsUsecase = sl<GetFaqsUsecase>();

  Future<void> getFaqs() async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = await _getFaqsUsecase.call();
    result.fold(
      (failure) => emit(state.copyWith(status: StateStatus.error)),
      (faqs) => emit(state.copyWith(faqs: faqs, status: StateStatus.success)),
    );
  }
}
