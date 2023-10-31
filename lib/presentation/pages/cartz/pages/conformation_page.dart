import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/data/models/order_model.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/blocs/cart/cart_bloc.dart';
import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/cubit/dropdown/dropdown_cubit.dart';
import 'package:deshifarmer/presentation/pages/cartz/widgets/card_cart3.dart';
import 'package:deshifarmer/presentation/pages/home/home.dart';
import 'package:deshifarmer/presentation/pages/login/login.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderConformationPage extends StatefulWidget {
  const OrderConformationPage({super.key});

  @override
  State<OrderConformationPage> createState() => _OrderConformationPageState();
}

class _OrderConformationPageState extends State<OrderConformationPage> {
  @override
  Widget build(BuildContext context) {
    const isOrdered = false;
    final userProfile = context.read<UserProfileBloc>().state;

    /// power
    final selectedFarmer = context.read<DropdownForFarmerCubit>().state;

    // final itemToList = CartBlocstate.carts.entries.toList();
    final cartItems = context.read<CartBloc>().state;
    return WillPopScope(
      onWillPop: () async {
        // debugPrint('is this button presssed');

        // context.read<DropdownForPaymentCubit>().changeDropdownValue('');
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('অর্ডারটি চেক করুন'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: ListView(
            children: [
              // Card(
              //   color: backgroundColor2,
              //   child: Padding(
              //     padding: const EdgeInsets.all(10),
              //     child: Column(
              //       children: [
              //         Text(
              //           'অর্ডার বিবরণ',
              //           style: Theme.of(context).textTheme.titleLarge!.copyWith(
              //                 color: primaryColor,
              //               ),
              //         ),

              //         /// row if id/time

              //         DetailRowConformCompo(
              //           field: 'ক্ষুদ্র উদ্যোক্তা আইডি: ',
              //           value: userProfile is UserProfileFetchSuccess
              //               ? userProfile.userProfile.df_id ?? ''
              //               : '',
              //         ),
              //         DetailRowConformCompo(
              //           field: 'অর্ডার করার সময়:',
              //           value:
              //               DateFormat.jms().add_yMMMd().format(DateTime.now()),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // order detail
              /* Text(
                'অর্ডার বিবরণ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: primaryColor,
                    ),
              ),

              /// row if id/time

              DetailRowConformCompo(

                field: 'ক্ষুদ্র উদ্যোক্তা আইডি: ',
                value: userProfile is UserProfileFetchSuccess
                    ? userProfile.userProfile.df_id ?? ''
                    : '',
              ),
              DetailRowConformCompo(
                field: 'অর্ডার করার সময়:',
                value: DateFormat.jms().add_yMMMd().format(DateTime.now()),
              ), */
              //
// DateFormat.jms().add_yMMMd().format(DateTime.now())
              // farmer detail
              /* Text(
                'কৃষকের বিবরণ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: primaryColor,
                    ),
              ),
              if (selectedFarmer != null) ...[
                DetailRowConformCompo(
                  field: 'নাম',
                  value: selectedFarmer.full_name ?? '',
                ),
                DetailRowConformCompo(
                  field: 'কৃষক আইডি',
                  value: selectedFarmer.farmer_id ?? '',
                ),
                DetailRowConformCompo(
                  field: 'ফোন',
                  value: selectedFarmer.phone ?? '',
                ),
                DetailRowConformCompo(
                  field: 'ঠিকানা',
                  value: selectedFarmer.address ?? '',
                ),
              ], */
              // Card(
              //   margin: const EdgeInsets.symmetric(
              //     vertical: 10,
              //   ),
              //   color: backgroundColor2,
              //   child: Padding(
              //     padding: const EdgeInsets.all(10),
              //     child: Column(
              //       children: [
              //         Text(
              //           'কৃষকের বিবরণ',
              //           style: Theme.of(context).textTheme.titleLarge!.copyWith(
              //                 color: primaryColor,
              //               ),
              //         ),

              
              //         // if (selectedFarmer != null) ...[
              //         //   DetailRowConformCompo(
              //         //     field: 'নাম',
              //         //     value: selectedFarmer.full_name ?? '',
              //         //   ),
              //         //   DetailRowConformCompo(
              //         //     field: 'কৃষক আইডি',
              //         //     value: selectedFarmer.farmer_id ?? '',
              //         //   ),
              //         //   DetailRowConformCompo(
              //         //     field: 'ফোন',
              //         //     value: selectedFarmer.phone ?? '',
              //         //   ),
              //         //   DetailRowConformCompo(
              //         //     field: 'ঠিকানা',
              //         //     value: selectedFarmer.address ?? '',
              //         //   ),
              //         // ],
              //       ],
              //     ),
              //   ),
              // ),
              Card(
                elevation: 0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.flight_takeoff_outlined),
                          Text('ডেলিভারি তথ্য'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('অর্ডার করার সময়:'),
                            Text(
                              DateFormat.jms()
                                  .add_yMMMd()
                                  .format(DateTime.now()),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('ক্ষুদ্র উদ্যোক্তা আইডি: '),
                            Text(
                              userProfile is UserProfileFetchSuccess
                                  ? userProfile.userProfile.df_id ?? ''
                                  : '',
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.all(8.0),
                      //   child: Row(
                      //     children: [
                      //       Icon(
                      //         Icons.phone_forwarded_outlined,
                      //         size: 18,
                      //       ),
                      //       Text('+88019923847'),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.all(8),
                      //   child: Row(
                      //     children: [
                      //       Icon(Icons.room_outlined),
                      //       Text(
                      //           'bokul miar bari, sherpur koborsthan, sherpur, bogra'),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              ///! farmer info
              if (context.read<DropdownForFarmerCubit>().state != null)
                Card(
                  elevation: 0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.calendar_view_day),
                            Text('কৃষকের তথ্য '),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              const CustomPaint(
                                painter: MyFarmersShape(
                                  colorF: Colors.black,
                                ),
                              ),
                              Text(
                                '${context.read<DropdownForFarmerCubit>().state?.full_name}',
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.phone_forwarded_outlined,
                                size: 18,
                              ),
                              Text(
                                '${context.read<DropdownForFarmerCubit>().state?.phone}',
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              const Icon(Icons.room_outlined),
                              Text(
                                '${context.read<DropdownForFarmerCubit>().state?.address}',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              // New UI Product LIST
              if (cartItems is CartAddingState)
                Card(
                  elevation: 0,
                  color: Colors.white,
                  child: Column(
                    children: [
                      for (final item in cartItems.carts.entries) ...[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                            left: 10,
                          ),
                          child: CartCard3(
                            productData: item.value.$1,
                            items: item.value.$2,
                          ),
                        ),
                      ],
                      const Divider(
                        color: Color(0xffa3a3a3),
                        endIndent: 30,
                        indent: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Text('অর্ডারের তথ্য'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // add all items qt
                                Text(
                                  'মোট পণ্য ( ${cartItems.getTotalItems()} items)',
                                ),
                                Text('৳ ${cartItems.getTotalPrices()}'),
                              ],
                            ),
                            const Row(
                              children: [
                                Text('ডেলিভারি ফি'),
                              ],
                            ),
                            const Row(
                              children: [
                                Text('ভ্যাট 0%'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('সর্বমোট'),
                                Text('৳ ${cartItems.getTotalPrices()}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Text(
                'পেমেন্ট মেথড “${context.read<DropdownForPaymentCubit>().state}”',
              ),
              // item detail
              /*
              Card(
                color: backgroundColor2,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        'পণ্যের বিবরণ',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: primaryColor,
                            ),
                      ),
                      if (cartItems is CartAddingState)
                        DataTable(
                          // showBottomBorder: true,
                          // headingTextStyle: Theme.of(context).textTheme.labelLarge,

                          border: TableBorder.all(
                            color: secondaryColor,
                          ),
                          headingRowColor:
                              const MaterialStatePropertyAll(priceBoxColor),
                          dividerThickness: 0.2,
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Name',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Qt',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Price',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                          rows: [
                            for (final item in cartItems.carts.entries)
                              DataRow(
                                cells: [
                                  DataCell(Text(item.value.$1.name ?? '')),
                                  DataCell(Text(item.value.$2.toString())),
                                  DataCell(
                                    Text(
                                      '${double.parse(item.value.$1.sell_price ?? "0") * item.value.$2}',
                                    ),
                                  ),
                                ],
                              ),
                            const DataRow(
                              // color: MaterialStatePropertyAll(Colors.green),
                              cells: [
                                DataCell(Text('Service Charge')),
                                DataCell(Text('')),
                                DataCell(
                                  Text('0'),
                                ),
                              ],
                            ),
                            const DataRow(
                              // color: MaterialStatePropertyAll(Colors.green),
                              cells: [
                                DataCell(Text('VAT')),
                                DataCell(Text('')),
                                DataCell(
                                  Text('0%'),
                                ),
                              ],
                            ),
                            DataRow(
                              color:
                                  const MaterialStatePropertyAll(priceBoxColor),
                              cells: [
                                const DataCell(
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const DataCell(Text('')),
                                DataCell(
                                  Text(
                                    '''
${cartItems.getTotalPrices() + cartItems.getTotalPrices()}''',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              */
              /* Text(
                'পণ্যের বিবরণ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: primaryColor,
                    ),
              ),
              if (cartItems is CartAddingState)
                DataTable(
                  // showBottomBorder: true,
                  // headingTextStyle: Theme.of(context).textTheme.labelLarge,

                  border: TableBorder.all(
                    color: secondaryColor,
                  ),
                  headingRowColor: MaterialStatePropertyAll(primaryColor),
                  dividerThickness: 0.2,
                  columns: const <DataColumn>[
                    DataColumn(
                        label: Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      'Qt',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      'Price',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                  ],
                  rows: [
                    for (final item in cartItems.carts.entries)
                      DataRow(
                        cells: [
                          DataCell(Text(item.value.$1.name ?? '')),
                          DataCell(Text(item.value.$2.toString())),
                          DataCell(
                            Text(
                              '${double.parse(item.value.$1.sell_price ?? "0") * item.value.$2}',
                            ),
                          ),
                        ],
                      ),
                    const DataRow(
                      // color: MaterialStatePropertyAll(Colors.green),
                      cells: [
                        DataCell(Text('Service Charge')),
                        DataCell(Text('')),
                        DataCell(
                          Text('0'),
                        ),
                      ],
                    ),
                    const DataRow(
                      // color: MaterialStatePropertyAll(Colors.green),
                      cells: [
                        DataCell(Text('VAT')),
                        DataCell(Text('')),
                        DataCell(
                          Text('0%'),
                        ),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(primaryColor),
                      cells: [
                        const DataCell(Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                        const DataCell(Text('')),
                        DataCell(
                          Text(
                            '''
${cartItems.getTotalPrices() + cartItems.getTotalPrices()}''',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ), */
            ],
          ),
        ),
        bottomNavigationBar:
            // a button for conform order
            SecondayButtonGreen(
          onpress: () async {
            final cartItems = context.read<CartBloc>().state;

            /// check if the items are not empty
            if (cartItems is CartAddingState && cartItems.carts.isEmpty) {
              debugPrint('nice state!');

              // show a snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('আপনার ব্যাগে কোন পণ্য নেই'),
                ),
              );
            } else if (context.read<DropdownForFarmerCubit>().state == null) {
              // show a snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('আপনার কোন কৃষক নির্বাচন করা হয়নি'),
                ),
              );
            } else if (context.read<DropdownForPaymentCubit>().state.isEmpty) {
              // show a snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('আপনার কোন পেমেন্ট পদ্ধতি নির্বাচন করা হয়নি'),
                ),
              );
            } else {
              // all the orders
              final orders = <OrderModel>[];

              /// login state
              final loginState = context.read<LoginBloc>().state;
              // if the login state is success
              if (loginState is LoginSuccess && cartItems is CartAddingState) {
                /// adding all the items to cart
                for (final item in cartItems.carts.entries) {
                  orders.add(
                    OrderModel(
                      product_id: item.value.$1.product_id ?? '',
                      unit: int.parse(item.value.$1.unit_id ?? '0'),
                      quantity: item.value.$2,
                    ),
                  );
                }

                /// showing bottom sheet
                await showModalBottomSheet(
                  backgroundColor: priceBoxColor,
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        ConfirmOrderFutreBldr(
                          token: loginState.successLoginEntity.token,
                          selectedFarmer: selectedFarmer,
                          orders: orders,
                        ),
                        const Spacer(),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () {
                              final loginState =
                                  context.read<LoginBloc>().state;
                              final token = loginState is LoginSuccess
                                  ? loginState.successLoginEntity.token
                                  : null;
                              // goto the order page
                              // context
                              //     .read<OrderBloc>()
                              //     .add(InitOrders(token ?? ''));
                              /// get user profile
                              context
                                  .read<UserProfileBloc>()
                                  .add(GetUserProfileEvent(token: token!));
                                  debugPrint("GetUserProfileEvent in ConformationPage");
                              Navigator.pushAndRemoveUntil(
                                context,
                                HomePage.route(),
                                (route) => false,
                              );

                              // context
                              //     .read<HomeBloc>()
                              //     .add(const ChangePageEvent(2));
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll(tertiaryColor),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(''),
                                Text(
                                  'Track your order',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    );
                  },
                );
              }
            }
          },
          title: 'এই অর্ডার কনফার্ম করুন',
        ),
      ),
    );
  }
}

class ConfirmOrderFutreBldr extends StatelessWidget {
  const ConfirmOrderFutreBldr({
    required this.selectedFarmer,
    required this.orders,
    required this.token,
    super.key,
  });

  final String token;
  final FarmerEntity? selectedFarmer;
  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DeshiFarmerAPI().placeAnOrder(
        token,
        selectedFarmer?.farmer_id ?? '',
        orders,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final value = snapshot.data;
          if (value is Success) {
            // pop this page after 2 seconds
            debugPrint('success response!');
            Future.delayed(
              const Duration(seconds: 2),
              () {
                debugPrint('poping hopping');
                Navigator.pop(context);
              },
            );
            
            context.read<CartBloc>().add(ResetCart());
            return Column(
              children: [
                Center(
                  child: Text(
                    'Congratulations',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                widgetHeight(40),
                FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: null,
                  child: const Icon(
                    Icons.verified,
                    size: 60,
                    // color: Colors.black,
                  ),
                ),
                widgetHeight(40),
                Text(
                  'Order has been placed',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: borderColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            );
          } else {
            return FloatingActionButton(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: null,
              child: const Icon(
                Icons.crop_square_sharp,
                size: 60,
                // color: Colors.black,
              ),
            );
          }
        } else if (snapshot.hasError) {
          return FloatingActionButton(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: null,
            child: const Icon(
              Icons.multiple_stop,
              size: 60,
              // color: Colors.black,
            ),
          );
        }
        return const PrimaryLoadingIndicator();
      },
    );
  }
}
