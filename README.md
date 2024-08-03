
# Alumni Job Referral App with ML Skill Finder

Built using Flutter, Dart, Fast API

***Abstract***

The Alumni Job Refer App is a comprehensive platform designed to facilitate the exchange of job and internship opportunities between alumni and current students while also providing a personalized career recommendation system powered by machine learning. It comprises three key components, namely routes, db, and auth.

The app leverages FastAPI, a modern web framework for building efficient APIs. It integrates MongoDB as the database solution, providing a scalable and flexible storage system for user data and job-related information.

By combining these components, the app offers a secure and user-friendly platform for alumni to share job opportunities and for students to explore potential career paths. The machine learning model integrated into the API enables personalized career recommendations based on individual skills and interests, empowering students to make informed decisions about their professional trajectories.

Career choice has a pivotal role in college students' lives. In today's world, choosing the right career is one of the toughest decisions. Many students possess skills but are unable to identify their abilities and proper domain. Different people suggest different career options, but ultimately, the student has to select their career path. This project focuses on solving this problem using machine learning techniques that are integrated into our app.

With the help of machine learning, the app aims to assist students in deciding the best career option and domain based on their academic information. This project will help students get directed towards a specific domain as per their skills and interests.

To develop a system that will predict one's skill based on both academic and psychometric factors, the classification algorithm KNeighborsClassifier can be employed in our app, as it provides a high accuracy rate.

Overall, the Alumni Job Refer App aims to strengthen the connection between alumni and current students, helping students find their skills based on their interests and access valuable employment prospects within the collegiate community.

***HARDWARE REQUIREMENTS:***

- Minimum 8GB of RAM in laptop or PC with 256GB of storage.
- Android Phone for testing.

***SOFTWARE REQUIREMENTS:***
- Android Studio
- Flutter SDK
- FastAPI
- MongoDB
- GitHub
- GitHub Actions
- Git
- VS Code





 


## For the Backend code, check out the below repository
    
[Alumni Job Referral App Backend Code](https://github.com/WebX-Divin/alumini_job_refer_app_backend)


## Test it on your real devices

Before clonning this repository, make sure to install the flutter sdk in your machine and then clone the project

```bash
  git clone https://github.com/WebX-Divin/alumini_job_refer_app.git
```

1. Go to the project directory

```bash
  cd alumini_job_refer_app
```

2. Install dependencies

```bash
  flutter pub get
```

3. To test it on IDEs, Start the emulator if it is Windows or start the Simulator if it is Mac

4. Build an apk for Android Devices

```bash
  flutter build apl --split-per-abi
```
The above command generates three apk files. These apk's are smaller in size, where the user needs to download the respective build according to their android kernel level configuration.

5. Android build command which is suitable for all android devices but the size of the apk is higher compared to the previous build command

```bash
    flutter build apk
```


## License

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)


## For queries

Email at projectwithdivin@gmail.com 

