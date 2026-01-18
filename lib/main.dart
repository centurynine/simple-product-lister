import 'package:app/feature/product/presentation/bloc/product_bloc.dart';
import 'package:app/feature/product/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Lister Application',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blueAccent), useMaterial3: true),
      home: BlocProvider(create: (context) => ProductBloc()..add(LoadProducts()), child: const ProductPage()),
    );
  }
}
