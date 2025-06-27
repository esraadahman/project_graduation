/// Models for Group Members API response

class GroupMembers {
  final bool status;
  final List<Member> members;

  GroupMembers({
    required this.status,
    required this.members,
  });

  factory GroupMembers.fromJson(Map<String, dynamic> json) {
    return GroupMembers(
      status: json['status'] as bool,
      members: (json['members'] as List<dynamic>)
          .map((e) => Member.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Member {
  final int id;
  final String name;
  final String? avatar;

  Member({
    required this.id,
    required this.name,
    this.avatar,
  });

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      id: map['id'] as int,
      name: map['name'] as String,
      avatar: map['avatar'] as String?,
    );
  }
}

// class Member {
//   final int id;
//   final String name;
//   final String email;
//   final DateTime? emailVerifiedAt;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final String type;
//   final String? phone;
//   final int? userId;
//   final String? avatar;
//   final Pivot pivot;

//   Member({
//     required this.id,
//     required this.name,
//     required this.email,
//     this.emailVerifiedAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.type,
//     this.phone,
//     this.userId,
//     this.avatar,
//     required this.pivot,
//   });

//   factory Member.fromMap(Map<String, dynamic> map) {
//     return Member(
//       id: map['id'] as int,
//       name: map['name'] as String,
//       email: map['email'] as String,
//       emailVerifiedAt: map['email_verified_at'] != null
//           ? DateTime.parse(map['email_verified_at'] as String)
//           : null,
//       createdAt: DateTime.parse(map['created_at'] as String),
//       updatedAt: DateTime.parse(map['updated_at'] as String),
//       type: map['type'] as String,
//       phone: map['phone'] as String?,
//       userId: map['user_id'] as int?,
//       avatar: map['avatar'] as String ? ,
//       pivot: Pivot.fromMap(map['pivot'] as Map<String, dynamic>),
//     );
//   }
// }

// class Pivot {
//   final int groupId;
//   final int userId;
//   final String position;

//   Pivot({
//     required this.groupId,
//     required this.userId,
//     required this.position,
//   });

//   factory Pivot.fromMap(Map<String, dynamic> map) {
//     return Pivot(
//       groupId: map['group_id'] as int,
//       userId: map['user_id'] as int,
//       position: map['position'] as String,
//     );
//   }
// }
