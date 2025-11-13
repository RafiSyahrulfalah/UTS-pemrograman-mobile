import 'package:flutter/material.dart';

class NewsArticle {
  final String title;
  final String date;
  final String summary;
  final IconData imageIcon;
  final Color imageColor;

  NewsArticle({
    required this.title,
    required this.date,
    required this.summary,
    required this.imageIcon,
    required this.imageColor,
  });
}

class BeritaFragment extends StatelessWidget {
  const BeritaFragment({super.key});

  static final List<NewsArticle> _newsArticles = [
    NewsArticle(
      title: 'Flutter 3.0 Dirilis dengan Fitur Baru yang Menakjubkan',
      date: '1 November 2025',
      summary:
          'Google merilis Flutter 3.0 dengan berbagai peningkatan performa dan fitur-fitur baru yang memudahkan developer dalam membuat aplikasi cross-platform.',
      imageIcon: Icons.phone_android,
      imageColor: Colors.deepPurple,
    ),
    NewsArticle(
      title: 'Teknologi AI Semakin Berkembang di Indonesia',
      date: '2 November 2025',
      summary:
          'Perkembangan kecerdasan buatan di Indonesia menunjukkan pertumbuhan yang signifikan, dengan banyak startup lokal yang mulai mengadopsi teknologi ini.',
      imageIcon: Icons.computer,
      imageColor: Colors.purple,
    ),
    NewsArticle(
      title: 'Tips Belajar Pemrograman untuk Pemula',
      date: '3 November 2025',
      summary:
          'Memulai perjalanan sebagai programmer bisa terasa menantang. Berikut adalah beberapa tips yang dapat membantu pemula dalam belajar pemrograman.',
      imageIcon: Icons.code,
      imageColor: Colors.green,
    ),
    NewsArticle(
      title: 'Aplikasi Mobile Dominasi Pasar Digital',
      date: '3 November 2025',
      summary:
          'Penggunaan aplikasi mobile terus meningkat dan mendominasi pasar digital global, dengan pengguna menghabiskan rata-rata 4 jam per hari.',
      imageIcon: Icons.smartphone,
      imageColor: Colors.orange,
    ),
    NewsArticle(
      title: 'Keamanan Cyber Menjadi Prioritas Utama',
      date: '4 November 2025',
      summary:
          'Di era digital ini, keamanan cyber menjadi semakin penting. Perusahaan teknologi berlomba-lomba meningkatkan sistem keamanan mereka.',
      imageIcon: Icons.security,
      imageColor: Colors.red,
    ),
    NewsArticle(
      title: 'Cloud Computing: Masa Depan Infrastruktur IT',
      date: '4 November 2025',
      summary:
          'Cloud computing terus berkembang dan menjadi pilihan utama untuk infrastruktur IT modern, menawarkan skalabilitas dan efisiensi biaya.',
      imageIcon: Icons.cloud,
      imageColor: Colors.teal,
    ),
    NewsArticle(
      title: 'Machine Learning dalam Kehidupan Sehari-hari',
      date: '4 November 2025',
      summary:
          'Machine learning telah menjadi bagian tak terpisahkan dari kehidupan sehari-hari, mulai dari rekomendasi produk hingga asisten virtual.',
      imageIcon: Icons.psychology,
      imageColor: Colors.indigo,
    ),
    NewsArticle(
      title: 'Tren Desain UI/UX 2025',
      date: '4 November 2025',
      summary:
          'Desain UI/UX terus berevolusi. Tahun 2025 membawa tren baru seperti dark mode, minimalism, dan animasi micro-interactions.',
      imageIcon: Icons.design_services,
      imageColor: Colors.pink,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple.shade700, Colors.purple.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _newsArticles.length,
        itemBuilder: (context, index) {
          final article = _newsArticles[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                _showArticleDetail(context, article);
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Thumbnail
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: article.imageColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        article.imageIcon,
                        size: 40,
                        color: article.imageColor,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 14,
                                color: Colors.grey.shade600,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                article.date,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            article.summary,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade700,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showArticleDetail(BuildContext context, NewsArticle article) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(article.imageIcon, color: article.imageColor),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Detail Berita',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      article.date,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  article.summary,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}

