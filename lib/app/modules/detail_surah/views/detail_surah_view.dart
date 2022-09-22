import 'package:alquran/app/constants/color.dart';
import 'package:alquran/app/data/models/detail_surah.dart' as detail;
import 'package:alquran/app/data/models/surah.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  final Surah surah = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'SURAH ${surah.name?.transliteration?.id?.toUpperCase() ?? '-'}'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            GestureDetector(
              onTap: (() => Get.dialog(Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Get.isDarkMode
                              ? appPurpleLight2.withOpacity(0.3)
                              : appWhite),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Tafsir ${surah.name?.transliteration?.id ?? '-'}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${surah.tafsir?.id ?? 'Tidak ada tafsir pada surah ini.'}",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                  ))),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [appPurpleLight1, appPurpleDark1])),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "${surah.name?.transliteration?.id?.toUpperCase() ?? '-'}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: appWhite),
                      ),
                      Text(
                        "( ${surah.name?.translation?.id?.toUpperCase() ?? '-'} )",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: appWhite),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${surah.numberOfVerses ?? '-'} | ${surah.revelation?.id ?? '-'}",
                        style: TextStyle(fontSize: 16, color: appWhite),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder<detail.DetailSurah>(
                future: controller.getDetailSurah(surah.number.toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("Tidak ada data"),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.verses?.length ?? 0,
                    itemBuilder: (context, index) {
                      if (snapshot.data?.verses?.length == 0) {
                        return SizedBox();
                      }
                      detail.Verse? ayat = snapshot.data?.verses?[index];
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: appPurpleLight2.withOpacity(0.3)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(Get.isDarkMode
                                                  ? "assets/images/octa-dark.png"
                                                  : "assets/images/octa-light.png"),
                                              fit: BoxFit.contain)),
                                      child: Center(
                                          child: Text(
                                        "${index + 1}",
                                      )),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                                Icons.bookmark_add_outlined)),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.play_arrow))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${ayat!.text?.arab}",
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${ayat.text?.transliteration?.en}",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 16, fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${ayat.translation?.id}",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ]);
                    },
                  );
                })
          ],
        ));
  }
}
