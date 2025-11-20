import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/constants.dart';
import '../../../../companies/domain/usecases/get_companies_usecase.dart';
import '../../../../couriers/domain/use_cases/get_all_couriers_usecase.dart';
import '../../../domain/usecases/add_package_usecase.dart';
import '../../../domain/usecases/get_governoments_usecase.dart';
import '../../widgets/package_pages/company_courier_selection.dart';
import '../../widgets/package_pages/drop_off_location.dart';
import '../../widgets/package_pages/pick_up_location_info.dart';
import '../../widgets/package_pages/payment_method.dart';
import '../../widgets/package_pages/pckage_info.dart';
import '../../widgets/package_pages/sender_recierver_info.dart';

mixin AddPackageMixin {
  final addPackageUsecase = sl<AddPackageUsecase>();
  final getGovernomentsUsecase = sl<GetGovernomentsUsecase>();
  final getCompaniesUsecase = sl<GetCompaniesUsecase>();
  final getAllCouriersUsecase = sl<GetAllCouriersUsecase>();

  final PageController pageController = PageController(initialPage: 0);

  GoogleMapController? _pickupcontroller;
  GoogleMapController? _dropoffController;

  final TextEditingController contentController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController recieverNameController = TextEditingController();
  final TextEditingController recieverPhoneNumberController =
      TextEditingController();
  final TextEditingController recieverEmailController = TextEditingController();
  final TextEditingController packageNotesController = TextEditingController();

  final TextEditingController pickUpAddressController = TextEditingController();
  final TextEditingController dropOffAddressController =
      TextEditingController();

  final TextEditingController visaNumController = TextEditingController();
  final TextEditingController cVVController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();

  final GlobalKey<FormState> packageInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> recieverInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> paymentInfoFormKey = GlobalKey<FormState>();

  final GlobalKey<FormState> pickupInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> dropoffInfoFormKey = GlobalKey<FormState>();

  final List<Widget> pages = [
    PckageInfo(),
    RecierverInfo(),
    PickUpLocationInfo(),
    DropOffLocationInfo(),
    CompanyCourierSelection(),
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
    packageNotesController.clear();
    pickUpAddressController.clear();
    dropOffAddressController.clear();
    pageController.jumpToPage(0);
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
    packageNotesController.dispose();
    pickUpAddressController.dispose();
    dropOffAddressController.dispose();
    _pickupcontroller?.dispose();
    _dropoffController?.dispose();
  }
}
