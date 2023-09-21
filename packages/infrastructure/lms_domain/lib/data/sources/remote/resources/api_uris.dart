class ApiUris {
  static const base = "http://localhost:8080/api/v1";

  // Courses
  static const topCourseList = "$base/courses/top";
  static const course = "$base/course";

  // Auth
  static const customerLogin = "$base/authentication/customer/login";
  static const customerSignup = "$base/authentication/customer/register";

  // Customer
  static const courseInCustomerCart = '$base/customer-cart/course';
  static const courseListInCustomerCart = '$base/customer-cart/course-list';

  // Admin
}
