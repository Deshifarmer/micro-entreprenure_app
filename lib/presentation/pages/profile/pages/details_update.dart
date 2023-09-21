import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class ProfileUpdatePage extends StatelessWidget {
  const ProfileUpdatePage({
    required this.fullName,
    required this.farmerID,
    required this.farmerPhoto,
    super.key,
  });

  final String? fullName;
  final String? farmerID;
  final String? farmerPhoto;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Hero(
            tag: 'userProfilePIC',
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  checkDomain(Strings.getServerOrLocal(ServerOrLocal.server))
                      ? dummyImage
                      : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/$farmerPhoto',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              fullName ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          /// code
          Text(
            '#$farmerID',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          Container(
            padding: const EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(20),
            ),
            decoration: BoxDecoration(
              color: tertiaryColor2,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 40,
            // width: getProportionateScreenWidth(60),
            width: MediaQuery.sizeOf(context).width / 1.2,
            child: const Row(
              children: [
                CircleAvatar(
                  backgroundColor: priceBoxColor,
                  // radius: 30,
                  child: Icon(Icons.check, size: 15),
                ),
                Expanded(
                  child: Text(
                    'সকল তথ্য আপ টু ডেট রয়েছে ',
                    // 'No information update is required at this moment',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                // fillColor: backgroundColor2,
                hintText: 'নাম',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide.none,
                ),

                contentPadding: EdgeInsets.symmetric(
                  // vertical: 20,
                  horizontal: 15,
                ),
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                // fillColor: backgroundColor2,
                hintText: 'ঠিকানা',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  // vertical: 20,
                  horizontal: 15,
                ),
                filled: true,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                // fillColor: backgroundColor2,
                hintText: 'জাতীয় পরিচয়পত্র নম্বর',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  // vertical: 20,
                  horizontal: 15,
                ),
                filled: true,
              ),
            ),
          ),

          // Text('আমরা আপনাকে কীভাবে সাহায্য করতে পারি  ?'),
        ],
      ),
      bottomNavigationBar: SecondayButtonGreen(
        onpress: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: priceBoxColor,
              content: const Text('This is Under progress'),
              action: SnackBarAction(label: 'Okay', onPressed: () {}),
            ),
          );
        },
        title: 'Update My Detail',
      ),
    );
  }
}
