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
        appBar: AppBar(
          title: const Text('Products'),
          actions: [
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return IconButton(
                  icon: Icon(Icons.refresh_rounded),
                  onPressed: () {
                    context.read<ProductBloc>().add(RefreshProducts());
                  },
                );
              },
            ),
          ],
        ),
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
                    leading: Image.network(product.thumbnail, width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price}'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product: product)));
                    },
                  );
                },
              );
            } else if (state is ProductError) {
              if (state.failure is NetworkFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.wifi_off_rounded, size: 64, color: Colors.redAccent),
                      Text((state.failure as NetworkFailure).message),
                    ],
                  ),
                );
              } else if (state.failure is ClientFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_rounded, size: 64, color: Colors.redAccent),
                      Text((state.failure as ClientFailure).message),
                    ],
                  ),
                );
              } else {
                return Center(child: Text('An unknown error occurred'));
              }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
