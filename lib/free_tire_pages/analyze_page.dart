import 'package:flutter/material.dart';
import 'package:microbiocol/data/identification_data.dart';
import 'package:microbiocol/models/identification_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/tab_view.dart';

class Analyze extends StatefulWidget {
  final int? index;


  const Analyze({super.key, this.index});



  @override
  State<Analyze> createState() => _AnalyzeState();

  
  
}


class _AnalyzeState extends State<Analyze> {
// fetch the identification details from identification class


@override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(widget.index);
  }

  final identificationData = IdentificationData().IdentificationDataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              TabView(
                leftSideTitle: "Identifications",
                leftSideIcon: Icons.camera_alt_outlined,
                RighttSideTitle: "Counts",
                RightSideimage: "assets/images/count.svg",
              ),
              SizedBox(
                height: 15,
              ),
             if( widget.index == 1)
                ListView.builder(
                      itemCount: identificationData.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        IdentificationModel data = identificationData[index];
        
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ListTile(
                              minVerticalPadding: 10,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              // tileColor: maccentGreenColor,
        
                              visualDensity: VisualDensity(vertical: 2),
                              title: Text(
                                data.title,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: mprimaryColor),
                              ),
                              subtitle: Text(
                                data.dateTime,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: mprimaryColor.withOpacity(0.5)),
                              ),
                              leading: CustommBox(
                                  width: 64,
                                  height: 64,
                                  borderRadius: 64,
                                  color: mwhiteColor,
                                  widget: ClipRRect(
                                    borderRadius: BorderRadius.circular(64),
                                    child: Image.asset(
                                      data.imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  isHasBorder: false)),
                        );
                      },
                    )
                  // : Text(
                  //     "Count Page",
                  //     style: TextStyle(color: mprimaryColor, fontSize: 30),
                  //   )
            ],
          ),
        ),
      ),
    );
  }
}
