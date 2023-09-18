import 'package:deshifarmer/presentation/animations/page_animations.dart';
import 'package:deshifarmer/presentation/pages/home/home.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order S7ccessfully Done'),
        leading: IconButton(
          onPressed: () async {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          },
          icon: const Icon(Icons.navigate_before),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Text(
              'Congratulations',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          widgetHeight(40),
          FloatingActionButton(
            backgroundColor: const Color(0xff404040),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () {},
            child: const Icon(CupertinoIcons.xmark),
          ),
          widgetHeight(40),
          Text(
            'Order has been placed',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Spacer(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                overlayColor: const MaterialStatePropertyAll(secondaryColor),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                side: const MaterialStatePropertyAll(
                  BorderSide(
                    color: primaryColor,
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
                      color: primaryColor,
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
          TextButton(
            style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(secondaryColor),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  PageAnimationWrapper.fadeThroughTransitionPageWrapper(
                    const HomePage(),
                  ),
                  (route) => false);
            },
            child: const Text(
              'back to homepage',
              style: TextStyle(
                color: primaryColor,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
