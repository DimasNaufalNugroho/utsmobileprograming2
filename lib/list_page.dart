import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<int> bookmarkedIndices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Objek Wisata Bandung"),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BookmarkedPage(
                    bookmarkedIndices: bookmarkedIndices,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView.builder(
            itemCount: _images.length,
            itemBuilder: (BuildContext context, int index) {
              final isBookmarked = bookmarkedIndices.contains(index);
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SecondPage(heroTag: index)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: index,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            _images[index],
                            width: 180,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _titles[index],
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _descriptions[index],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                icon: Icon(
                                  isBookmarked
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color:
                                      isBookmarked ? Colors.blue : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (isBookmarked) {
                                      bookmarkedIndices.remove(index);
                                    } else {
                                      bookmarkedIndices.add(index);
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final int heroTag;

  const SecondPage({Key? key, required this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Detail Tempat"),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
          color: CupertinoColors.activeBlue,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(_images[heroTag]),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _titles[heroTag],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _descriptions[heroTag],
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookmarkedPage extends StatelessWidget {
  final List<int> bookmarkedIndices;

  const BookmarkedPage({Key? key, required this.bookmarkedIndices})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Penanda"),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
          color: CupertinoColors.activeBlue, // Custom color for the back button
        ),
      ),
      child: ListView.builder(
        itemCount: bookmarkedIndices.length,
        itemBuilder: (context, index) {
          final itemIndex = bookmarkedIndices[index];
          return CupertinoListTile(
            leading: Image.network(_images[itemIndex], width: 50, height: 50),
            title: Text(_titles[itemIndex]),
            subtitle: Text(
              _descriptions[itemIndex],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}


final List<String> _titles = [
  'BRAGA CITY TOUR',
  'KAWAH PUTIH',
  'ORCHID FOREST CIKOLE',
  'TAMAN HUTAN RAYA IR. H.JUANDA',
  'TEBING KERATON',
  'THE GREAT ASIA AFRICA LEMBANG',
];

final List<String> _descriptions = [
  //teks braga
  'Siapa sih yang enggak tahu Braga?Braga adalah ikon kota Bandung,dan enggak mungkin liburan ke Bandung kalau enggak menyempatkan diri sekadar lewat atau bahkan singgah untuk menikmati hypenya Braga. Dari restoran, bar, sampai coffee shop kekinian yang berdiri di dalam gedung tua yang terjaga, semuanya ada di Braga.Kamu juga bisa menemukan penjual-penjual lukisan di pinggir jalan, siap memberikanmu kenang-kenangan dari Bandung untuk dipajang di rumah.',
 
  //teks kawah putih 
  'Sering melihat kawah putih menjadi latar untuk foto-foto yang Instagramable? Well, memang sepopuler itu tempat wisata di Bandung ini. Buat yang belum pernah ke sini, wajib banget setidaknya sekali seumur hidup lihat .Kawah Putih Ciwidey sendiri merupakan danau kawah yang terbentuk dari letusan Gunung Patuha, salah satu gunung berapi di Jawa Barat.Air di danau kawah ini memiliki kandungan asam yang sangat tinggi, yang menyebabkan permukaannya berwarna putih kehijauan atau malah biru dan coklat - warna permukaan ini bisa berubah sesuai konsentrasi sulfur di dalamnya dan temperaturnya. Kalau beruntung, kamu bisa datang saat Kawah Putih berwarna putih kehijauan yang indah - membuatnya menjadi background yang keren untuk berfoto, bahkan untuk foto prewedding juga!',

  //teks orchid forest cikole
  'Terletak di Cikole, Lembang, Kabupaten Bandung Barat, Jawa Barat,  adalah hutan anggrek terbesar di Indonesia. Enggak main-main, jumlah anggrek di sini mencapai 20.000 tanaman! Selain anggrek, barisan pohon pinus yang ada di sana juga membuat pemandangan Orchid Forest Cikole menjadi sangat indah.Selain menawarkan pemandangan hutan pinus dan anggrek, Orchid Forest Cikole juga memiliki tempat bermain golf, area bermain dengan kelinci, jembatan tali yang bersinar di malam hari, sampai horse ranch.',

  //teks Taman Hutan Raya Ir. H. Djuanda
  'Sesuai namanya,Taman Hutan Raya Ir. H. Djuanda memang bukan sekadar taman - ini adalah hutan kota yang terletak di area Dago Pakar. Taman yang kerap disebut Tahura oleh warga Bandung ini juga jadi salah satu tempat wisata di Bandung favorit - termasuk bagi masyarakat kota Bandung sekalipun.Wisata ke Tahura adalah pilihan yang pas kalau kamu ingin mencoba jalan-jalan di tengah hutan tapi tanpa jauh-jauh keluar kota.',

  //teks Tebing Keraton
  'Tebing Keraton adalah sebuah tebing dengan pemandangan luar biasa di area Taman Hutan Raya Ir. H. Djuanda. Kalau ingin merasakan pengalaman melihat lautan pohon yang hijau dari atas tebing, di sinilah tempatnya.Banyak orang juga yang datang sekitar subuh untuk melihat matahari terbit di sini, jadi pastikan kamu juga mencoba pengalaman tersebut saat liburan ke Bandung.',

  //teks The Great Asia Africa Lembang
  'Satu tempat, tapi punya area instagramable bertema banyak negara? Kamu bisa menemukannya di Lembang. Terletak di Jalan Raya Lembang, tepat berseberangan dengan Farmhouse Lembang yang lebih dahulu populer, The Great Asia Africa adalah salah satu tempat wisata di Lembang yang tengah naik daun saat ini.Di sini, kamu bisa berfoto-foto menggunakan hanbok dengan latar belakang ala rumah-rumah Korea di masa lalu, kimono di Kyoto mini, menikmati warna-warni dinding di Maroko, atau bahkan berpose ala film India, lengkap dengan sari.',
];

final List<String> _images = [
  //gambar braga
  'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_1000/v1596032039/blog/uenk4abchnt8ey6hoajk.webp',
 
  //gambar kawah putih
  'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_1000/v1601460766/blog/fbdnltfnp1iigtkyffzp.webp',

  //gambar orchid forest cikole
  'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_1000/v1618188522/blog/xkndkjdwmqtxwfx46zdq.webp',

  //gambar Taman Hutan Raya Ir. H. Djuanda
  'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_1000/v1604305289/blog/mk4uwrgtnlrqpslwe5t8.webp',

  //gambar Tebing Keraton
  'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_1000/v1604305470/blog/v8cdqldozwpbaddzkhne.webp',

  //gambar The Great Asia Africa Lembang
  'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_1000/v1619078464/blog/je3kavfhjhslr3v3cjvm.webp',
];
