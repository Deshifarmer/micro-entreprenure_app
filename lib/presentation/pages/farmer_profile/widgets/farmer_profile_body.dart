import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/domain/entities/orders_entity/order_response_entity.dart';
import 'package:deshifarmer/presentation/blocs/farmer_fetch_farm/farmer_fetch_farm_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/farmer_profile/components/cirularprofilepicfarmer.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/bloc/order_bloc.dart';
import 'package:deshifarmer/presentation/shapes/carrot_shape.dart';
import 'package:deshifarmer/presentation/shapes/farms_shape.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/error_button.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
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
    final farms = context.read<FarmerFetchFarmBloc>().state;
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
          if (farms is FarmerFetchFarmSuccess)
            Container(
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
                        'Total ${farms.allFarmListo.allCompany.length} Farms',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: farms.allFarmListo.allCompany.length,
                    itemBuilder: (context, index) {
                      final currentFarm =
                          farms.allFarmListo.allCompany.elementAt(index);

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
                                padding: const EdgeInsets.all(4.0),
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
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  currentFarm.address,
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (index != farms.allFarmListo.allCompany.length - 1)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
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
                    itemCount: orderState.orderEntitys.orders.length,
                    itemBuilder: (context, index) {
                      final currentOrder =
                          orderState.orderEntitys.orders.elementAt(index);
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OrderCardStackView(currentOrder: currentOrder),
                          if (index !=
                              orderState.orderEntitys.orders.length - 1)
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

class OrderCardStackView extends StatelessWidget {
  const OrderCardStackView({
    required this.currentOrder,
    super.key,
  });

  final OrderEntity currentOrder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          surfaceTintColor: Colors.white,
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              // 10,
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///! a logo
                    Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: getProportionateScreenHeight(
                                25,
                              ),
                              width: getProportionateScreenWidth(
                                25,
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(
                                  6,
                                ),
                              ),
                              // child: ,
                            ),

                            /// carrot shape
                            Positioned(
                              top: -15,
                              left: 10,
                              child: CustomPaint(
                                painter: CarrotShape(),
                                size: Size(
                                  getProportionateScreenWidth(
                                    30,
                                  ),
                                  getProportionateScreenHeight(
                                    30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          width: getProportionateScreenWidth(
                            25,
                          ),
                        ),

                        ///! column -> id, farmername,farmer phone
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '#${currentOrder.order_id}',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(
                                    5,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 3.5,
                                  backgroundColor: currentOrder.status ==
                                          'pending'
                                      ? Colors.yellow[400]
                                      : currentOrder.status ==
                                              'confirm by df cp'
                                          ? Colors.amber[200]
                                          : currentOrder.status ==
                                                  'processing by company'
                                              ? Colors.blue[300]
                                              : currentOrder.status ==
                                                      'ready to collect for distributor'
                                                  ? Colors.brown[300]
                                                  : 'ready to collect for me' ==
                                                          currentOrder.status
                                                      ? primaryColor
                                                      : Colors.green[800],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    ///! column -> money, companies, cats
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '৳ ${currentOrder.total_price}',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    // letterSpacing: 0.1,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          currentOrder.farmer_details?.farmer_address ?? '',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.normal,
                                    // letterSpacing: 0.1,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (currentOrder.status == 'ready to collect for me')

                  /// row of btns
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SecondayButtonGreen(
                        onpress: () async {
                          final loginState = context.read<LoginBloc>().state;

                          final deshiFarmerAPI = DeshiFarmerAPI();

                          ///! recevie api

                          if (loginState is LoginSuccess) {
                            final received = await deshiFarmerAPI.receiveOrder(
                              loginState.successLoginEntity.token,
                              currentOrder.order_id ?? '',
                            );
                            if (received == null) {
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(
                                errorSnackBar(
                                  'Order Received Error',
                                ),
                              );
                            } else {
                              context.read<OrderBloc>().add(
                                    InitOrders(
                                      loginState.successLoginEntity.token,
                                    ),
                                  );
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(
                                successSnackBar(
                                  'Successfully Received Order',
                                ),
                              );
                            }
                          }
                        },
                        title: 'Receive',
                      ),
                      ErrorButtonGreen(
                        onpress: () async {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: const Text(
                                  'For report call the Deshifarmer Call Center +88019267432',
                                ),
                                title: const Text('Report'),
                                // contentPadding: const EdgeInsets.all(8),
                                // insetPadding: const EdgeInsets.all(8),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                      context,
                                    ),
                                    child: const Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        title: 'Report',
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        if (currentOrder.status == 'collected by me')
          const Positioned(
            top: 0,
            right: 0,
            child: Icon(
              Icons.verified,
              color: primaryColor,
            ),
          ),
      ],
    );
  }
}

class FarmerDetailInDetail extends StatelessWidget {
  const FarmerDetailInDetail({
    super.key,
    required this.farmerProfilePage,
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
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: CustomPaint(
                  painter: MyFarmersShape(),
                  size: const Size(25, 25),
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
        ],
      ),
    );
  }
}
