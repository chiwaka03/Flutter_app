class Product {
  String title;
  String image;
  String price;
  String url;

  Product(this.title, this.image, this.price, this.url);

  void printMethod() {
    print('Title: $title');
    print('Image: $image');
    print('Price: $price');
    print('url: $url');
  }
}