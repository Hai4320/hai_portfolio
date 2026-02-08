import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hai_portfolio/data/repository/web_info_helper.dart'
    if (dart.library.html) 'package:hai_portfolio/data/repository/web_info_helper_web.dart'
    as web_helper;

class ViewerRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String _visitsCollection = 'visits';

  /// Log visit and return total visit count
  Future<int> incrementViewerCount() async {
    try {
      // Log visit details
      await _logVisit();

      // Return total count
      return await getViewerCount();
    } catch (e) {
      debugPrint('Error incrementing viewer count: $e');
      return 0;
    }
  }

  /// Log visit information
  Future<void> _logVisit() async {
    try {
      final visitData = _getVisitInfo();
      await _firestore.collection(_visitsCollection).add(visitData);
    } catch (e) {
      debugPrint('Error logging visit: $e');
    }
  }

  /// Get visitor information
  Map<String, dynamic> _getVisitInfo() {
    final now = DateTime.now();
    final webInfo = web_helper.getWebInfo();

    return {
      'timestamp': FieldValue.serverTimestamp(),
      'localTime': now.toIso8601String(),
      'timezone': now.timeZoneName,
      'timezoneOffset': now.timeZoneOffset.inHours,
      ...webInfo,
    };
  }

  /// Get current viewer count (total documents in visits collection)
  Future<int> getViewerCount() async {
    try {
      final snapshot = await _firestore.collection(_visitsCollection).count().get();
      return snapshot.count ?? 0;
    } catch (e) {
      debugPrint('Error getting viewer count: $e');
      return 0;
    }
  }

  /// Stream viewer count for real-time updates
  Stream<int> streamViewerCount() {
    return _firestore.collection(_visitsCollection).snapshots().map((snapshot) => snapshot.docs.length);
  }

  /// Get recent visits (for admin/analytics)
  Future<List<Map<String, dynamic>>> getRecentVisits({int limit = 50}) async {
    try {
      final snapshot = await _firestore
          .collection(_visitsCollection)
          .orderBy('timestamp', descending: true)
          .limit(limit)
          .get();

      return snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
    } catch (e) {
      debugPrint('Error getting recent visits: $e');
      return [];
    }
  }

  /// Get visit statistics
  Future<Map<String, dynamic>> getVisitStats() async {
    try {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final thisWeek = today.subtract(const Duration(days: 7));
      final thisMonth = DateTime(now.year, now.month, 1);

      // Get total count
      final totalSnapshot = await _firestore.collection(_visitsCollection).count().get();
      final totalCount = totalSnapshot.count ?? 0;

      // Get today's visits
      final todaySnapshot = await _firestore
          .collection(_visitsCollection)
          .where('timestamp', isGreaterThanOrEqualTo: Timestamp.fromDate(today))
          .count()
          .get();

      // Get this week's visits
      final weekSnapshot = await _firestore
          .collection(_visitsCollection)
          .where('timestamp', isGreaterThanOrEqualTo: Timestamp.fromDate(thisWeek))
          .count()
          .get();

      // Get this month's visits
      final monthSnapshot = await _firestore
          .collection(_visitsCollection)
          .where('timestamp', isGreaterThanOrEqualTo: Timestamp.fromDate(thisMonth))
          .count()
          .get();

      return {
        'total': totalCount,
        'today': todaySnapshot.count ?? 0,
        'thisWeek': weekSnapshot.count ?? 0,
        'thisMonth': monthSnapshot.count ?? 0,
      };
    } catch (e) {
      debugPrint('Error getting visit stats: $e');
      return {'total': 0, 'today': 0, 'thisWeek': 0, 'thisMonth': 0};
    }
  }
}
