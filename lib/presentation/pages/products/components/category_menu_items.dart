import 'package:deshifarmer/domain/entities/category_entity/category_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/products/bloc/products_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:deshifarmer/services/blocs/category/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CategoryMenuItems extends StatelessWidget {
  const CategoryMenuItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productState = context.read<ProductsBloc>().state;
    return BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
      if (state is CategoryFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar('ক্যাটাগরি লোড করা যায়নি!'),
        );
      }
    }, builder: (context, state) {
      if (state is CategoryLoading) {
        // return const CircularProgressIndicator(
        //   color: primaryColor,
        // );
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 0.6,
              // strokeAlign: 0.6,
              color: Colors.grey,
            ),
          ),
          child: Icon(
            Icons.menu,
            color: Colors.black.withOpacity(0.5),
          ),
        )
            .animate(
              onPlay: (controller) => controller.repeat(reverse: true),
            )
            .shimmer(
              color: Colors.grey,
            );
      } else if (state is CategorySuccess) {
        ///! PERF: categories
        return PopupMenuButton<CategoryEntity>(
          padding: EdgeInsets.zero,
          // surfaceTintColor: primaryColor,
          onSelected: (CategoryEntity value) {
            // debugPrint('cat -> ${value.title} ${value.id}');
            if (productState is ProductComanySelect) {
              // context.read<ProductsBloc>().add(
              //       SelectCompanysEvent(
              //         productState.companyID,
              //         category: value.id.toString(),
              //         query: productState.query,
              //       ),
              //     );
              ///! PERF: check if any company is selected
              debugPrint(
                'is any company selected: -> ${productState.companyID}',
              );
              final loginState = context.read<LoginBloc>().state;
              if (productState.companyID != null) {
                if (loginState is LoginSuccess) {
                  
                  // context.read<ProductsBBloc>().add(
                  //       ProductSearchEvent(
                  //         loginState.successLoginEntity.token,
                  //         cat: value.id.toString(),
                  //         company: productState.companyID,
                  //         query: productState.query,
                  //       ),
                  //     );
                }
              } else {
                /// COMPOANY IS NOT SELECTED
                
                if (loginState is LoginSuccess) {
                  // context.read<ProductsBBloc>().add(
                  //       ProductSearchEvent(
                  //         loginState.successLoginEntity.token,
                  //         cat: value.id.toString(),
                  //         // company: null,
                  //         query: productState.query,
                  //       ),
                  //     );
                }
              }

              // debugPrint('category -> ${productState.category}');
              // debugPrint('query -> ${productState.query}');
              // debugPrint('company -> ${productState.companyID}');
            } else {
              
              // context.read<ProductsBloc>().add(
              //       SelectCompanysEvent(
              //         null,
              //         category: value.id.toString(),
              //         query: null,
              //       ),
              //     );

              // if (loginState is LoginSuccess) {
              //   context.read<ProductsBBloc>().add(
              //         ProductSearchEvent(
              //           loginState.successLoginEntity.token,
              //           cat: value.id.toString(),
              //           // query: null,
              //           // company: null,
              //         ),
              //       );
              // }
            }
          },
          enableFeedback: true,
          surfaceTintColor: backgroundColor2,
          itemBuilder: (BuildContext context) =>
              state.allCategoryListResp.category
                  .map(
                    (CategoryEntity e) => PopupMenuItem<CategoryEntity>(
                      value: e,
                      child: Text(e.title.split('-').last),
                    ),
                  )
                  .toList(),
          color: backgroundColor2,
          icon: Container(
            // margin: EdgeInsets.all(0),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                width: 0.6,
                // strokeAlign: 0.6,
                color: Colors.grey,
              ),
            ),
            child: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    },);
  }
}
