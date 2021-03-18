class AgendaItem
{
  String title;
  bool isDone;
  String detailDocumentPath;
  
  AgendaItem({
    this.title  = "",
    this.isDone = false,
    this.detailDocumentPath = "",
  })
  {
    print("new AgendaItem "+title);
  }
  factory AgendaItem.fromJson(Map<String, dynamic> json) => AgendaItem(
        title: json["title"],
        detailDocumentPath: json["document"],
    );
}