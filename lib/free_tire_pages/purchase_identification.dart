import 'package:flutter/material.dart';
import 'package:microbiocol/data/purchase_details_data.dart';
import 'package:microbiocol/models/purchase_details_model;.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/utils/responsive.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/remainder_box.dart';

class PurchaseIdentification extends StatelessWidget {
  PurchaseIdentification({super.key});

  final infoBox = InfoBox();

//create the instance for fetch the purchase details
  final PurchaseDetails = PurchaseDetailsData().PurchaseDetailsDataList;

  @override
  Widget build(BuildContext context) {
    //Get the bool value by calling the "smallWidth" method depending on the screen size variation.
    bool responsive = Responsive.smallWidth(context);
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Unlock Counts with Premium",
                    style: TextStyle(
                      fontSize: responsive == true ? 20 : 24,
                      fontWeight: FontWeight.w700,
                      color: mprimaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.close,
                      size: responsive == true ? 20 : 24,
                      color: mprimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              ListView.builder(
                itemCount: PurchaseDetails.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final data = PurchaseDetails[index];

                   return _identificationOption(data, context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

// create the single  identification purchase option
  Widget _identificationOption(
      PurchaseDetailsModel data, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CustommBox(
        width: MediaQuery.of(context).size.width,
        height: 56,
        borderRadius: 8,
        color: mwhiteColor,
        widget: Padding(
          padding: const EdgeInsets.symmetric( vertical: 10,horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${data.count} Counts",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: mprimaryColor,
                ),
              ),
              Text(
                "\$${data.price.toStringAsFixed(0)} ",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: mprimaryColor,
                ),
              ),
            ],
          ),
        ),
        isHasBorder: true,
        isHasBoxShadow: false,
      ),
    );
  }
}
