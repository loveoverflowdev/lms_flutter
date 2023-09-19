class ApiUris {
  static const baseApiUrl = "http://localhost:8080/api/v1";

  // Courses
  static const topCourseListUrl = "$baseApiUrl/courses/top";

  // Auth
  static const customerLoginUrl = "$baseApiUrl/authentication/customer/login";
  static const customerSignupUrl =
      "$baseApiUrl/authentication/customer/register";
}
