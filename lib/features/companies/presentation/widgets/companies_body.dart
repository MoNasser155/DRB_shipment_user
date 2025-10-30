import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../core/enums/state_status.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/widgets/custom_skeletonizer.dart';
import '../../data/models/company_model.dart';
import '../cubits/companies/couriers_cubit.dart';
import 'company_item.dart';

class CompaniesBody extends StatelessWidget {
  const CompaniesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: [
        SliverGap(SpacingHelper.kVertical12),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: BlocBuilder<CompaniesCubit, CompaniesState>(
            buildWhen: (previous, current) {
              return previous.companies != current.companies;
            },
            builder: (context, state) {
              final length =
                  state.status == StateStatus.loading
                      ? 15
                      : state.companies.length;
              return SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: SpacingHelper.kVertical12,
                  crossAxisSpacing: SpacingHelper.horizontal12,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final couriersCompanyModel =
                      state.status == StateStatus.loading
                          ? CompanyModel.skeleton()
                          : state.companies[index];
                  return CustomSkeletonizer(
                    enabled: state.status == StateStatus.loading,
                    child: CompanyItem(
                      companyModel: couriersCompanyModel,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  );
                },
                itemCount: length,
              );
            },
          ),
        ),
        SliverGap(kBottomNavigationBarHeight * 1.7),
      ],
    );
  }
}
