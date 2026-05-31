import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'COYS STORE',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,

          children: const [

            ProductCard(
              title: 'Inferno Flame',
              price: 'Rp150.000',
              image: 'assets/images/inferno.jpg',
            ),

            ProductCard(
              title: 'Venom Strike',
              price: 'Rp145.000',
              image: 'assets/images/venom.jpg',
            ),

            ProductCard(
              title: 'Dragon Legacy',
              price: 'Rp170.000',
              image: 'assets/images/dragon.jpg',
            ),

            ProductCard(
              title: 'Cyber Pulse',
              price: 'Rp160.000',
              image: 'assets/images/cyber.jpg',
            ),

          ],
        ),
      ),
    );
  }
}