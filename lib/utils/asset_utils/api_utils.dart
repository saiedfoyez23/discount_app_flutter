class ApiUtils {

  //static const baseUrl = "http://206.162.244.133:5020/api/v1";
  static const baseUrl = "http://72.244.153.29:5001/api/v1";
  static const socketUrl = "http://72.244.153.29:4020/";
  //static const baseUrl = "http://10.10.10.16:5020/api/v1";


  //user
  static const String createPaymentResponse = "$baseUrl/payments/create-payment-session"; //done
  static const String createOrderResponse = "$baseUrl/orders";//done
  static const String riderProfile = "$baseUrl/riders/profile";//done
  static String riderProfileUpdate(String riderId) {
    return "$baseUrl/riders/$riderId";
  }
  static String riderProfileDelete(String riderId) {
    return "$baseUrl/riders/$riderId";
  }
  static const String riderChangePassword = "$baseUrl/auth/change-password";
  static const String billingAddress = "$baseUrl/billing-address";
  static const String shippingAddress = "$baseUrl/shipping-address";

  static const String vendorsProfile = "$baseUrl/vendors/profile";//done


}