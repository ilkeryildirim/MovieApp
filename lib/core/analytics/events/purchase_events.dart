import 'analytics_event.dart';

class PurchaseEvent extends AnalyticsEvent {
  final String transactionId;
  final double value;
  final String currency;
  final List<PurchaseItem> items;
  final String? couponCode;
  final double? tax;
  final double? shipping;
  
  PurchaseEvent({
    required this.transactionId,
    required this.value,
    required this.currency,
    required this.items,
    this.couponCode,
    this.tax,
    this.shipping,
  });
  
  @override
  String get eventName => 'purchase';
  
  @override
  Map<String, dynamic> get parameters => {
    'transaction_id': transactionId,
    'value': value,
    'currency': currency,
    'items': items.map((item) => item.toMap()).toList(),
    'item_count': items.length,
    if (couponCode != null) 'coupon': couponCode,
    if (tax != null) 'tax': tax,
    if (shipping != null) 'shipping': shipping,
    'timestamp': timestamp.toIso8601String(),
  };
}

class AddToCartEvent extends AnalyticsEvent {
  final String itemId;
  final String itemName;
  final String itemCategory;
  final double price;
  final int quantity;
  final String currency;
  
  AddToCartEvent({
    required this.itemId,
    required this.itemName,
    required this.itemCategory,
    required this.price,
    required this.quantity,
    required this.currency,
  });
  
  @override
  String get eventName => 'add_to_cart';
  
  @override
  Map<String, dynamic> get parameters => {
    'item_id': itemId,
    'item_name': itemName,
    'item_category': itemCategory,
    'price': price,
    'quantity': quantity,
    'currency': currency,
    'value': price * quantity,
    'timestamp': timestamp.toIso8601String(),
  };
}

class RemoveFromCartEvent extends AnalyticsEvent {
  final String itemId;
  final String itemName;
  final int quantity;
  final double value;
  final String currency;
  
  RemoveFromCartEvent({
    required this.itemId,
    required this.itemName,
    required this.quantity,
    required this.value,
    required this.currency,
  });
  
  @override
  String get eventName => 'remove_from_cart';
  
  @override
  Map<String, dynamic> get parameters => {
    'item_id': itemId,
    'item_name': itemName,
    'quantity': quantity,
    'value': value,
    'currency': currency,
    'timestamp': timestamp.toIso8601String(),
  };
}

class PurchaseItem {
  final String itemId;
  final String itemName;
  final String itemCategory;
  final int quantity;
  final double price;
  final String? itemBrand;
  final String? itemVariant;
  
  PurchaseItem({
    required this.itemId,
    required this.itemName,
    required this.itemCategory,
    required this.quantity,
    required this.price,
    this.itemBrand,
    this.itemVariant,
  });
  
  Map<String, dynamic> toMap() => {
    'item_id': itemId,
    'item_name': itemName,
    'item_category': itemCategory,
    'quantity': quantity,
    'price': price,
    if (itemBrand != null) 'item_brand': itemBrand,
    if (itemVariant != null) 'item_variant': itemVariant,
  };
} 