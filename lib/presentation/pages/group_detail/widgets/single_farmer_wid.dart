import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/group_farmer_entity.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

class SingleFarmerCard extends StatefulWidget {
  const SingleFarmerCard({
    required this.image,
    // required this.title,
    // required this.phone,
    required this.gfe,
    super.key,
  });

  // final String title;
  final String image;
  // final String phone;
  final GroupFarmerEntity? gfe;

  @override
  State<SingleFarmerCard> createState() => _SingleFarmerCardState();
}

class _SingleFarmerCardState extends State<SingleFarmerCard> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        if (!isTapped) {
          setState(() {
            isTapped = !isTapped;
          });
          showBottomSheet(
            context: context,
            backgroundColor: backgroundColor2,
            builder: (context) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.55,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          checkDomain(
                            Strings.getServerOrLocal(
                              ServerOrLocal.server,
                            ),
                          )
                              ? dummyImage
                              : widget.image,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Text(
                      '#${widget.gfe?.farmer_id}',
                      style: textTheme.bodySmall,
                    ),
                    Text(
                      widget.gfe?.full_name ?? '',
                      style: textTheme.titleMedium,
                    ),
                    Card(
                      elevation: 0,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('ফোন নম্বর'),
                                  Text(widget.gfe?.phone ?? ''),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('গ্রাম'),
                                  Text(widget.gfe?.village ?? ''),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('ঠিকানা'),
                                  Text(widget.gfe?.address ?? ''),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('জন্ম তারিখ'),
                                  Text(widget.gfe?.date_of_birth ?? ''),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('জেলা'),
                                  Text(widget.gfe?.district ?? ''),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('লিঙ্গ'),
                                  Text(widget.gfe?.gender ?? ''),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ).closed.then((value) {
            setState(() {
              isTapped = !isTapped;
            });
          });
        }
        // show a bottom sheet about the farmer
        // showBottomSheet(context: context, builder: builder);
      },
      child: isTapped
          ? Card(
              elevation: 0,
              child: newMethod(),
            )
          : Container(
              margin: const EdgeInsets.all(4),
              child: newMethod(),
            ),
    );
  }

  Column newMethod() {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 25,
            backgroundImage: NetworkImage(
              checkDomain(
                Strings.getServerOrLocal(
                  ServerOrLocal.server,
                ),
              )
                  ? dummyImage
                  : widget.image,
            ),
          ),
        ),
        Text(
          widget.gfe?.full_name ?? '',
          textAlign: TextAlign.center,
          style: textTheme.titleSmall,
        ),
        Text(
          widget.gfe?.phone ?? '',
          textAlign: TextAlign.center,
          style: textTheme.labelSmall!.copyWith(
            color: const Color(0xff3e3e3e),
          ),
        ),
      ],
    );
  }
}
