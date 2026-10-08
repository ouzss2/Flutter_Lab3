import 'package:flutter/material.dart';
import 'package:movies_list/SeriesProvider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final serie = context.watch<SeriesProvider>().selected!;

    return Scaffold(
      appBar: AppBar(title: Text(serie.title), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                serie.image,
                height: 350,
                width: double.infinity,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stack) => const SizedBox(
                  height: 350,
                  child: Icon(Icons.broken_image, size: 60),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              serie.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(serie.description, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}