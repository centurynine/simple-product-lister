import 'package:app/feature/product/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductItemModel product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.product.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('\$${widget.product.price}', style: const TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 16),
            Text(widget.product.description),
          ],
        ),
      ),
    );
  }
}
