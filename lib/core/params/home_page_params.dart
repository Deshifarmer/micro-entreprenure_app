import 'package:deshifarmer/data/models/home_page_icon_model.dart';

import 'package:deshifarmer/presentation/shapes/agri_input_shape.dart';
import 'package:deshifarmer/presentation/shapes/farms_shape.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/shapes/taka_shape.dart';
import 'package:deshifarmer/presentation/shapes/track_activity_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

class HomePageParams {
  ///* home cat
  static const List<String> categories = <String>[
    /// 1st 8 items
    'কৃষি ইনপুট',
    'ট্র্যাক করুন ',
    'কৃষি ইন্সুরেন্স ',
    'কৃষি পরামর্শ ',
    'আমার কৃষক ',
    'ফার্ম যোগ ',
    'পারফরমেন্স ',
    'অর্ডার তালিকা ',

    /// 2nd 8 items
    'বাজার চাহিদা ',
    'লজিস্টিক',
    'গ্রুপ',
    'কমিশন',
    'ফসল',
    'সার্ভে',
    'নিরাপদ উৎপাদন',
  ];

  static List<HomeIconModel> homePageIconDatas1st = [
    HomeIconModel(
      painter: AgriInputShape(),
      title: 'কৃষি ইনপুট',
    ),
    HomeIconModel(
      painter: TrackActivityShape(),
      title: 'ট্র্যাক করুন',
    ),
    HomeIconModel(
      icon: const Icon(
        Icons.verified_user_outlined,
        color: Color(0xff2f80ed),
      ),
      title: 'কৃষি ইন্সুরেন্স',
    ),
    HomeIconModel(
      icon: const Icon(
        Icons.insert_comment_outlined,
        color: Color(0xff9b51e0),
      ),
      title: 'কৃষি পরামর্শ',
    ),
    HomeIconModel(
      painter: const MyFarmersShape(
        colorF: Color(0xff7D4600),
      ),
      title: 'আমার কৃষক',
    ),
    HomeIconModel(
      painter: FarmsShape(),
      title: 'ফার্ম যোগ',
    ),
    HomeIconModel(
      icon: const Icon(
        Icons.bar_chart,
        color: Color(0xffff9403),
      ),
      title: 'পারফরমেন্স',
    ),
    HomeIconModel(
      icon: Icon(
        Icons.format_list_numbered,
        color: Colors.black.withOpacity(0.54),
      ),
      title: 'অর্ডার তালিকা',
    ),
  ];

  ///! 2nd 8 items
  static List<HomeIconModel> homePageIconDatas2nd = [
    HomeIconModel(
      icon: Icon(
        Icons.record_voice_over_outlined,
        color: Colors.black.withOpacity(0.54),
      ),
      title: 'বাজার চাহিদা',
    ),
    HomeIconModel(
      icon: const Icon(
        Icons.time_to_leave_outlined,
        color: Color(0xff2F80ED),
      ),
      title: 'লজিস্টিক',
    ),
    HomeIconModel(
      icon: Icon(
        Icons.toll_outlined,
        color: Colors.black.withOpacity(0.54),
      ),
      title: 'গ্রুপ',
    ),
    HomeIconModel(
      icon: const Icon(
        Icons.list_alt,
        color: Color(0xffF2994A),
      ),
      title: 'কমিশন',
    ),
    HomeIconModel(
      icon: const Icon(
        Icons.local_florist_outlined,
        color: Color(0xff219653),
      ),
      title: 'ফসল',
    ),
    HomeIconModel(
      icon: const Icon(
        Icons.paste_outlined,
        color: Color(0xff9B51E0),
      ),
      title: 'সার্ভে',
    ),
    HomeIconModel(
      icon: const Icon(
        Icons.gps_not_fixed,
        color: Color(0xff219653),
      ),
      title: 'নিরাপদ উৎপাদন',
    ),
    HomeIconModel(
      icon: const Icon(
        Icons.payment_outlined,
        color: Color(0xff219653),
      ),
      title: 'Finance',
    ),
  ];

  ///! shortcuts
  static List<HomeIconModel> homePageShortCuts = [
    HomeIconModel(
      // painter: AgriInputShape(),
      icon: const Icon(
        Icons.vertical_align_bottom_outlined,
        color: primaryColor,
      ),
      title: 'নতুন কৃষক যোগ',
    ),
    HomeIconModel(
      painter: TrackActivityShape(),
      title: 'নতুন ফার্ম যোগ',
    ),
    HomeIconModel(
      painter: TakaPainter(),
      title: 'কমিশন',
    ),
    HomeIconModel(
      icon: const Icon(
        Icons.back_hand_outlined,
        color: primaryColor,
      ),
      title: 'উপস্থিতি',
    ),
  ];
}
