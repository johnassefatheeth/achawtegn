import 'package:flutter/material.dart';

class Faqs {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onTap;

  Faqs({
    this.title = 'Sample Title',
    this.description = 'Sample Description',
    this.imageUrl = 'https://via.placeholder.com/150',
    required this.onTap,
  });
}

class FaQ extends StatelessWidget {
  final List<Faqs> list=[];

  FaQ({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus News'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return FaqsWidget(faqs: list[index]);
          },
        ),
      ),
    );
  }
}

class FaqsWidget extends StatelessWidget {
  final Faqs faqs;

  const FaqsWidget({Key? key, required this.faqs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: faqs.onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(faqs.imageUrl),
                radius: 30,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      faqs.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
}

class FaqDetails extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const FaqDetails({
    Key? key,
    this.title = 'Sample Title',
    this.description = 'Sample Description',
    this.imageUrl = 'https://via.placeholder.com/150',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faq Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
