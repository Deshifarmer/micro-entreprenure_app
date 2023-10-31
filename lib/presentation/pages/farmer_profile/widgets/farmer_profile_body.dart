import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/farm_entity/farm_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity_again.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/farmer_profile/components/cirularprofilepicfarmer.dart';
import 'package:deshifarmer/presentation/pages/farmer_profile/components/order_page_compo.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/bloc/order_bloc.dart';
import 'package:deshifarmer/presentation/shapes/farms_shape.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class FarmerProfileBody extends StatelessWidget {
  const FarmerProfileBody({
    // required this.fullName,
    // required this.farmerID,
    required this.farmerProfilePage,
    super.key,
  });

  final FarmerEntity farmerProfilePage;
  // final String? fullName;
  // final String? farmerID;
  // final String? farmerPhoto;
  @override
  Widget build(BuildContext context) {
    final orderState = context.read<OrderBloc>().state;
    // final farms = context.read<FarmerFetchFarmBloc>().state;
    final loginState = context.read<LoginBloc>().state;
    final token =
        loginState is LoginSuccess ? loginState.successLoginEntity.token : '';
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20) //20,
        ,
      ),
      child: ListView(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          FarmerCircularProfilePic(farmerProfilePage: farmerProfilePage),

          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              farmerProfilePage.full_name ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          /// code
          Text(
            '#${farmerProfilePage.farmer_id}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          if (farmerProfilePage.group_id != null)
            Padding(
              padding: EdgeInsets.symmetric(
                // 4.0
                horizontal: getProportionateScreenWidth(4),
                vertical: getProportionateScreenHeight(4),
              ),
              child: Text(
                'Group ID: #${farmerProfilePage.group_id}',
                style: Theme.of(context).textTheme.labelSmall,
                textAlign: TextAlign.center,
              ),
            ),

          SizedBox(
            height: getProportionateScreenHeight(20),
          ),

          /// farmer detail
          FarmerDetailInDetail(farmerProfilePage: farmerProfilePage),

          SizedBox(
            height: getProportionateScreenHeight(20),
          ),

          /// farmers farm
          // FarmerFetchFarmSuccess
          // if (farms is FarmerFetchFarmSuccess)
          /// to show only the farm
          FutureBuilder<FarmerEntityAgain?>(
            future: DeshiFarmerAPI()
                .getSingleFarmer(token, farmerProfilePage.farmer_id ?? ''),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                final singleFarmer = snapshot.data!;
                return Container(
                  width: MediaQuery.sizeOf(context).width,
                  // margin: const EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(
                    //12
                    horizontal: getProportionateScreenWidth(12),
                    vertical: getProportionateScreenHeight(12),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 10,
                                ),
                                child: CustomPaint(
                                  painter: FarmsShape(),
                                  size: const Size(25, 25),
                                ),
                              ),
                              Text(
                                'কৃষকের ফার্ম ',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          Text(
                            'Total ${singleFarmer.farm_list.length} Farms',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: singleFarmer.farm_list.length,
                        itemBuilder: (context, index) {
                          final currentFarm = FarmEntity.fromJson(
                            singleFarmer.farm_list.elementAt(index)
                                as Map<String, dynamic>,
                          );

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /// name and area
                              Row(
                                children: [
                                  const Icon(
                                    Icons.loyalty,
                                    size: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                      '${currentFarm.farm_name}, ${currentFarm.farm_area}',
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              /// locaton

                              Row(
                                children: [
                                  const Icon(
                                    Icons.room,
                                    size: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                      currentFarm.address,
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (index != singleFarmer.farm_list.length - 1)
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Divider(
                                    height: 2,
                                    color: Colors.black.withOpacity(0.54),
                                    indent: 20,
                                    thickness: 1,
                                    endIndent: 20,
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              // print("data -> ${snapshot.data} error: ${snapshot.error}");
              return Container();
            },
          ),

          SizedBox(
            height: getProportionateScreenHeight(20),
          ),

          if (orderState is OrderSuccess)

            /// HACK: EEEEEEEEEEEEEEEE
            Container(
              width: MediaQuery.sizeOf(context).width,
              // margin: const EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(12),
                vertical: getProportionateScreenHeight(12),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: getProportionateScreenWidth(12),
                        ),
                        child: const Icon(Icons.calendar_view_day_sharp),
                      ),
                      Text(
                        'কৃষকের অর্ডার তালিকা ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),

                  /// PERF: order list
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: farmerProfilePage.order_list.length,
                    itemBuilder: (context, index) {
                      final currentOrder =
                          farmerProfilePage.order_list.elementAt(index);
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // OrderCardStackView(currentOrder: currentOrder),
                          FarmerOrderCard(currentOrder: currentOrder),
                          if (index !=
                              orderState.orderEntitys.data.length - 1)
                            Divider(
                              height: 2,
                              color: Colors.black.withOpacity(0.54),
                              indent: 20,
                              thickness: 1,
                              endIndent: 20,
                            ),
                        ],
                      );
                    },
                  ),

                  /// PERF: order list end
                ],
              ),
            ),

          /// HACK: DDDDDDDDDDDDD

          SizedBox(
            height: getProportionateScreenHeight(20),
          ),

          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
        ],
      ),
    );
  }
}

class FarmerDetailInDetail extends StatelessWidget {
  const FarmerDetailInDetail({
    required this.farmerProfilePage,
    super.key,
  });

  final FarmerEntity farmerProfilePage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      // margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  right: 10,
                ),
                child: CustomPaint(
                  painter: MyFarmersShape(
                    colorF: Color(0xff7D4600),
                  ),
                  size: Size(25, 25),
                ),
              ),
              Text(
                'কৃষকের তথ্য ',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.person,
                size: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  farmerProfilePage.full_name ?? '',
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),

          /// phone

          Row(
            children: [
              const Icon(
                Icons.phone_iphone,
                size: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  farmerProfilePage.phone ?? '',
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),

          ///Location

          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(8),
                  vertical: getProportionateScreenHeight(8),
                ),
                child: Text(
                  farmerProfilePage.address ?? '',
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          if (farmerProfilePage.usaid_id != null)
            Row(
              children: [
                const Icon(
                  Icons.iso_rounded,
                  size: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(8),
                    vertical: getProportionateScreenHeight(8),
                  ),
                  child: Text(
                    farmerProfilePage.usaid_id ?? '',
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
