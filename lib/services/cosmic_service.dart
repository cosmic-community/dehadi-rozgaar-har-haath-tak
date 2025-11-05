import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/job_category.dart';
import '../models/community_group.dart';

class CosmicService {
  final String _bucketSlug = dotenv.env['COSMIC_BUCKET_SLUG'] ?? '';
  final String _readKey = dotenv.env['COSMIC_READ_KEY'] ?? '';
  
  Future<List<JobCategory>> fetchJobCategories() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.cosmicjs.com/v3/buckets/$_bucketSlug/objects?query={"type":"job-categories"}'),
        headers: {
          'Authorization': 'Bearer $_readKey',
        },
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['objects'] as List)
            .map((obj) => JobCategory.fromJson(obj))
            .toList();
      }
      return [];
    } catch (error) {
      return [];
    }
  }
  
  Future<List<CommunityGroup>> fetchCommunityGroups() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.cosmicjs.com/v3/buckets/$_bucketSlug/objects?query={"type":"community-groups"}'),
        headers: {
          'Authorization': 'Bearer $_readKey',
        },
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['objects'] as List)
            .map((obj) => CommunityGroup.fromJson(obj))
            .toList();
      }
      return [];
    } catch (error) {
      return [];
    }
  }
  
  Future<Map<String, dynamic>> fetchAppConfiguration() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.cosmicjs.com/v3/buckets/$_bucketSlug/objects?query={"type":"app-configuration"}'),
        headers: {
          'Authorization': 'Bearer $_readKey',
        },
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['objects'] != null && (data['objects'] as List).isNotEmpty) {
          return data['objects'][0]['metadata'] ?? {};
        }
      }
      return {};
    } catch (error) {
      return {};
    }
  }
}