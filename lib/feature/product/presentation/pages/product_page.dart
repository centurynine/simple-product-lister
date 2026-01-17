import 'package:app/feature/product/presentation/bloc/product_bloc.dart';
import 'package:app/feature/product/presentation/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(LoadProducts()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              final products = state.products;
              return ListView.builder(
                itemCount: products.products.length,
                itemBuilder: (context, index) {
                  final product = products.products[index];
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text('\$${product.price}'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product: product)));
                    },
                  );
                },
              );
            } else if (state is ProductError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
