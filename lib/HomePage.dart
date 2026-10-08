import 'package:flutter/material.dart';
import 'package:movies_list/SeriesProvider.dart';
import 'package:movies_list/DetailsPage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final series = context.watch<SeriesProvider>().seriesData;

    return Scaffold(
      appBar: AppBar(title: const Text('Popular TV Series')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: series.length,
        itemBuilder: (context, index) {
          final serie = series[index];
          return GestureDetector(
            onTap: () {
              context.read<SeriesProvider>().select(serie);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DetailsPage()),
              );
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Image.asset(
                    serie.image,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      serie.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}