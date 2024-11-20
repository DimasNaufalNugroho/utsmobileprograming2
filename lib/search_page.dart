import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> _items = [
    'BRAGA CITY TOUR',
    'KAWAH PUTIH',
    'ORCHID FOREST CIKOLE',
    'TAMAN HUTAN RAYA IR. H.JUANDA',
    'TEBING KERATON',
    'THE GREAT ASIA AFRICA LEMBANG'
  ];

  final Map<String, String> _itemDescriptions = {
    'BRAGA CITY TOUR': 'Deskripsi tentang BRAGA CITY TOUR...',
    'KAWAH PUTIH': 'Deskripsi tentang KAWAH PUTIH...',
    'ORCHID FOREST CIKOLE': 'Deskripsi tentang ORCHID FOREST CIKOLE...',
    'TAMAN HUTAN RAYA IR. H.JUANDA': 'Deskripsi tentang TAMAN HUTAN RAYA IR. H.JUANDA...',
    'TEBING KERATON': 'Deskripsi tentang TEBING KERATON...',
    'THE GREAT ASIA AFRICA LEMBANG': 'Deskripsi tentang THE GREAT ASIA AFRICA LEMBANG...',
  };

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<String> _filteredItems = _items
        .where((item) => item.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pencarian'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Cari',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _filteredItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: _filteredItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_filteredItems[index]),
                          leading: Icon(Icons.label),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  title: _filteredItems[index],
                                  description:
                                      _itemDescriptions[_filteredItems[index]]!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String description;

  const DetailPage({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          description,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
