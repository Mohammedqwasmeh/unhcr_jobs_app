class Job {
  Job({
    required this.jobId,
    required this.title,
    required this.company,
    required this.location,
    required this.description,
    required this.longDescription,
    required this.salary,
    required this.datePosted,
    required this.imageUrl,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        jobId: json['job_id'] as String,
        title: json['title'] as String,
        company: json['company'] as String,
        location: json['location'] as String,
        description: json['description'] as String,
        longDescription: json['long_description'] as String,
        salary: json['salary'] as String,
        datePosted: json['date_posted'] as String,
        imageUrl: json['image_url'] as String,
      );

  Map<String, dynamic> toJson() => {
        'job_id': jobId,
        'title': title,
        'company': company,
        'location': location,
        'description': description,
        'long_description': longDescription,
        'salary': salary,
        'date_posted': datePosted,
        'image_url': imageUrl,
      };

  String jobId;
  String title;
  String company;
  String location;
  String description;
  String longDescription;
  String salary;
  String datePosted;
  String imageUrl;
}
