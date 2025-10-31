import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/constants.dart';
import '../../../domain/usecases/add_package_usecase.dart';
import '../../widgets/package_pages/location_info.dart';
import '../../widgets/package_pages/payment_method.dart';
import '../../widgets/package_pages/pckage_info.dart';
import '../../widgets/package_pages/sender_recierver_info.dart';

mixin AddPackageMixin {
  final addPackageUsecase = sl<AddPackageUsecase>();

  final PageController pageController = PageController(initialPage: 0);

  GoogleMapController? _pickupcontroller;
  GoogleMapController? _dropoffController;

  final TextEditingController contentController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController recieverNameController = TextEditingController();
  final TextEditingController recieverPhoneNumberController =
      TextEditingController();
  final TextEditingController recieverEmailController = TextEditingController();

  final TextEditingController visaNumController = TextEditingController();
  final TextEditingController cVVController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();

  final GlobalKey<FormState> packageInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> recieverInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> paymentInfoFormKey = GlobalKey<FormState>();

  final List<Widget> pages = [
    PckageInfo(),
    SenderRecierverInfo(),
    LocationInfo(),
    PaymentMethod(),
  ];

  void setPickupController(GoogleMapController pickupcontroller) {
    _pickupcontroller = pickupcontroller;
  }

  void setDropoffController(GoogleMapController dropoffController) {
    _dropoffController = dropoffController;
  }

  void clearWithMixin() {
    contentController.clear();
    weightController.clear();
    recieverNameController.clear();
    recieverPhoneNumberController.clear();
    recieverEmailController.clear();
    visaNumController.clear();
    cVVController.clear();
    cardHolderController.clear();
  }

  void disposeControllers() {
    contentController.dispose();
    weightController.dispose();
    recieverNameController.dispose();
    recieverPhoneNumberController.dispose();
    recieverEmailController.dispose();
    visaNumController.dispose();
    cVVController.dispose();
    cardHolderController.dispose();
    pageController.dispose();
    _pickupcontroller?.dispose();
    _dropoffController?.dispose();
  }
}
