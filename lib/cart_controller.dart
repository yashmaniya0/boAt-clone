import 'package:get/get.dart';

class CartController extends GetxController{
  var _products = {}.obs;

  void addProduct(Map<dynamic, dynamic> product){
    if (_products.containsKey(product['productName'])){
      _products[product['productName']]['itemCount']+=1;
    }
    else{
      _products[product['productName']]={
        'itemCount':1,
        'productImage':product['productImage'],
        'productName':product['productName'],
        'buyPrice':product['sellingPrice'],
        'mrp':product['mrp'],
      }.obs;
    }
    Get.snackbar(
      'Product Added Successfully!!!',
      'Product : ${product['productName']} added to the cart.',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void removeProduct(String product){
    if (_products[product]['itemCount']>1){
      _products[product]['itemCount']-=1;
    }
    else{
      deleteProduct(product);
    }
  }

  void deleteProduct(String product){
    _products.remove(product);
  }

  void addFromCart(String product){
    _products[product]['itemCount']+=1;
  }

  get products{
    return _products;
  }

  get itemsInCart{
    List l = _products.values.toList().map((val) => val['itemCount']).toList();
    num x=0;
    for(int i=0;i<l.length;i++){
      x+=l[i];
    }
    return x;
  }

  get total{
    List l = _products.values.toList().map((val) => val['itemCount']*val['buyPrice']).toList();
    num x=0;
    for(int i=0;i<l.length;i++){
      x+=l[i];
    }
    RegExp expression = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

    return x.toString().replaceAllMapped(expression, (Match m) => '${m[1]},');
  }
}