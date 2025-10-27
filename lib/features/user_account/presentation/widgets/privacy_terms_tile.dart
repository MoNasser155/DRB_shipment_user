part of '../imports/user_account_imports.dart';

class TermsConditionTile extends StatelessWidget {
  const TermsConditionTile(
      {super.key, required this.title, required this.description});
  final String title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Gap(4.h),
        Text(
          description,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: ColorHelper.grey500,
              ),
        )
      ],
    );
  }
}
