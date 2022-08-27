import 'package:alquran/app/constants/color.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Al Quran Apps'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.SEARCH),
              icon: Icon(Icons.search))
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assalamualaikum',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [appPurpleLight1, appPurpleDark1])),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => Get.toNamed(Routes.LAST_READ),
                    child: Container(
                        child: Stack(
                      children: [
                        Positioned(
                            bottom: -20,
                            right: -20,
                            child: Opacity(
                              opacity: 0.7,
                              child: Container(
                                  width: 150,
                                  height: 150,
                                  child: Image.asset(
                                    "assets/images/quran.png",
                                    fit: BoxFit.contain,
                                  )),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.menu_open_rounded,
                                      color: appWhite,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Terakhir dibaca",
                                      style: TextStyle(color: appWhite),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Al - Fatihah",
                                  style:
                                      TextStyle(color: appWhite, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Juz 1 | Ayat 5",
                                  style: TextStyle(color: appWhite),
                                )
                              ]),
                        )
                      ],
                    )),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TabBar(
                  indicatorColor: appPurpleDark1,
                  labelColor: appPurpleDark1,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(text: 'Surah'),
                    Tab(text: 'Juz'),
                    Tab(text: 'Bookmark')
                  ]),
              Expanded(
                  child: TabBarView(children: [
                FutureBuilder<List<Surah>>(
                    future: controller.getAllSurah(),
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
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Surah surah = snapshot.data![index];

                            return ListTile(
                                onTap: () => {
                                      Get.toNamed(Routes.DETAIL_SURAH,
                                          arguments: surah)
                                    },
                                leading: CircleAvatar(
                                  child: Text("${surah.number}"),
                                ),
                                title: Text(
                                    "${surah.name?.transliteration?.id ?? '-'}"),
                                subtitle: Text(
                                    "(${surah.name?.translation?.id ?? '-'}) | ${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? '-'}"),
                                trailing: Text("${surah.name?.short ?? '-'}"));
                          });
                    }),
                Text('data'),
                Text('data')
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
