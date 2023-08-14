import 'package:deshifarmer/data/models/home_page_icon_model.dart';

import 'package:deshifarmer/presentation/shapes/agri_advisory_shape.dart';
import 'package:deshifarmer/presentation/shapes/agri_input_shape.dart';
import 'package:deshifarmer/presentation/shapes/crop_insurance_shape.dart';
import 'package:deshifarmer/presentation/shapes/farms_shape.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/shapes/orders_shape.dart';
import 'package:deshifarmer/presentation/shapes/performance_shape.dart';
import 'package:deshifarmer/presentation/shapes/track_activity_shape.dart';

class HomePageParams {
  ///* home cat
  static const List<String> categories = <String>[
    'কৃষি ইনপুট',
    'অর্ডার লিস্ট',
    'অর্ডার সংগ্রহ',
    'কৃষক তালিকা',
    'নতুন কৃষক যোগ',
    'গ্রুপ তৈরি',
    'আমার কাজ',
    'কে-পি-আই',
    'কৃষি বীমা',
    'কৃষি পরামর্শ',
    'ট্র্যাক কার্যকলাপ',
  ];

  static List<HomeIconModel> homePageIconDatas = [
    HomeIconModel(painter: AgriInputShape(), title: 'Agri Input'),
    HomeIconModel(painter: TrackActivityShape(), title: 'Track Activity'),
    HomeIconModel(painter: CropInsuranceShape(), title: 'Crop Insurance'),
    HomeIconModel(painter: AgriAdvisoryShape(), title: 'Agri Input'),
    HomeIconModel(painter: MyFarmersShape(), title: 'My Farmers'),
    HomeIconModel(painter: FarmsShape(), title: 'Farms'),
    HomeIconModel(painter: PerformaceShape(), title: 'Performance'),
    HomeIconModel(painter: OrdersShape(), title: 'Orders'),
  ];

  static List<HomeIconModel> homePageShortCuts = [
    HomeIconModel(painter: AgriInputShape(), title: 'Add new Farmer'),
    HomeIconModel(painter: TrackActivityShape(), title: 'Add new Group'),
    HomeIconModel(painter: CropInsuranceShape(), title: 'Commission'),
    HomeIconModel(painter: AgriAdvisoryShape(), title: 'Attendance'),
  ];
}
