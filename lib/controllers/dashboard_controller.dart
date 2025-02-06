import 'package:assessment/apis/apicalls.dart';
import 'package:assessment/controllers/login_controller.dart';
import 'package:get/get.dart';

UserController controller = Get.put(UserController());

class DashboardController extends GetxController {
  var message = ''.obs;
  var secret = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getToken();
    fetchDashboardData();
  }

  Future<void> fetchDashboardData() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final response = await ApiService().getDashboardData(token.value);
      if (response.status) {
        message.value = response.message;
        secret.value = response.secret ?? '';
        print(secret.value);
      } else {
        errorMessage.value = response.message;
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  getToken() {
    token = controller.token;
  }
}
