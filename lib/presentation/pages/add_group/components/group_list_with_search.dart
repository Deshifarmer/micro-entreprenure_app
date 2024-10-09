import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/group_field_entity.dart';
import 'package:deshifarmer/presentation/animations/page_animations.dart';
import 'package:deshifarmer/presentation/blocs/my_unassign_farmers/my_unassign_famers_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/add_group/view/create_new_group.dart';
import 'package:deshifarmer/presentation/pages/group_detail/bloc/group_detail_bloc.dart';
import 'package:deshifarmer/presentation/pages/group_detail/view/group_detail_page.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

class GroupListsGrid extends StatefulWidget {
  const GroupListsGrid({
    required this.farmers,
    super.key,
  });
  final List<GroupFieldEntity> farmers;

  @override
  State<GroupListsGrid> createState() => _GroupListsGridState();
}

class _GroupListsGridState extends State<GroupListsGrid> {
  final groupNameController = TextEditingController();
  List<GroupFieldEntity> filteredFarmers = [];
  @override
  Widget build(BuildContext context) {
    // final state = context.watch<GetGroupCubit>().state;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            // vertical: 20,
          ),
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: groupNameController,
            onChanged: (value) {
              // filter the farmers
              // widget.farmers
              //     .where(
              //       (element) => element.farmer_group_name
              //           .toLowerCase()
              //           .contains(value.toLowerCase()),
              //     )
              //     .toList();
              filteredFarmers = widget.farmers
                  .where(
                    (element) => element.farmer_group_name
                        .toLowerCase()
                        .contains(value.toLowerCase()),
                  )
                  .toList();
              setState(() {});
            },
            decoration: InputDecoration(
              fillColor: backgroundColor2,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  width: 0,
                  // color: Color(0xffaaaaaa).withOpacity(0.3),

                  // color: Colors.black.withOpacity(0.5),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              labelText: 'গ্রুপের নাম লিখুন',
              labelStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),
              ),
              filled: true,
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        if (groupNameController.text.isNotEmpty && filteredFarmers.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'কোন গ্রুপ পাওয়া যায়নি',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        else if (groupNameController.text.isNotEmpty &&
            filteredFarmers.isNotEmpty)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredFarmers.length,
            itemBuilder: (context, index) {
              final currentFarmer = filteredFarmers.elementAt(index);
              return GestureDetector(
                onTap: () async {
                  final loginState = context.read<LoginBloc>().state;
                  final token = loginState is LoginSuccess
                      ? loginState.successLoginEntity.token
                      : '';

                  // GroupDetailFetchEvent
                  context.read<GroupDetailBloc>().add(
                        GroupDetailFetchEvent(
                          token: token,
                          groupID: currentFarmer.farmer_group_id,
                        ),
                      );
                  await Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (_) => const GroupDetailPage()),
                  );
                },
                child: Card(
                  color: getRandomColor().withOpacity(0.4),
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // group name
                        Text(
                          currentFarmer.farmer_group_name,
                          style: Theme.of(context).textTheme.headlineMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        if (currentFarmer.member_pic.isNotEmpty)
                          FlutterImageStack.widgets(
                            itemRadius: 40,
                            totalCount: currentFarmer.total_farmers,
                            itemBorderWidth: 0,
                            children: [
                              for (final img in currentFarmer.member_pic)
                                CircleAvatar(
                                  backgroundColor: primaryColor2,
                                  foregroundImage: NetworkImage(
                                    checkDomain(
                                      Strings.getServerOrLocal(
                                        ServerOrLocal.server,
                                      ),
                                    )
                                        ? dummyImage
                                        : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/$img',
                                  ),
                                ),
                            ],
                          ),
                        // total farmers
                        Text(
                          '${currentFarmer.total_farmers} জন কৃষক',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // mainAxisExtent: 50,
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.farmers.length + 1,
            itemBuilder: (context, index) {
              // print('index -> $index , length -> ${state.farmers.length}');
              if (index == widget.farmers.length) {
                return GestureDetector(
                  onTap: () async {
                    final loginState = context.read<LoginBloc>().state;
                    final token = loginState is LoginSuccess
                        ? loginState.successLoginEntity.token
                        : '';
                    // MyUnassignFamersBloc
                    context
                        .read<MyUnassignFamersBloc>()
                        .add(MyUnassignFarmerFetchEvent(token));
                    await Navigator.push(
                      context,
                      PageAnimationWrapper.sharedAxisTransitionPageWrapper(
                        const CreateGroupForm(),
                      ),
                    );
                  },
                  child: Card(
                    color: const Color(0xffd9d9d9),
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DottedBorder(
                            borderType: BorderType.Circle,
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.add,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(30),
                          ),
                          Text(
                            'Create new group',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              // if (index + 1 == state.farmers.length) {

              // }
              final currentFarmer = widget.farmers.elementAt(index);
              return GestureDetector(
                onTap: () async {
                  final loginState = context.read<LoginBloc>().state;
                  final token = loginState is LoginSuccess
                      ? loginState.successLoginEntity.token
                      : '';

                  // GroupDetailFetchEvent
                  context.read<GroupDetailBloc>().add(
                        GroupDetailFetchEvent(
                          token: token,
                          groupID: currentFarmer.farmer_group_id,
                        ),
                      );
                  await Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (_) => const GroupDetailPage()),
                  );
                },
                child: Card(
                  color: getRandomColor().withOpacity(0.4),
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // group name
                        Text(
                          currentFarmer.farmer_group_name,
                          style: Theme.of(context).textTheme.headlineMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        if (currentFarmer.member_pic.isNotEmpty)
                          FlutterImageStack.widgets(
                            itemRadius: 40,
                            totalCount: currentFarmer.total_farmers,
                            itemBorderWidth: 0,
                            children: [
                              for (final img in currentFarmer.member_pic)
                                CircleAvatar(
                                  backgroundColor: primaryColor2,
                                  foregroundImage: NetworkImage(
                                    checkDomain(
                                      Strings.getServerOrLocal(
                                        ServerOrLocal.server,
                                      ),
                                    )
                                        ? dummyImage
                                        : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/$img',
                                  ),
                                ),
                            ],
                          ),
                        // total farmers
                        Text(
                          '${currentFarmer.total_farmers} জন কৃষক',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // mainAxisExtent: 50,
            ),
          ),
      ],
    );
  }
}
