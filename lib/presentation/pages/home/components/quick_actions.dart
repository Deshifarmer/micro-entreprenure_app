import 'package:deshifarmer/core/params/home_page_params.dart';
import 'package:deshifarmer/presentation/widgets/home_page_icon_widget.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: getProportionateScreenHeight(280),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(
              20,
            ),
          ),
          child: PageView.builder(
            itemCount: 2,
            itemBuilder: (context, int lindex) {
              if (lindex == 0) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: getProportionateScreenHeight(120),
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    final currentIcon =
                        HomePageParams.homePageIconDatas1st.elementAt(index);
                    return InkWell(
                      onTap: () {
                        print('tapped on $index');
                      },
                      child: HomePageIconWidget(
                        title: currentIcon.title,
                        painter: currentIcon.painter,
                        icon: currentIcon.icon,
                      ),
                    );
                  },
                );
              } else {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: getProportionateScreenHeight(120),
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    final currentIcon =
                        HomePageParams.homePageIconDatas2nd.elementAt(index);
                    return InkWell(
                      onTap: () {
                        // print('tapped on $index');
                      },
                      child: HomePageIconWidget(
                        title: currentIcon.title,
                        painter: currentIcon.painter,
                        icon: currentIcon.icon,
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
