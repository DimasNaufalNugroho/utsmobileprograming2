import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "User",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {},
                        heroTag: 'follow',
                        elevation: 0,
                        label: const Text("Follow"),
                        icon: const Icon(Icons.person_add_alt_1),
                      ),
                      const SizedBox(width: 16.0),
                      FloatingActionButton.extended(
                        onPressed: () {},
                        heroTag: 'message',
                        elevation: 0,
                        backgroundColor: Colors.red,
                        label: const Text("Message"),
                        icon: const Icon(Icons.message_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _ProfileInfoRow(),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _showLogoutDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    ),
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menampilkan dialog konfirmasi logout bergaya iOS
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Are you sure?"),
          content: const Text("Do you really want to logout?"),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                // Arahkan pengguna ke halaman login setelah logout
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({Key? key}) : super(key: key);

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("Posts", 10),
    ProfileInfoItem("Followers", 120),
    ProfileInfoItem("Following", 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map((item) => Expanded(
                    child: Row(
                  children: [
                    if (_items.indexOf(item) != 0) const VerticalDivider(),
                    Expanded(child: _singleItem(context, item)),
                  ],
                ))).toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            item.title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      );
}

class ProfileInfoItem {
  final String title;
  final int value;
  const ProfileInfoItem(this.title, this.value);
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xff0043ba), Color(0xff006df1)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'data:image/jpeg;base64,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',

                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}