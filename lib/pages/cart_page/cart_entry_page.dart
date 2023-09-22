import 'package:ecshop_techpit/model/cart.dart';
import 'package:ecshop_techpit/model/data/cart_item/cart_item.dart';
import 'package:ecshop_techpit/model/shop_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartEntry extends ConsumerWidget {
  const CartEntry({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemInfo = ref.watch(shopItemForIdProvider(cartItem.itemId)).value!;
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              itemInfo.imageUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemInfo.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Option -${cartItem.option}',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${itemInfo.price}yen',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    _ItemCounter(cartItem: cartItem),
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartProvider.notifier)
                            .removeItem(cartItem.itemId, cartItem.option);
                      },
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemCounter extends ConsumerWidget {
  const _ItemCounter({required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        SizedBox(
          width: 30,
          child: TextButton(
            child: Text('-'),
            onPressed: cartItem.count > 1
                ? () {
                    ref
                        .read(cartProvider.notifier)
                        .decrementItemCount(cartItem.itemId, cartItem.option);
                  }
                : null,
          ),
        ),
        Text('${cartItem.count}'),
        SizedBox(
          width: 30,
          child: TextButton(
            child: Text('+'),
            onPressed: () {
              ref
                  .read(cartProvider.notifier)
                  .incrementItemCount(cartItem.itemId, cartItem.option);
            },
          ),
        ),
      ],
    );
  }
}
