import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DawahPage extends StatelessWidget {
  const DawahPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Daily Da`wah'),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Colors.grey[100],
                width: double.infinity,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        width: MediaQuery.of(context).size.width * .3,
                        image: AssetImage('assets/icons/005-muslim-2.png'),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          'Apakah Syariat Cadar Bertentangan dengan Perintah untuk Saling Mengenal?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff3d3d3d),
                          ),
                          maxLines: 4,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 30,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Color(0xffFFA64D),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
                    child: Text(
                      'Daily Da`wah',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('''Mereka Membuat Syubhat Tentang Cadar
Sebagian orang merancukan perintah untuk saling mengenal dalam Al Qur’an, dengan perintah untuk menutup wajah bagi kaum Muslimah. Mari kita ulas secara singkat masalah ini. Allah Ta’ala berfirman:

يَا أَيُّهَا النَّاسُ إِنَّا خَلَقْنَاكُمْ مِنْ ذَكَرٍ وَأُنْثَى وَجَعَلْنَاكُمْ شُعُوبًا وَقَبَائِلَ لِتَعَارَفُوا إِنَّ أَكْرَمَكُمْ عِنْدَ اللَّهِ أَتْقَاكُمْ إِنَّ اللَّهَ عَلِيمٌ خَبِيرٌ

“Hai manusia, sesungguhnya Kami menciptakan kamu dari seorang laki-laki dan seorang perempuan dan menjadikan kamu berbangsa-bangsa dan bersuku-suku supaya kamu saling kenal-mengenal. Sesungguhnya orang yang paling mulia diantara kamu disisi Allah ialah orang yang paling takwa diantara kamu. Sesungguhnya Allah Maha Mengetahui lagi Maha Mengenal” (QS. Al Hujurat: 13).

Maksud ayat ini, Allah Ta’ala menjadikan manusia dalam berbagai jenis, suku dan kabilah, agar mereka saling mengenal antara sesama kabilah dan dari adanya saling mengenal itu mereka mengetahui tidak ada kabilah yang lebih utama dari yang lain. Karena keutamaan itu dinilai dengan ketaqwaan.

Baca Juga: Benarkah Cadar Budaya Arab?

Penjelasan Ayat Perintah Saling Mengenal
Ath Thabari rahimahullah dalam Tafsir-nya menjelaskan:

يقول تعالى ذكره: إنما جعلنا هذه الشعوب والقبائل لكم أيها الناس, ليعرف بعضكم بعضا في قرب القرابة منه وبعده, لا لفضيلة لكم في ذلك, وقُربة تقرّبكم إلى الله, بل أكرمكم عند الله أتقاكم

“Allah Ta’ala berfirman dalam ayat ini dengan mengatakan bahwa Kami menjadikan manusia bersuku-suku dan kabilah-kabilah agar mereka saling mengenal dan mengetahui kekerabatan di antara mereka. Bukan untuk meninggikan satu suku di antara yang lain. Namun yang bisa mendekatkan diri mereka kepada Allah adalah qurbah (ibadah), bahkan yang membuat kalian mulia di sisi Allah adalah ketaqwaan”.

Dalam Tafsir Jalalain dijelaskan:

ليعرف بعضكم بعضا لا لتفاخروا بعلو النسب وإنما الفخر بالتقوى

“Agar kalian saling mengenal satu sama lain, bukan untuk saling berbangga dengan kemuliaan nasab. Karena kemuliaan ini dengan ketaqwaan”.

Ayat ini juga dalil disyariatkannya menjaga nasab dan mempelajari nasab. As Sa’di rahimahullah dalam Taisir Kariimirrahman mengatakan:

وفي هذه الآية دليل على أن معرفة الأنساب، مطلوبة مشروعة، لأن الله جعلهم شعوبًا وقبائل، لأجل ذلك

“Ayat ini juga dalil bahwa mempelajari nasab itu disyariatkan. Karena Allah jadikan manusia bersuku-suku dan kabilah-kabilah agar dipelajari nasabnya”.

Demikian juga penjelasan Ath Thabari dalam Tafsir-nya:

ليعرف بعضكم بعضا في النسب

“… agar kalian saling mengenal nasab satu sama lain”.

Baca Juga: Adab-Adab Berpakaian Bagi Muslim Dan Muslimah

Faedah dari Ayat Perintah Saling Mengenal
Maka faedah dari ayat ini adalah:

Kita diperintahkan untuk saling mengetahui antara sesama suku dan kabilah
Kita diperintahkan untuk mengetahui nasab-nasab
Bukan maknanya kita diperintahkan untuk berkenalan dengan semua orang yang kita temui.

Maka ayat ini bukan dalil yang menentang disyariatkannya menutup wajah bagi wanita. Juga ayat ini bukan perintah kepada wanita untuk membuka wajah dan saling berpandang-pandangan dengan lawan jenis. Justru saling berpandang-pandangan dengan lawan jenis itu dilarang dalam Al Qur’an. Allah Ta’ala berfirman:

قُلْ لِلْمُؤْمِنِينَ يَغُضُّوا مِنْ أَبْصَارِهِمْ وَيَحْفَظُوا فُرُوجَهُمْ ذَلِكَ أَزْكَى لَهُمْ إِنَّ اللَّهَ خَبِيرٌ بِمَا يَصْنَعُونَ

“Katakanlah kepada orang laki-laki yang beriman: “Hendaklah mereka menundukkan pandangannya, dan memelihara kemaluannya; yang demikian itu adalah lebih suci bagi mereka, sesungguhnya Allah Maha Mengetahui apa yang mereka perbuat” (QS. An Nur: 30).

وَقُلْ لِلْمُؤْمِنَاتِ يَغْضُضْنَ مِنْ أَبْصَارِهِنَّ وَيَحْفَظْنَ فُرُوجَهُنَّ

“Katakanlah kepada wanita yang beriman: Hendaklah mereka menahan pandangannya, dan memelihara kemaluannya” (QS. An Nuur: 31)

Baca Juga: Bagaimana Berinteraksi Dengan Non Muslim?

Cadar Tidak Menghalangi untuk Saling Mengenal
Selain itu, andaikan kita ingin maknai ayat di atas sebagai perintah untuk saling berkenalan dengan setiap orang yang kita temui, maka tidak ada masalah antara berkenalan dengan tertutupnya wajah wanita. Orang bisa berkenalan walaupun tertutup wajah dengan cara komunikasi yang lain.

Terakhir, dahulu para sahabiyah menutup wajahnya, seluruh istri Nabi menutup wajahnya. Dan Rasulullah shallallahu ’alaihi wasallam tidak melarang mereka. Karena demikianlah pemahaman yang diajarkan beliau kepada para sahabiyah tersebut, berdasarkan ayat Al Qur’an juga:

يَا أَيُّهَا النَّبِيُّ قُلْ لِأَزْوَاجِكَ وَبَنَاتِكَ وَنِسَاءِ الْمُؤْمِنِينَ يُدْنِينَ عَلَيْهِنَّ مِنْ جَلَابِيبِهِنَّ ذَلِكَ أَدْنَى أَنْ يُعْرَفْنَ فَلَا يُؤْذَيْنَ وَكَانَ اللَّهُ غَفُورًا رَحِيمًا

“Hai Nabi katakanlah kepada istri-istrimu, anak-anak perempuanmu dan istri-istri orang mukmin: Hendaklah mereka mengulurkan jilbabnya ke seluruh tubuh mereka. Yang demikian itu supaya mereka lebih mudah untuk dikenal, karena itu mereka tidak diganggu. Dan Allah adalah Maha pengampun lagi Maha penyayang.” (QS. Al Ahzab: 59).

Imam Ath Thabari rahimahullah menjelaskan:

ثم اختلف أهل التأويل في صفة الإدناء الذي أمرهن الله به فقال بعضهم: هو أن يغطين وجوههن ورءوسهن فلا يبدين منهن إلا عينا واحدة

“Para ulama tafsir khilaf mengenai sifat menjulurkan jilbab yang diperintahkan Allah dalam ayat ini. Sebagian mereka mengatakan: yaitu dengan menutup wajah-wajah mereka dan kepala-kepala mereka, dan tidak ditampakkan apa-apa kecuali hanya satu mata saja” (Tafsir At Thabari, 20/324).

Maka siapakah yang paling paham surat Al Hujurat ayat 13? Apakah mereka para penolak syariat cadar ataukah Rasulullah Shallallahu’alaihi Wasallam? Beliau Shallallahu’alaihi Wasallam yang menyampaikan kepada kita wahyu Allah dalam Al Hujurat ayat 13, demikian juga beliau yang menyampaikan kepada kita  wahyu Allah dalam Al Ahzab ayat 59. Mari kita imani semua, tidak mengimani sebagian ayat dan meninggalkan sebagian ayat.



Simak selengkapnya disini. Klik https://muslim.or.id/52655-syariat-cadar.html''',
                style: TextStyle(fontSize: 18.0, height: 1.5)),
          ),
        ],
      ),
    );
  }
}
