class Todo{
   String title;
   DateTime dateTime;

  Todo({
      required this.title,
      required this.dateTime
});
 Map<String, dynamic> toJson(){
  return{
    'title': title,
    'dateTime':dateTime.toIso8601String()

  };
}
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }




}