import 'package:deshifarmer/data/models/order_model.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';

import 'package:deshifarmer/presentation/pages/cartz/pages/conformation_fbld.dart';
import 'package:deshifarmer/presentation/pages/cartz/widgets/card_cart3.dart';
import 'package:deshifarmer/presentation/pages/home/home.dart';
import 'package:deshifarmer/presentation/pages/login/login.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/services/blocs/cart/cart_bloc.dart';
import 'package:deshifarmer/services/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/services/cubit/dropdown/dropdown_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderConformationPage extends StatefulWidget {
  const OrderConformationPage({
    required this.selectedFarmer,
    super.key,
  });

  final FarmerEntity selectedFarmer;

  @override
  State<OrderConformationPage> createState() => _OrderConformationPageState();
}

class _OrderConformationPageState extends State<OrderConformationPage> {
  @override
  Widget build(BuildContext context) {
    const isOrdered = false;
    final userProfile = context.read<UserProfileBloc>().state;

    /// power
    // final selectedFarmer = context.read<DropdownForFarmerCubit>().state;

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
                    ],
                  ),
                ),
              ),

              ///! farmer info
              // if (context.read<DropdownForFarmerCubit>().state != null)

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
                              '${widget.selectedFarmer.full_name}',
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
                              '${widget.selectedFarmer.phone}',
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
                              '${widget.selectedFarmer.address}',
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
                BlocConsumer<CartBloc, CartState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is CartAddingState) {
                      return Card(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              Text(
                'পেমেন্ট মেথড “${context.read<DropdownForPaymentCubit>().state}”',
              ),
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
                          selectedFarmer: widget.selectedFarmer,
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
                              debugPrint(
                                  'GetUserProfileEvent in ConformationPage',);
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
