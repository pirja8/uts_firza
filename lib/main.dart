import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'zodiac_provider.dart';
import 'zodiac_result_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ZodiacProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ZodiacFormPage(),
      ),
    );
  }
}

class ZodiacFormPage extends StatefulWidget {
  @override
  _ZodiacFormPageState createState() => _ZodiacFormPageState();
}

class _ZodiacFormPageState extends State<ZodiacFormPage> {
  final nameController = TextEditingController();
  DateTime? selectedDate;

  final Map<String, String> zodiacData = {
    "Capricorn": "Orang yang lahir pada tanggal antara 21 Desember sampai 19 Januari berada di bawah pengaruh zodiak Capricorn, yang berlambang kambing. Orang yang berzodiak Capricorn mengutamakan kesuksesan, status, posisi, reputasi, loyalitas, konsentrasi, pemecahan masalah, bertanggung jawab, memperlihatkan kebijaksanaan, dan keseriusan belajar melalui pengalaman. Namun, ada kalanya orang berzodiak Capricorn cenderung bersikap memandang buruk (pesimis), selalu terpaksa, membebani, takut menghadapi hambatan, memperlihatkan batasan, kurang simpati, terlalu khawatir, dan pemikiran sempit. Capricorn termasuk dalam kategori kardinal, yaitu aktif. Dengan kualitas ini Anda dianggap baik untuk memulai setiap proyek baru. Lambang-lambang yang termasuk dalam kategori kardinal selain Capricorn adalah Aries, Cancer dan Libra.",
    "Aquarius": "Orang yang lahir pada tanggal antara 20 Januari sampai 18 Februari berada di bawah pengaruh zodiak Aquarius, yang berlambang gelombang (alur air). Orang Aquarius tertarik dengan petualangan, berjiwa kemanusiaan, ingin tahu, ada semangat berontak, bersikap spontan, progresif, persahabatan, hak asasi, kelompok, dan mampu memberi manfaat untuk sekitar. Namun, ada kalanya Aquarius menghadapi gangguan, tak bisa diharapkan, suka membantah, memberontak, tak lengkap, perilaku salah, tak konsisten, perangai radikal, kurang metode, dan mendatangkan bencana. Aquarius termasuk dalam kategori tetap, yaitu termasuk stabilitas, ketabahan, ketahanan, dan kesempurnaan. Dengan kualitas ini Aquarius baik untuk memastikan sesuatu berjalan lancar atau berhasil. Lambang yang termasuk dalam kategori tetap selain Aquarius adalah Taurus, Leo dan Scorpio.",
    "Pisces": "Orang yang lahir antara tanggal 19 Februari sampai 20 Maret dikatakan bernaung di bawah zodiak Pisces, yang berlambang ikan. Pisces mengutamakan cinta universal, bersifat manja, selalu mencari ilham, memperlihatkan kepercayaan, ada kesepahaman, berjiwa puitis, menyukai musik, beragama, bersifat setia, mampu menghibur diri, mengutamakan kerohanian, dan tidak mudah mengaku kalah. Namun, ada kalanya Pisces merasa bingung, bersalah, mudah mengaku kalah, mudah kecewa, khawatir, risau, terlibat dalam penipuan, ketagihan, dan mudah menurut kemauan hati. Pisces termasuk dalam kategori variabel, yaitu mudah mengalami daya perubahan, daya adaptasi dan daya keseimbangan. Dengan kategori variabel ini, Pisces adalah kreatif meskipun tidak selalu praktis. Lambang-lambang yang termasuk dalam kategori fleksibel selain Pisces adalah Gemini, Virgo dan Sagitarius.",
    "Aries": "Orang yang lahir pada tanggal antara 21 Maret sampai 20 April dikatakan bernaung di bawah zodiak Aries, yang berlambang Biri-biri jantan. Dengan demikian, Aries seorang yang berani, yakin, inisiatif, mengutamakan tindakan, ada pertahanan diri, ada rasa merintis, ada daya juang, dan pencinta memperjuangkan nasib. Namun, ada kalanya Aries ini terlalu pemikir, ada kekasaran, kesombongan diri, gemar memicu permusuhan, agresif, hasil kerja tak sempurna, dan ada kelemahan. Aries termasuk dalam kategori kardinal, yaitu aktif. Dengan kualitas ini Aries dianggap baik untuk memulai setiap proyek baru. Lambang-lambang yang termasuk dalam kategori kardinal selain Aries adalah Capricorn, Cancer dan Libra.",
    "Taurus": "Orang yang lahir pada tanggal antara 21 April sampai 20 Mei dikatakan bernaung di bawah zodiak Taurus, yang berlambang Lembu Jantan. Dengan demikian, Taurus mengutamakan kekayaan, ketinggian spiritual, kaut daya rasa, loyalitas, gemar berpelesiran, kesuburan, terlalu praktis, murah rezeki dan ketabahan. Walau bagaimana pun, ada kalanya Taurus bersikap terlalu kebendaan, terlalu mengekang, keras hati, suka menurut rasa hati dan buntu pikiran. Taurus termasuk dalam kategori tetap, yaitu termasuk stabilitas, daya ketabahan, daya tahan, dan daya kesempurnaan. Dengan kualitas ini Taurus baik untuk memastikan sesuatu berjalan lancar atau berhasil. Lambang-lambang yang termasuk dalam kategori tetap selain Taurus adalah Aquarius, Leo dan Scorpio.",
    "Gemini": "Orang yang lahir pada tanggal antara 21 Mei sampai 20 Juni dikatakan bernaung di bawah zodiak Gemini, yang berlambang Saudara Kembar. Dengan demikian, Gemini terampil berkomunikasi, suka bepergian, serbaguna, cerdas, ada kekuatan berbicara, mampu menulis, kedekatan pada sanak saudara dan tetangga, gemar migrasi, dan bersikap terbuka. Namun, ada kalanya Gemini bersikap hanya suka sekejap saja, bersikap keanak-anakan, gugup, suka bermuka dua, berbicara kosong, tak lengkap dan suka berpura-pura. Gemini termasuk dalam kategori variabel, yaitu mudah mengalami daya perubahan, daya adaptasi dan daya keseimbangan. Dengan kategori variabel ini, Gemini adalah kreatif meskipun tidak selalu praktis. Lambang-lambang yang termasuk dalam kategori bervariasi selain Gemini adalah Pisces, Virgo dan Sagitarius.",
    "Cancer": "Orang yang lahir pada tanggal antara 21 Juni sampai 20 Juli dikatakan bernaung di bawah zodiak Cancer, yang berlambang Kepiting. Dengan demikian, Cancer menyukai rumah tangga, keluarga, kesehatan, makanan, ada rasa simpati, memberi perlindungan, agak sensitif, punya kesabaran, kejujuran, dan kecerdasan. Namun, ada kalanya Cancer bersikap kekanak-kanakan, berbolak-balik, berpura-pura, tidak aman, terlalu bertahan dan takut pada perpisahan. Cancer termasuk dalam kategori kardinal, yaitu aktif. Dengan kualitas ini Cancer dianggap baik untuk memulai setiap proyek baru. Lambang-lambang yang termasuk dalam kategori kardinal selain Cancer adalah Aries, Capricorn dan Libra.",
    "Leo": "Orang yang lahir pada tanggal antara 21 Juli sampai 21 Agustus dikatakan bernaung di bawah zodiak Leo, yang berlambang Singa. Anda mengutamakan rasa cinta, ramah, bersifat pemurah, ada daya kepemimpinan, menonjolkan kemegahan, selalu hidup, menyoroti keagungan, keberanian, kemampuan, dekat dengan anak-anak, berbakat dan suka pada hiburan. Walau bagaimana pun, ada kalanya Leo ini kerap menunjukkan ego, banyak bicara, memperlihatkan sifat kekuasaan, suka pamer, mengejar kemewahan, dan memenuhi komplek rendah diri dan bangga diri. Leo termasuk dalam kategori tetap, yaitu termasuk stabilitas, ketabahan, ketahanan, dan kesempurnaan. Dengan kualitas ini Anda akan baik untuk mempastikan sesuatu berjalan lancar atau berhasil. Lambang-lambang yang termasuk dalam kategori tetap selain Anda adalah Taurus, Aquarius dan Scorpio.",
    "Virgo": "Orang yang lahir pada tanggal antara 22 Agustus hingga 22 September dikatakan bernaung di bawah zodiak Virgo, yang berlambang Seorang Gadis. Dengan demikian, Virgo suka pada kerja, hasil kerja sempurna, punya pahlawan diri, suci, mengutamakan kesehatan, ada kesadaran, memberikan konsentrasi berdisiplin, praktis, siap melayani dan komprehensif. Namun, ada kalanya Virgo merasa khawatir, cerewet, berpandangan sempit, terlalu tertib, suka mengeluh, tidak mudah mengaku kalah, dan ada suka mengkritik. Virgo termasuk dalam kategori variabel, yaitu mudah mengalami daya perubahan, daya adaptasi dan daya keseimbangan. Dengan kategori variabel ini, Virgo adalah zodiak kreatif meskipun tidak selalu praktis. Lambang-lambang yang termasuk dalam kategori bervariasi selain Virgo adalah Gemini, Pisces dan Sagitarius.",
    "Libra": "Orang yang lahir pada tanggal antara 23 September sampai 22 Oktober dikatakan bernaung di bawah zodiak Libra, yang berlambang Alat Penimbang (Dacin). Dengan demikian, orang yang berzodiak Libra biasanya berciri-ciri harmonis, seimbang, menyukai pernikahan, mendapati perhubungan, mengutamakan kesetaraan, aliansi, diplomasi, berseni, suka membantu, selalu dalam keadaan ceria, dapat menjadi pasangan yang ideal dan menyukai keadilan. Namun, ada kalanya Libra bersikap bolak-balik, pura-pura, tidak jujur, tujuan kurang tegas, atau tindakan kurang seimbang. Libra termasuk dalam kategori kardinal, yaitu aktif (berprinsip memulai sesuatu). Dengan kualitas ini Libra dianggap baik untuk merangsang dan memulai setiap proyek baru. Lambang-lambang yang termasuk dalam kategori kardinal selain Libra adalah Aries, Cancer dan Capricorn.",
    "Scorpio": "Orang yang lahir pada tanggal antara 23 Oktober sampai 22 November dikatakan bernaung di bawah zodiak Scorpio, yang berlambang kalajengking. Scorpio memiliki kemewahan, kreatif, ada keinginan yang kuat, punya stamina, daya sensual yang tinggi dan ada bakat menyembuhkan. Walau bagaimana pun, ada kalanya Scorpio mudah menaruh rasa cemburu, suka menuntut bela, suka ‘membinasakan diri’, ekstrim, fanatik, tamak dan berdaya untuk menyerang. Scorpio termasuk dalam kategori tetap, yaitu termasuk stabilitas, ketabahan, ketahanan, dan kesempurnaan. Dengan kualitas ini Scorpio akan baik untuk memastikan sesuatu berjalan lancar atau berhasil. Lambang-lambang yang termasuk dalam kategori tetap selain Scorpio adalah Taurus, Leo dan Aquarius.",
    "Sagitarius": "Orang yang lahir pada tanggal antara 23 November sampai 20 Desember dikatakan bernaung di bawah zodiak Sagitarius, yang berlambang Pemanah. Sagitarius suka minat belajar, bersikap optimis, pemanjat, pemahaman diri, bercita-cita tinggi, memiliki hati nurani, berpegang pada agama, psikologi, suka pada kesenangan, bijaksana, selalu ada keberuntungan, gemar eksplorasi dan ada berbagai impian. Namun, ada kalanya Sagitarius berada dalam kelalaian, tidak mematuhi hukum, berada dalam kegelisahan, pembazir, terlalu menurut kehendak hati, tidak jujur dan tidak bertanggung jawab. Sagitarius termasuk dalam kategori variabel, yaitu mudah mengalami daya perubahan, daya adaptasi dan daya keseimbangan. Dengan kategori variabel ini, Sagitarius adalah kreatif meskipun tidak selalu praktis. Lambang-lambang yang termasuk dalam kategori bervariasi selain Sagitarius adalah Gemini, Virgo dan Pisces."
  };


