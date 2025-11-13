import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final IconData icon;
  final Color color;

  Contact({
    required this.name,
    required this.phone,
    required this.icon,
    required this.color,
  });
}

class KontakFragment extends StatelessWidget {
  const KontakFragment({super.key});

  static final List<Contact> _contacts = [
    Contact(
      name: 'Ahmad Fadli',
      phone: '0812-3456-7890',
      icon: Icons.person,
      color: Colors.deepPurple,
    ),
    Contact(
      name: 'Siti Nurhaliza',
      phone: '0813-4567-8901',
      icon: Icons.person,
      color: Colors.pink,
    ),
    Contact(
      name: 'Budi Santoso',
      phone: '0814-5678-9012',
      icon: Icons.person,
      color: Colors.green,
    ),
    Contact(
      name: 'Dewi Lestari',
      phone: '0815-6789-0123',
      icon: Icons.person,
      color: Colors.purple,
    ),
    Contact(
      name: 'Rizki Pratama',
      phone: '0816-7890-1234',
      icon: Icons.person,
      color: Colors.orange,
    ),
    Contact(
      name: 'Aisyah Putri',
      phone: '0817-8901-2345',
      icon: Icons.person,
      color: Colors.red,
    ),
    Contact(
      name: 'Hendra Gunawan',
      phone: '0818-9012-3456',
      icon: Icons.person,
      color: Colors.teal,
    ),
    Contact(
      name: 'Maya Sari',
      phone: '0819-0123-4567',
      icon: Icons.person,
      color: Colors.indigo,
    ),
    Contact(
      name: 'Fajar Nugroho',
      phone: '0821-1234-5678',
      icon: Icons.person,
      color: Colors.cyan,
    ),
    Contact(
      name: 'Linda Wijaya',
      phone: '0822-2345-6789',
      icon: Icons.person,
      color: Colors.amber,
    ),
    Contact(
      name: 'Andi Setiawan',
      phone: '0823-3456-7890',
      icon: Icons.person,
      color: Colors.deepOrange,
    ),
    Contact(
      name: 'Rina Permata',
      phone: '0824-4567-8901',
      icon: Icons.person,
      color: Colors.lightGreen,
    ),
    Contact(
      name: 'Agus Susanto',
      phone: '0825-5678-9012',
      icon: Icons.person,
      color: Colors.brown,
    ),
    Contact(
      name: 'Fitri Handayani',
      phone: '0826-6789-0123',
      icon: Icons.person,
      color: Colors.deepPurple,
    ),
    Contact(
      name: 'Doni Prasetyo',
      phone: '0827-7890-1234',
      icon: Icons.person,
      color: Colors.purpleAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontak'),
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
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          final contact = _contacts[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: CircleAvatar(
                backgroundColor: contact.color,
                radius: 28,
                child: Icon(
                  contact.icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              title: Text(
                contact.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      contact.phone,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.call,
                  color: Colors.green.shade600,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Memanggil ${contact.name}...'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

