import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';

@override
Widget customBottomSheet(
  BuildContext context,
  Widget? widget, {
  double height = 185,
  required String title,
  required String buttonText,
  Color buttonColor = Colors.white,
  bool isHasBorder = true,
  ishasCalander = false,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      border: Border(
        top: BorderSide(
          color: mBlack.withOpacity(0.15),
          width: 1,
        ),
      ),
      boxShadow: [
        BoxShadow(
            color: mtextColor.withOpacity(0.15),
            offset: const Offset(0, 2),
            blurRadius: 20,
            spreadRadius: 4),
      ],
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: mBlack,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: mBlack
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ishasCalander
              ? SizedBox(
                  height: height - 83,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    controller: ScrollController(),
                    children: [
                      Column(
                        children: [
                          widget ??
                              const SizedBox(
                                height: 20,
                              ),
                       
                        ],
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    widget ??
                        const SizedBox(
                          height: 20,
                        ),
                
                  ],
                ),
        ],
      ),
    ),
  );
}
