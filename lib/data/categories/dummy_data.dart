import 'package:e_commerce_app/features/banners/models/banner_model.dart';
import 'package:e_commerce_app/features/shop/models/brandmodel.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_attributes.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/models/product_variation.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';

class TDummyData {
  //  // Banners

  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.puma, targetScreen: TRoutes.order, active: true),
    BannerModel(
        imageUrl: TImages.pumac, targetScreen: TRoutes.cart, active: true),
    BannerModel(
        imageUrl: TImages.zara, targetScreen: TRoutes.favourites, active: true),
  ];

  //  // User
  // static final UserModel user = UserModel(
  //   firstname: 'Suraj',
  //   lastname: 'gujarathi ',
  //   email: 'surajgujarathi999@gmail.com',
  //   phoneNumber: '9848274196',
  //   ProfilePicture: TImages.demouser,
  //   addressess:[
  //     AddressModel(
  //       id: '1',
  //       name:'Suraj gujarathi',
  //       PhoneNumber: '9848274196',
  //       city: 'vengal rao nagar',
  //       state: 'Telangana',
  //     ),

  //     AddressModel(
  //       id: '2',
  //       name:'sushal gujarathi',
  //       PhoneNumber: '9848274196',
  //       city: 'vengal rao nagar',
  //       state: 'Telangana',
  //     ),
  //   ]
  // );

  //  //cart
  // static final CartModel cart =  CartModel(
  //   cartId: '001',
  //   items: [
  //     CartItemModel(
  //       productId: '001',
  //       variationId: '1',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       brandname: products[0].brand!.name,
  //       price: products[0].productVariations![0].attributeValues,
  //    ),
  //    CartItemModel(
  //       productId: '002',
  //       variationId: '2',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       brandname: products[0].brand!.name,
  //       price: products[0].productVariations![0].attributeValues,
  //    ),
  //   ]
  // );

  //  // Order
  // static final List<OrderModel> orders = [
  //   OrderModel(
  //     id:'CWT0012',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmount: 265,
  //     orderDate: DateTime(2023, 09, 1),
  //     deliveryDate: DateTime(2023, 09, 9),
  //   ),
  //    OrderModel(
  //     id:'CWT0012',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmount: 265,
  //     orderDate: DateTime(2023, 09, 1),
  //     deliveryDate: DateTime(2023, 09, 9),
  //   ),
  // ];

  //Baneers
  static List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: TImages.sports, isFeatured: true),
    CategoryModel(
        id: '5', name: 'Furniture', image: TImages.furniture, isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Electronics',
        image: TImages.electronics,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Clothes', image: TImages.clothes, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Animals', image: TImages.animals, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Cosmetics', image: TImages.cosmetics, isFeatured: true),
    CategoryModel(
        id: '7', name: 'Jewelery', image: TImages.jewelery, isFeatured: true),
    CategoryModel(
        id: '14', name: 'Shoes', image: TImages.sneakers, isFeatured: true),

    //subCategories
    CategoryModel(
        id: '8',
        name: 'Sport Shoes',
        image: TImages.sneakers,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '9',
        name: 'Track Suites',
        image: TImages.jacket,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '10',
        name: 'Sports Equipments',
        image: TImages.sneakers,
        isFeatured: false,
        parentId: '1'),

    //furniture
    CategoryModel(
        id: '11',
        name: 'Office furniture',
        image: TImages.furniture,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '12',
        name: 'Kitchen furniture',
        image: TImages.furniture,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '13',
        name: 'Bedroom furniture',
        image: TImages.furniture,
        isFeatured: false,
        parentId: '5'),

    //electronics

    CategoryModel(
        id: '14',
        name: 'Laptop',
        image: TImages.electronics,
        isFeatured: false,
        parentId: '2'),
    CategoryModel(
        id: '12',
        name: 'Mobile',
        image: TImages.electronics,
        isFeatured: false,
        parentId: '2'),

    CategoryModel(
        id: '16',
        name: 'shirts',
        image: TImages.jacket,
        isFeatured: false,
        parentId: '3'),
  ];

  //List of all products
  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green Nike Sports Shoe',
        stock: 15,
        price: 1000,
        isFeatured: true,
        thumbnail: TImages.jacket,
        description: 'Green Nike sports Shoe',
        brand: BrandModel(
            id: '1',
            image: TImages.nike1,
            name: 'Nike',
            productsCount: 265,
            isFeatured: true),
        images: [
          TImages.jacket,
          TImages.shoe,
          TImages.google,
          TImages.jacket,
          TImages.jacket
        ],
        salePrice: 1000,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.8,
              image: TImages.sneakers,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '002',
        title: 'Green Nike Sports Shoe',
        stock: 15,
        price: 500,
        isFeatured: true,
        thumbnail: TImages.sneakers,
        description: 'Green Nike sports Shoe',
        brand: BrandModel(
            id: '1',
            image: TImages.clothes,
            name: 'Nike',
            productsCount: 265,
            isFeatured: true),
        images: [
          TImages.jacket,
          TImages.shoe,
          TImages.google,
          TImages.clothes,
          TImages.cosmetics
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.8,
              image: TImages.sneakers,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '003',
        title: 'Green Nike Sports Shoe',
        stock: 15,
        price: 200,
        isFeatured: true,
        thumbnail: TImages.shoe,
        description: 'Green Nike sports Shoe',
        brand: BrandModel(
            id: '1',
            image: TImages.nike1,
            name: 'Nike',
            productsCount: 265,
            isFeatured: true),
        images: [TImages.jacket, TImages.shoe, TImages.google],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.8,
              image: TImages.sneakers,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '004',
        title: 'Green Nike Sports Shoe',
        stock: 15,
        price: 80,
        isFeatured: true,
        thumbnail: TImages.sports,
        description: 'Green Nike sports Shoe',
        brand: BrandModel(
            id: '1',
            image: TImages.nike1,
            name: 'Ball',
            productsCount: 265,
            isFeatured: true),
        images: [
          TImages.jacket,
          TImages.shoe,
          TImages.google,
          TImages.electronics,
          TImages.jewelery
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.8,
              image: TImages.sneakers,
              description:
                  'This is a product description for Green Nike Sport Shoe',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        ],
        productType: 'ProductType.single'),
  ];
}