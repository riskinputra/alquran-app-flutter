import 'package:alquran/app/constants/color.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.isDark.value = Get.isDarkMode;
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
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                          child: Text(
                            "Tidak ada data",
                            style: TextStyle(
                                color: controller.isDark.isTrue
                                    ? appWhite
                                    : appPurpleDark1),
                          ),
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
                                leading: Obx(() => Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(controller
                                                      .isDark.isTrue
                                                  ? "assets/images/octa-dark.png"
                                                  : "assets/images/octa-light.png"))),
                                      child: Center(
                                          child: Text(
                                        "${surah.number}",
                                      )),
                                    )),
                                title: Text(
                                    "${surah.name?.transliteration?.id ?? '-'}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                  "(${surah.name?.translation?.id ?? '-'}) | ${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? '-'}",
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                                trailing: Text("${surah.name?.short ?? '-'}"));
                          });
                    }),
                ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      // Surah surah = snapshot.data![index];

                      return ListTile(
                        onTap: () {},
                        leading: Obx(() => Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(controller.isDark.isTrue
                                          ? "assets/images/octa-dark.png"
                                          : "assets/images/octa-light.png"))),
                              child: Center(
                                  child: Text(
                                "${index + 1}",
                              )),
                            )),
                        title: Text("Juz ${index + 1}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      );
                    }),
                Text('data')
              ]))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.isDarkMode
              ? Get.changeTheme(themeLight)
              : Get.changeTheme(themeDark);
          controller.isDark.toggle();
        },
        child: Icon(
          Icons.color_lens,
        ),
      ),
    );
  }
}
