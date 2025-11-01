import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drb_shipment_user/core/constants.dart';
import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:drb_shipment_user/core/utils/cashe_storage.dart';
import 'package:drb_shipment_user/core/utils/navigator_helper.dart';
import 'package:drb_shipment_user/core/widgets/custom_appbar.dart';
import 'package:drb_shipment_user/features/auth/presentation/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/color_helper.dart';
import '../../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../../core/languages/local_keys.g.dart';
import '../../../../../../core/widgets/cutsom_button.dart';
import '../../../widgets/delete_accoumt_row.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SpacingHelper.kHorizontalPadding,
          vertical: SpacingHelper.kVertical16,
        ),
        child: CustomButton(
          backgroundColor: ColorHelper.red.withValues(alpha: 0.7),
          buttonChild:
              isLoading
                  ? SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                  : Text(
                    LocaleKeys.deleteAccount,
                    style: AppTextTheme.appBarTitle,
                  ),
          onTap:
              isLoading
                  ? null
                  : () async {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      await deleteUser();
                    } finally {
                      if (mounted) {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                  },
        ),
      ),
      body: AbsorbPointer(
        absorbing: isLoading,
        child: Opacity(
          opacity: isLoading ? 0.5 : 1.0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SpacingHelper.kHorizontalPadding,
            ),
            child: Column(
              spacing: SpacingHelper.kVertical12,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomAppbar(title: LocaleKeys.deleteAccountWarningTitle),
                Text(
                  '${LocaleKeys.deleteAccountWarningSubtitle}, ${LocaleKeys.deleteAccountWarningSubtitle1}: ',
                  style: AppTextTheme.text16W500grey100,
                ),
                DeleteAccountRow(
                  text: LocaleKeys.deleteAccountPoint1,
                  isMultiLines: true,
                ),
                DeleteAccountRow(
                  text: LocaleKeys.deleteAccountPoint2,
                  isMultiLines: true,
                ),
                DeleteAccountRow(
                  text: LocaleKeys.deleteAccountPoint3,
                  isMultiLines: true,
                ),
                DeleteAccountRow(
                  text: LocaleKeys.deleteAccountPoint4,
                  isMultiLines: true,
                ),
                DeleteAccountRow(
                  text: LocaleKeys.deleteAccountPoint5,
                  isMultiLines: true,
                ),
                Gap(SpacingHelper.kVertical12),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: ColorHelper.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: ColorHelper.red.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    '${LocaleKeys.deleteAccountFinalWarning}. ${LocaleKeys.onceDeleted}, ${LocaleKeys.yourAccountAndAllAssociatedDataWillBePermanentlyRemoved}.',
                    style: AppTextTheme.text14W500grey300.copyWith(
                      color: ColorHelper.red,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> deleteUser() async {
    try {
      await Future.wait([deleteUserFirebase(), deleteUserData()]);
      AppNavigator.pushAndRemoveAll(
        transitionBuilder: AppNavigator.cupertinoTransition,
        screen: LoginScreen(),
      );
    } catch (e) {
      log('Error deleting user: $e');
    }
  }

  Future<void> deleteUserFirebase() async {
    final user = FirebaseAuth.instance.currentUser;
    user?.delete();
  }

  Future<void> deleteUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final userid = user?.uid;
    await firestore.collection('users').doc(userid).delete();
    await CacheStorage.delete(Constants.userKey);
  }
}
