class FormValidation {
  String formName;
  String filedName;
  String fuid;
  int iSEnable;
  int isVisible;
  int isNeedValidation;
  String remarks;
  int isActive;

  FormValidation(
      {this.formName,
      this.filedName,
      this.fuid,
      this.iSEnable,
      this.isVisible,
      this.isNeedValidation,
      this.remarks,
      this.isActive});

  FormValidation.fromJson(Map<String, dynamic> json) {
    formName = json['formName'];
    filedName = json['filedName'];
    fuid = json['fuid'];
    iSEnable = json['iSEnable'];
    isVisible = json['isVisible'];
    isNeedValidation = json['isNeedValidation'];
    remarks = json['Remarks'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['formName'] = this.formName;
    data['filedName'] = this.filedName;
    data['fuid'] = this.fuid;
    data['iSEnable'] = this.iSEnable;
    data['isVisible'] = this.isVisible;
    data['isNeedValidation'] = this.isNeedValidation;
    data['Remarks'] = this.remarks;
    data['isActive'] = this.isActive;
    return data;
  }
}
