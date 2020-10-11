class SaveData {
  int nbLevel;
  int nbWin;
  int nbLose;

  SaveData({this.nbLose, this.nbWin, this.nbLevel});

  SaveData.fromJson(Map<String, dynamic> json)
      : nbLevel = json['nbLevel'],
        nbWin = json['nbWin'],
        nbLose = json['nbLose'];

  Map<String, dynamic> toJson() =>
      {
        'nbLevel': nbLevel,
        'nbWin': nbWin,
        'nbLose': nbLose,
      };

  String customToString() {
    return "SaveData, nbLevel: " + this.nbLevel.toString() + " , nbLose: " + this.nbLose.toString() +" , nbWin: " + this.nbWin.toString();
  }
}