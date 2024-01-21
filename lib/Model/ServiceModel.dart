class ServiceModel {
  String? jsonrpc;
  Null? id;
  Result? result;

  ServiceModel({this.jsonrpc, this.id, this.result});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jsonrpc'] = this.jsonrpc;
    data['id'] = this.id;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  bool? status;
  String? message;
  Data? data;

  Result({this.status, this.message, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Facilities>? facilities;

  Data({this.facilities});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['facilities'] != null) {
      facilities = <Facilities>[];
      json['facilities'].forEach((v) {
        facilities!.add(new Facilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.facilities != null) {
      data['facilities'] = this.facilities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Facilities {
  int? recordId;
  String? facilityNumber;
  String? name;
  String? phone;
  String? street;
  String? street2;
  String? city;
  String? zip;
  String? state;
  String? country;
  String? territory;
  String? county;
  String? facilityStatus;
  List<ServiceRequests>? serviceRequests;

  Facilities(
      {this.recordId,
        this.facilityNumber,
        this.name,
        this.phone,
        this.street,
        this.street2,
        this.city,
        this.zip,
        this.state,
        this.country,
        this.territory,
        this.county,
        this.facilityStatus,
        this.serviceRequests});

  Facilities.fromJson(Map<String, dynamic> json) {
    recordId = json['record_id'];
    facilityNumber = json['facility_number'];
    name = json['name'];
    phone = json['phone'];
    street = json['street'];
    street2 = json['street2'];
    city = json['city'];
    zip = json['zip'];
    state = json['state'];
    country = json['country'];
    territory = json['territory'];
    county = json['county'];
    facilityStatus = json['facility_status'];
    if (json['service_requests'] != null) {
      serviceRequests = <ServiceRequests>[];
      json['service_requests'].forEach((v) {
        serviceRequests!.add(new ServiceRequests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['record_id'] = this.recordId;
    data['facility_number'] = this.facilityNumber;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['street'] = this.street;
    data['street2'] = this.street2;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['state'] = this.state;
    data['country'] = this.country;
    data['territory'] = this.territory;
    data['county'] = this.county;
    data['facility_status'] = this.facilityStatus;
    if (this.serviceRequests != null) {
      data['service_requests'] =
          this.serviceRequests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceRequests {
  String? caseId;
  String? requestIntakeDate;
  String? isHomePatient;
  String? serviceRequestAppointment;
  String? srEta;
  int? recordId;
  String? caseStatus;
  double? distance;
  double? completionPercentageCalculation;
  bool? pause;
  double? timeTaken;
  bool? isLock;
  String? srLockedBy;
  String? caseRequestCompletionDate;
  String? roomNo;
  String? mrnNo;
  String? serviceRequestDate;
  String? serviceRequestTime;
  String? reportedTo;
  String? requesterName;
  bool? isVerifiedPdf;
  Patient? patient;
  List<ProcedureDetails>? procedureDetails;
  List<Clinicians>? clinicians;

  ServiceRequests(
      {this.caseId,
        this.requestIntakeDate,
        this.isHomePatient,
        this.serviceRequestAppointment,
        this.srEta,
        this.recordId,
        this.caseStatus,
        this.distance,
        this.completionPercentageCalculation,
        this.pause,
        this.timeTaken,
        this.isLock,
        this.srLockedBy,
        this.caseRequestCompletionDate,
        this.roomNo,
        this.mrnNo,
        this.serviceRequestDate,
        this.serviceRequestTime,
        this.reportedTo,
        this.requesterName,
        this.isVerifiedPdf,
        this.patient,
        this.procedureDetails,
        this.clinicians});

  ServiceRequests.fromJson(Map<String, dynamic> json) {
    caseId = json['case_id'];
    requestIntakeDate = json['request_intake_date'];
    isHomePatient = json['is_home_patient'];
    serviceRequestAppointment = json['service_request_appointment'];
    srEta = json['sr_eta'];
    recordId = json['record_id'];
    caseStatus = json['case_status'];
    distance = json['distance'];
    completionPercentageCalculation = json['completion_percentage_calculation'];
    pause = json['pause'];
    timeTaken = json['time_taken'];
    isLock = json['is_lock'];
    srLockedBy = json['sr_locked_by'];
    caseRequestCompletionDate = json['case_request_completion_date'];
    roomNo = json['room_no'];
    mrnNo = json['mrn_no'];
    serviceRequestDate = json['service_request_date'];
    serviceRequestTime = json['service_request_time'];
    reportedTo = json['reported_to'];
    requesterName = json['requester_name'];
    isVerifiedPdf = json['is_verified_pdf'];
    patient =
    json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
    if (json['procedure_details'] != null) {
      procedureDetails = <ProcedureDetails>[];
      json['procedure_details'].forEach((v) {
        procedureDetails!.add(new ProcedureDetails.fromJson(v));
      });
    }
    if (json['Clinicians'] != null) {
      clinicians = <Clinicians>[];
      json['Clinicians'].forEach((v) {
        clinicians!.add(new Clinicians.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['case_id'] = this.caseId;
    data['request_intake_date'] = this.requestIntakeDate;
    data['is_home_patient'] = this.isHomePatient;
    data['service_request_appointment'] = this.serviceRequestAppointment;
    data['sr_eta'] = this.srEta;
    data['record_id'] = this.recordId;
    data['case_status'] = this.caseStatus;
    data['distance'] = this.distance;
    data['completion_percentage_calculation'] =
        this.completionPercentageCalculation;
    data['pause'] = this.pause;
    data['time_taken'] = this.timeTaken;
    data['is_lock'] = this.isLock;
    data['sr_locked_by'] = this.srLockedBy;
    data['case_request_completion_date'] = this.caseRequestCompletionDate;
    data['room_no'] = this.roomNo;
    data['mrn_no'] = this.mrnNo;
    data['service_request_date'] = this.serviceRequestDate;
    data['service_request_time'] = this.serviceRequestTime;
    data['reported_to'] = this.reportedTo;
    data['requester_name'] = this.requesterName;
    data['is_verified_pdf'] = this.isVerifiedPdf;
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    if (this.procedureDetails != null) {
      data['procedure_details'] =
          this.procedureDetails!.map((v) => v.toJson()).toList();
    }
    if (this.clinicians != null) {
      data['Clinicians'] = this.clinicians!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Patient {
  String? patientNumber;
  String? name;
  String? dob;
  int? age;
  int? ageInMonth;
  String? street;
  String? street2;
  String? state;
  String? city;
  String? country;
  String? zip;
  int? recordId;
  String? prefix;
  String? suffix;
  String? middleName;
  String? lastName;
  String? alias;
  String? phoneNumber;
  String? language;

  Patient(
      {this.patientNumber,
        this.name,
        this.dob,
        this.age,
        this.ageInMonth,
        this.street,
        this.street2,
        this.state,
        this.city,
        this.country,
        this.zip,
        this.recordId,
        this.prefix,
        this.suffix,
        this.middleName,
        this.lastName,
        this.alias,
        this.phoneNumber,
        this.language});

  Patient.fromJson(Map<String, dynamic> json) {
    patientNumber = json['patient_number'];
    name = json['name'];
    dob = json['dob'];
    age = json['age'];
    ageInMonth = json['age_in_month'];
    street = json['street'];
    street2 = json['street2'];
    state = json['state'];
    city = json['city'];
    country = json['country'];
    zip = json['zip'];
    recordId = json['record_id'];
    prefix = json['prefix'];
    suffix = json['suffix'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    alias = json['alias'];
    phoneNumber = json['phone_number'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient_number'] = this.patientNumber;
    data['name'] = this.name;
    data['dob'] = this.dob;
    data['age'] = this.age;
    data['age_in_month'] = this.ageInMonth;
    data['street'] = this.street;
    data['street2'] = this.street2;
    data['state'] = this.state;
    data['city'] = this.city;
    data['country'] = this.country;
    data['zip'] = this.zip;
    data['record_id'] = this.recordId;
    data['prefix'] = this.prefix;
    data['suffix'] = this.suffix;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['alias'] = this.alias;
    data['phone_number'] = this.phoneNumber;
    data['language'] = this.language;
    return data;
  }
}

class ProcedureDetails {
  String? name;
  String? status;
  String? cancelReasonOther;
  String? cancelMomentOther;
  String? startTime;
  String? endTime;
  String? startBy;
  String? endBy;
  String? pauseTime;
  int? recordId;
  String? procedureNumber;
  String? site;
  String? side;
  String? side2;
  String? vein;
  String? catheterLength;
  String? extLength;
  String? macMtc;

  ProcedureDetails(
      {this.name,
        this.status,
        this.cancelReasonOther,
        this.cancelMomentOther,
        this.startTime,
        this.endTime,
        this.startBy,
        this.endBy,
        this.pauseTime,
        this.recordId,
        this.procedureNumber,
        this.site,
        this.side,
        this.side2,
        this.vein,
        this.catheterLength,
        this.extLength,
        this.macMtc});

  ProcedureDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = json['status'];
    cancelReasonOther = json['cancel_reason_other'];
    cancelMomentOther = json['cancel_moment_other'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    startBy = json['start_by'];
    endBy = json['end_by'];
    pauseTime = json['pause_time'];
    recordId = json['record_id'];
    procedureNumber = json['procedure_number'];
    site = json['site'];
    side = json['side'];
    side2 = json['side2'];
    vein = json['vein'];
    catheterLength = json['catheter_length'];
    extLength = json['ext_length'];
    macMtc = json['mac_mtc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['status'] = this.status;
    data['cancel_reason_other'] = this.cancelReasonOther;
    data['cancel_moment_other'] = this.cancelMomentOther;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['start_by'] = this.startBy;
    data['end_by'] = this.endBy;
    data['pause_time'] = this.pauseTime;
    data['record_id'] = this.recordId;
    data['procedure_number'] = this.procedureNumber;
    data['site'] = this.site;
    data['side'] = this.side;
    data['side2'] = this.side2;
    data['vein'] = this.vein;
    data['catheter_length'] = this.catheterLength;
    data['ext_length'] = this.extLength;
    data['mac_mtc'] = this.macMtc;
    return data;
  }
}

class Clinicians {
  int? userId;
  int? clinicianId;
  String? name;
  String? role;
  String? state;
  String? signatureUrl;
  bool? locked;
  bool? didNotAttemptFlag;
  String? profilePic;
  int? recordId;

  Clinicians(
      {this.userId,
        this.clinicianId,
        this.name,
        this.role,
        this.state,
        this.signatureUrl,
        this.locked,
        this.didNotAttemptFlag,
        this.profilePic,
        this.recordId});

  Clinicians.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    clinicianId = json['clinician_id'];
    name = json['name'];
    role = json['role'];
    state = json['state'];
    signatureUrl = json['signature_url'];
    locked = json['locked'];
    didNotAttemptFlag = json['did_not_attempt_flag'];
    profilePic = json['profile_pic'];
    recordId = json['record_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['clinician_id'] = this.clinicianId;
    data['name'] = this.name;
    data['role'] = this.role;
    data['state'] = this.state;
    data['signature_url'] = this.signatureUrl;
    data['locked'] = this.locked;
    data['did_not_attempt_flag'] = this.didNotAttemptFlag;
    data['profile_pic'] = this.profilePic;
    data['record_id'] = this.recordId;
    return data;
  }
}
