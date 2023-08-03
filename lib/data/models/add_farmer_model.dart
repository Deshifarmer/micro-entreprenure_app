class AddFarmerModel {
  const AddFarmerModel({
    required this.nid,
    required this.firstName,
    required this.lastName,
    required this.fathersName,
    required this.phone,
    required this.isMarried,
    required this.gender,
    required this.dateOfBirth,
    required this.address,
    required this.village,
    required this.union,
    required this.upazila,
    required this.district,
    required this.division,
    required this.residentType,
    required this.familyMember,
    required this.numberOfChildren,
    required this.yearlyIncome,
    required this.yearOfStayIn,
    this.groupId,
    this.farmArea,
    this.farmType,
    this.bankDetails,
    this.mfsAccount,
    this.currentProducingCrop,
    this.focusedCrop,
    this.image,
    this.farmerType,
    // this.creditScore,
    this.farmId, //required this.croppingIntensity,
    this.govtFarmerID,
    this.onboardBy,
  });
  final String nid;
  final String firstName;
  final String? image;
  final String? farmerType;
  final String? govtFarmerID;
  final String? onboardBy;
  final String lastName;
  final String fathersName;
  final String phone;
  final String isMarried;
  final String gender;
  final DateTime dateOfBirth;
  final String address;
  final String village;
  final String union;
  final String upazila;
  final String district;
  final String division;
  // final double? creditScore;
  final String residentType;
  final String familyMember;
  final String numberOfChildren;
  final String yearlyIncome;
  final String yearOfStayIn;
  final String? groupId;
  final String? farmArea;
  final String? farmType;
  final Map<String, dynamic>? bankDetails;
  final Map<String, dynamic>? mfsAccount;
  final String? currentProducingCrop;
  final String? focusedCrop;
  final Map<String, dynamic>? farmId;
}
