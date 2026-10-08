import 'package:flutter/material.dart';
import 'package:movies_list/SeriesProvider.dart';
import 'package:movies_list/DetailsPage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SeriesProvider>();
    final series = provider.seriesData;

    return Scaffold(
      appBar: AppBar(title: const Text('Popular TV Series')),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : series.isEmpty
              ? const Center(child: Text('Could not load movies'))
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: series.length,
                  itemBuilder: (context, index) {
                    final serie = series[index];
                    return GestureDetector(
                      onTap: () {
                        context.read<SeriesProvider>().select(serie);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DetailsPage()),
                        );
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Image.network(
                              serie.image,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stack) =>
                                  const SizedBox(
                                height: 200,
                                child: Icon(Icons.broken_image),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                serie.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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