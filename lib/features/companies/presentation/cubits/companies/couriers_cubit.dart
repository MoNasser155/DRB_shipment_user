import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../data/models/company_model.dart';
import '../../../domain/usecases/get_companies_usecase.dart';

part 'couriers_state.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  CompaniesCubit() : super(CompaniesState.initial());

  static CompaniesCubit get(context) => BlocProvider.of(context);

  final _getCompaniesUsecase = sl<GetCompaniesUsecase>();

  Future<void> initCompanies() async {
    emit(state.copyWith(status: StateStatus.loading));
    await Future.wait([_fetchCompanies()]);
    emit(state.copyWith(status: StateStatus.success));
  }

  Future<void> _fetchCompanies() async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = await _getCompaniesUsecase.call();
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (companies) => emit(
        state.copyWith(companies: companies, status: StateStatus.success),
      ),
    );
  }
}
