import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'AboutPage';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(image: 'assets/images/alfa.jpg'),
              TitleSection(
                name: 'Alfa Renaldo Aluska',
                location: 'Bogor, Jawa Barat, Indonesia',
                nrp: "5026221144",
              ),
              ButtonSection(),
              TextSection(
                description: 'Halo, saya Alfa Renaldo Aluska!\n\n'
                    'Perjalanan pendidikan saya dimulai di SMA Plus PGRI Cibinong, '
                    'dengan fokus pada jurusan IPA. Setelah lulus, '
                    'saya melanjutkan studi di Institut Teknologi Sepuluh Nopember, '
                    'mengambil jurusan Sistem Informasi untuk memperdalam pengetahuan saya '
                    'di bidang teknologi dan manajemen informasi.\n\n'
                    'Lahir pada 6 Mei 2002, saya percaya bahwa setiap pengalaman adalah peluang '
                    'untuk belajar dan berkembang. Dengan semangat belajar dan tekad yang kuat, '
                    'saya terus berusaha memberikan yang terbaik dalam setiap langkah hidup saya.\n\n'
                    'Mari terhubung dan ciptakan hal-hal luar biasa bersama!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Kelas untuk menampilkan gambar
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

// Kelas untuk menampilkan informasi nama, lokasi, dan NRP
class TitleSection extends StatelessWidget {
  const TitleSection(
      {super.key,
      required this.name,
      required this.location,
      required this.nrp});

  final String name;
  final String location;
  final String nrp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          // Ikon untuk menandakan ini profil
          Icon(
            Icons.numbers,
            color: Colors.red[500],
          ),
          Text(nrp),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  // Fungsi untuk membuka email
  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'renaldoaluska@gmail.com', // Ganti dengan alamat email kamu
      query: 'subject=Hello&body=How are you?', // Parameter tambahan
    );
    if (!await launchUrl(emailUri)) {
      throw 'Gagal launch $emailUri';
    }
  }

  // Fungsi untuk membuka website
  Future<void> _launchWeb() async {
    final Uri webUri =
        Uri.parse('https://renaldo.my.id'); // Ganti dengan link website kamu
    if (!await launchUrl(webUri, mode: LaunchMode.externalApplication)) {
      throw 'Gagal launch $webUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;

    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Button untuk email, jadi ketika klik bakal buka email
          TextButton.icon(
            onPressed: _launchEmail,
            icon: Icon(Icons.email, color: color),
            label: Text(
              'EMAIL',
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, color: color),
            ),
          ),
          // Button untuk membuka website
          TextButton.icon(
            onPressed: _launchWeb,
            icon: Icon(Icons.link, color: color),
            label: Text(
              'WEBSITE',
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, color: color),
            ),
          ),
        ],
      ),
    );
  }
}

// Kelas untuk tombol dengan ikon dan teks di bawahnya
class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

// Kelas untuk menampilkan teks deskripsi
class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}
