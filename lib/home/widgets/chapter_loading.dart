import 'package:flutter/material.dart';

Widget chapterLoading(BuildContext context, Widget circularProgressIndicator) {
  return ListView.builder(
      padding: const EdgeInsets.only(
          left: 18.0, right: 18.0, bottom: 40.0, top: 60.0),
      itemCount: 10,
      itemBuilder: (context, index) => Row(
            children: [
              circularProgressIndicator,
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                alignment: Alignment.topRight,
                height: 85,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF758BEB).withOpacity(.08),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: const Color(0XFFA7BAFF).withOpacity(.2),
                      borderRadius: BorderRadius.circular(12.0)),
                ),
              ))
            ],
          ),);
}
