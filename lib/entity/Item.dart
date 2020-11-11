class Meta {
  String name;
  double price;

  Meta(this.name, this.price);
}

abstract class Printable {
  void printInfo() => print(getInfo());

  String getInfo();
}

class Item extends Meta {
  Item(name, price) : super(name, price);

  Item operator +(Item item) => Item(name + item.name, price + item.price);
}

class ShoppingCart extends Meta with Printable {
  DateTime date;
  String code;
  List<Item> bookings;

  ShoppingCart.withCode(name, this.code)
      : date = DateTime.now(),
        super(name, 0);

  double get price {
    return bookings.reduce((value, element) => value + element).price;
  }

  String getInfo() {
    return '''购物车信息:
    -----------------------------
    用户名:$name
    优惠码:${code ?? "没有"}
    商品:${bookings.map((e) => e.name).reduce((value, element) => value + ' ' + element)}
    总价:$price
    日期:${date.toString()}
    -----------------------------
    ''';
  }
}

void main() {
  ShoppingCart.withCode("yu_", "998")
    ..bookings = [Item("鸭梨", 200.0), Item("苹果", 1.0)]
    ..printInfo();
}
