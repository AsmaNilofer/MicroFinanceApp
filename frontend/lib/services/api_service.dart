import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/loan.dart';

class ApiService {
  final String baseUrl = "http://10.0.2.2:8080/api/users";
  final String baseUrl1 = "http://10.0.2.2:8080/api/loans";


  Future<User> addUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/add'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to add user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to add user: $e');
    }
  }

  Future<User> updateUser(int id, User user) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/update/$id'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to update user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  Future<List<User>> getAllUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/view/customers'));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic item) => User.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load users. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }

  Future<List<User>> getAllAgents() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/view/agents'));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic item) => User.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load users. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }

  Future<User> getUserById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/view/$id'));

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load user: $e');
    }
  }

  Future<String> deleteUser(int userId) async {
    final url = Uri.parse('$baseUrl/delete/$userId'); // API endpoint for deleting a user

    final response = await http.delete(url);

    if (response.statusCode == 200) {
      // User deleted successfully
      return "Deleted Successfully";
    } else {
      // Failed to delete user, handle the error
      throw Exception('Failed to delete user');
    }
  }

  Future<List<Loan>> getAllLoans() async {
    final response = await http.get(Uri.parse('$baseUrl1/view/all'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Loan.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load loans');
    }
  }

  Future<List<Loan>> getLoansByStatus(String status) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl1/view/status/$status'));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic item) => Loan.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load loans. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load loans: $e');
    }
  }

  Future<Loan> applyLoan(Loan loan) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl1/add'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(loan.toJson()),
      );

      if (response.statusCode == 200) {
        return Loan.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to apply for loan. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to apply for loan: $e');
    }
  }



}