  final Map<String, String> bulanData = {
    "Januari": "Si Ambisius — Mereka yang lahir bulan Januari biasanya memiliki sifat keras kepala dalam hal tindakan maupun keinginan. Individu yang lahir pada bulan Januari juga dinilai memiliki sifat ambisius dalam kehidupan karir. Di lain sisi, orang-orang yang lahir di bulan ini cenderung merupakan people watcher. Kamu biasanya senang memperhatikan orang-orang sekitarmu untuk mempelajari sesuatu, entah kehidupan mereka atau yang lainnya. Uniknya, kamu juga belajar mengenali sifat-sifat dirimu dari cara mengobservasi orang lain. Selain itu, individu yang lahir di bulan Januari memiliki keinginan atau hasrat untuk membantu orang dalam hal improvisasi diri. Kemampuan leadership ini terkadang bisa bermanfaat, namun bisa juga sebaliknya. Kamu harus pintar memposisikan dirimu agar segala karakteristik unik ini dapat memberikan benefit bagi kehidupan personal maupun karir.",
    "Februari": "Si Pemikir yang Filosofis — Jika kamu lahir bulan Februari, kamu cenderung memiliki bakat artistik dan juga kreatifitas alami. Mereka yang lahir pada bulan Februari juga cenderung memiliki otak yang cerdas, dan senang berpikir bebas atau biasa disebut free thinker namun mereka bisa memberontak sewaktu-waktu. Artinya individu kelahiran bulan Februari terkadang akan menolak untuk mematuhi aturan main ketika argumen mereka dirasa tidak diperhatikan. Satu hal yang baik bagi mereka yang lahir bulan Februari adalah kemampuan untuk mengenal lebih dalam kepribadian mereka sendiri. Hal inilah yang membuat mereka selalu yakin dengan apa yang ingin mereka capai.",
    "Maret": "Si Penengah Konflik — Individu yang lahir pada bulan Maret cenderung pemalu dalam hal keterbukaan diri. Ini membuat mereka tidak mudah untuk menunjukkan jati diri atau personality mereka kepada sembarang orang. Mereka juga memiliki keinginan hati yang lurus dan baik. Harmonisasi adalah kunci utama bagi mereka yang lahir pada bulan Maret. Makanya tak jarang mereka sering kali dianggap sebagai orang yang cocok sebagai penengah dua kubu yang beroposisi. Mereka juga dianggap trustworthy.",
    "April": "Si Penyuka Tantangan — Kesan kuat dan atletis biasanya melekat pada mereka yang lahir pada bulan April. Individu kelahiran bulan April cenderung akan cepat merasa senang jika mendapat perhatian dari banyak pihak, singkatnya mereka ingin kerja keras mereka dihargai oleh orang-orang. Kelahiran bulan April juga biasanya menyukai tantangan dan punya banyak pengalaman menyenangkan dalam hidup. Meski kamu merasa ketakutan saat pertama kali mencoba sesuatu, dorongan asli dalam hatimu selalu mengatakan bahwa sebenarnya hal menantang tersebut memang perlu untuk kamu taklukkan. Itulah mengapa mereka yang lahir pada bulan April biasanya juga dikenal sebagai pribadi yang mudah dalam mengalahkan rasa takut dalam diri sendiri.",
    "Mei": "Si Cerdas yang Atraktif — Banyak individu yang lahir pada bulan Mei dikenal sangat atraktif, baik secara fisik maupun personality. Mereka cenderung lebih menggunakan otak kiri, yang berarti bahwa sifat orang-orang kelahiran bulan Mei ini lebih logis dibanding kreatif. Sejalan dengan hal tersebut, mereka sebenarnya juga punya peluang besar untuk sukses di mata pelajaran Matematika atau bidang sains seperti fisika. Individu kelahiran bulan Mei sangat senang bermain dengan fakta-fakta dan sering merasa terhibur dengan artikel atau tayangan yang lebih memiliki basis nyata dibandingkan fantasi semu. Mereka juga dikenal memiliki figur yang jelas mengenai mimpi dan masa depan mereka.",
    "Juni": "Si Kalem — Sensitif dan peka, dua kesan inilah yang paling sering menempel pada mereka yang lahir pada bulan Juni. Hal yang unik adalah mereka tidak akan memberitahu kita apakah mereka tengah merasa sedih ataupun tersakiti. Individu kelahiran bulan Juni merupakan pendengar yang baik, mereka juga punya rasa peduli yang besar terhadap orang lain dan cenderung sangat sopan. Sifat ini sering membuat orang lain datang kepada mereka untuk meminta saran. Mereka yang lahir pada bulan Juni biasanya senang membahagiakan orang lain. Namun di lain sisi, hal tersebut bisa berakibat buruk. Contohnya jika mereka punya hasrat yang sama dengan teman mereka, individu kelahiran bulan Juni ini cenderung memilih untuk mengalah demi orang lain.",
    "Juli": "Si Extrovert — Orang-orang yang lahir pada bulan Juli kebanyakan memiliki sifat asli yang enerjik, artinya mereka asyik untuk diajak hangout. Mereka juga punya satu pesona tersendiri yang membuat orang lain merasa ingin lebih dekat dengan mereka. Selain itu individu yang lahir bulan Juli punya selera humor yang cerdas. Segala karakteristik ini membuat orang-orang cepat sekali nyaman terhadap mereka. Menghabiskan waktu bersama individu kelahiran bulan Juli biasanya tidak akan pernah terasa bosan karena mereka selalu punya energi dan senyum sumringah untuk menaikkan mood orang-orang di sekitar mereka.",
    "Agustus": "Si Pemimpin Alami — Karakteristik individu yang lahir bulan Agustus memiliki kesamaan dengan mereka yang lahir pada bulan Juli dari segi selera humor. Mereka juga senang tertawa dan membuat lelucon. Kepribadian ini membuat orang lain mengagumi karakter personal mereka. Jika kamu merupakan kelahiran Agustus, berbahagialah karena kamu punya bakat alami dalam hal leadership. Sayangnya, tak banyak individu kelahiran Agustus yang sadar akan potensi mereka. Padahal kemampuan ini bisa dimanfaatkan untuk menyukseskan hidup, baik dalam bisnis maupun urusan personal.",
    "September": "Si Penyuka Detail — Detail oriented mungkin merupakan kata yang tepat untuk menggambarkan karakteristik orang-orang yang lahir pada bulan September. Hal ini dikarenakan mereka cenderung perfeksionis dalam memandang sesuatu. Standar ini uniknya tak hanya mereka terapkan pada orang lain, tetapi juga pada mereka sendiri. Ini bisa jadi merupakan suatu hal yang dapat memberikan manfaat karena kebanyakan dari mereka yang lahir pada bulan September memiliki manajemen waktu serta metode pengerjaan tugas yang cukup baik. Mereka juga biasanya punya ekspektasi tinggi jika menyangkut hal-hal yang berbau organisasional, dan punya kritik tajam jika apa yang mereka harapkan tidak sesuai.",
    "Oktober": "Si Penebar Aura Positif — Individu yang lahir pada bulan Oktober cenderung bersifat carefree, artinya mereka tidak suka kehidupan mereka diatur ataupun dikekang. Mereka juga punya sifat alami yakni independen dan selalu fokus untuk melihat sisi positif dari suatu hal. Inilah yang membuat banyak orang sering bergantung kepada individu yang lahir pada bulan Oktober. Kecenderungan sifat di atas juga membuat mereka yang lahir di bulan ini menjadi pribadi yang menyenangkan, talkative dan mudah dalam membuat teman baru.",
    "November": "Si Pengamat yang Misterius — Mereka yang lahir pada bulan November punya kecenderungan sifat keras kepala dan sangat secretive. Maksud dari secretive ini artinya mereka selalu menyimpan rahasia mereka rapat-rapat dan tak menceritakannya pada orang lain, tidak peduli seberapa dekat hubungan mereka dengan orang tersebut. Hal ini sering membuat orang-orang salah paham akan maksud mereka sebenarnya. Individu yang lahir pada bulan November juga memiliki level fokus yang luar biasa terhadap sesuatu. Mereka juga sangat peka dan self-motivated, dua hal yang memberikan kontribusi terhadap sifat mereka yang secretive karena mereka tidak terlalu mempercayai orang lain. Kalau kamu merupakan kelahiran bulan November, biasanya kamu tidak terlalu suka jika harus menerima bantuan dari orang lain. Bahkan ketika orang tersebut menawarkan atau memaksa kamu menerima bantuan, kamu tetap enggan untuk mengatakan ya dan memilih fokus serta percaya pada kemampuanmu. Kamu sebenarnya punya segudang potensi untuk bisa menjadi pemimpin. Namun terkadang sifat masa bodo-mu itu membuatmu tidak tertarik dengan segala atribut dan jabatan penting yang ditawarkan tadi.",
    "Desember": "Si Kuat yang Inspiratif — Mereka yang lahir bulan Desember senang menjadi pusat perhatian dan cenderung aktif. Hal ini mengindikasikan bahwa kamu tidak suka hanya berdiam diri di rumah dan tidak melakukan apapun. Individu yang lahir pada bulan Desember biasanya sangat bangga terhadap diri sendiri dan tidak peduli dengan pandangan lemah orang lain yang terkadang mengintimidasi. Karakteristik ini membuat mereka tidak akan keberatan untuk fighting back jika ada pihak yang berusaha menjatuhkan mereka. Individu kelahiran bulan Desember sering juga dikenal sebagai tipe manusia yang selalu gigih dalam membela harga diri mereka. Salah satu sifat kesatria yang tidak dimiliki oleh banyak orang."
  };

  void _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(2003),
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  void _submit() {
    if (selectedDate != null && nameController.text.isNotEmpty) {
      final provider = Provider.of<ZodiacProvider>(context, listen: false);
      provider.setZodiac(selectedDate!, zodiacData);
      provider.setBulan(selectedDate!, bulanData);
      print('Zodiac: ${provider.zodiac?.name}, Bulan: ${provider.bulan?.name}');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ZodiacResultPage(nameController.text)),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RAMAL APP')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Nama'),
                ),
                InkWell(
                  onTap: _pickDate,
                  child: InputDecorator(
                    decoration: InputDecoration(labelText: 'Tanggal Lahir'),
                    child: Text(
                      selectedDate != null
                          ? "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
                          : "Pilih tanggal",
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: _submit, child: Text("Ramal")),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://i.pinimg.com/736x/b5/7f/56/b57f565192177a585750a5134d4221d4.jpg'),
                ),
                SizedBox(height: 4),
                Text("Nama: Firza Cahya Desnita", style: TextStyle(fontSize: 16)),
                Text("NIM: 2310501075", style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}