class ApiUtils {

  //static const baseUrl = "http://206.162.244.133:5020/api/v1";
  static const baseUrl = "http://72.244.153.29:5001/api/v1";
  static const socketUrl = "http://72.244.153.29:5001/";
  //static const baseUrl = "http://10.10.10.16:5020/api/v1";


  //user
  static const String createPaymentResponse = "$baseUrl/payments/create-payment-session"; //done
  static const String createCheckoutSession = "$baseUrl/subscriptions/create-checkout-session"; //done
  static const String createOrderResponse = "$baseUrl/orders";//done
  static const String riderProfile = "$baseUrl/riders/profile";//done
  static const String brokersProfile = "$baseUrl/brokers/profile";//done
  static String riderProfileUpdate(String riderId) {
    return "$baseUrl/riders/$riderId";
  }
  static String riderProfileDelete(String riderId) {
    return "$baseUrl/riders/$riderId";
  }
  static String vendorProfileUpdate(String vendorId) {
    return "$baseUrl/vendors/$vendorId";
  }
  static String vendorProfileDelete(String vendorId) {
    return "$baseUrl/vendors/$vendorId";
  }
  static String productDetails(String productId) {
    return "$baseUrl/products/$productId";
  }
  static String productEdit(String productId) {
    return "$baseUrl/products/$productId";
  }
  static String productDelete(String productId) {
    return "$baseUrl/products/$productId";
  }
  static String storeWiseProduct(String storeId) {
    return "$baseUrl/products?sort=-ratings&store=${storeId}";
  }
  static String categoryWiseProduct(String storeId,String categoryId) {
    return "$baseUrl/products?sort=-ratings&store=${storeId}&category=${categoryId}";
  }
  static String editBrokerProfile(String brokersId) {
    return "$baseUrl/brokers/${brokersId}";
  }

  static const String getAllSetting = "$baseUrl/settings";


  static const String riderChangePassword = "$baseUrl/auth/change-password";
  static const String billingAddress = "$baseUrl/billing-address";
  static const String shippingAddress = "$baseUrl/shipping-address";
  static const String categoriesResponse = "$baseUrl/categories";
  static const String vendorsProfile = "$baseUrl/vendors/profile";//done


}