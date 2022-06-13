---
layout: page

title: DesparadosAEye

hidden:
redirect:
category: [school]
importance: 1

date: 2021-01-01 #  YYYY-MM-DD, must be specified
start: 2021-01-01
end: 2021-05-08
display_date: # used instead of `date` or date range

img: /assets/img/desparados_3.png
github: kmosoti/DesparadosAEYE # uname/repo, don't include the prefix `https://github.com/`

description: Project manager, general app developer, and ML engineer for a 5-person group developing open-ended Android chatbot
bullet_points: | # at least two bullet points
    - Stack: blender-bot, Kotlin, Java, SQLite, Android
    - Full-stack ML project involving [research & training](https://github.com/kmosoti/DesparadosAEYE/blob/main/ConversationAIipynb.ipynb), presenting at UTA Innovation Day 2021, and [porting Facebook's blender-bot model to tflite](https://huggingface.co/jacob-valdez/blenderbot-small-tflite)
---

<div class="row justify-content-sm-center">
    <div class="col-sm-4 mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/desparados_3.png' | relative_url }}" alt="" title="example image"/>
    </div>
    <div class="col-sm-4 mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="https://raw.githubusercontent.com/JacobFV/DesparadosAEYE/main/content/images/demo.gif" alt="" title="example image"/>
    </div>
</div>

Designing, training, selecting, compiling, and deploying a 335-million parameter state-of-the-art neural network chatbot to ordinary Android phones is not easy. This project formally began with the goal of developing a chatbot Android application, but we wanted to do things differently. You see, most mobile chatbot applications rely on an Internet service to host the actual intelligent backend. It's relatively easy nowdays to run GPT-2 in the cloud. However, these approaches have their limitations: 1) someone has to pay for all the power, 2) you have to protect your users' data, and 3) there's a whole lot of virtual infrastructure to manage. In recent years, [TensorFlow Lite](https://www.tensorflow.org/lite) has progressively allowed deploying more advanced machine learning models to mobile devices. These observations all came togethor in a semester-long undergraduate class project where our team &mdash; Kennedy Mosoti, Chance Huddleston, Adam Khalaf, Payton Parrish, and myself &mdash; learned and worked to develop an Android chatbot application.

However, this project _actually_ began with the observation that fully utilizing large language models kind of requires 'getting to know' them. Let me explain what I mean: If you talk to [Blenderbot Small](https://huggingface.co/facebook/blenderbot_small-90M), you'll quickly notice that it has quite natural responses in a few domains, but ask the wrong question and you'll see it has no idea what response you're expecting. This is true of all qualitatively studied language models so far. Around this time, I learned that CSE3310 featured a semester long choose-your-own mobile app development project &mdash; the perfect oppurtunity to develop a human AI chatbot!

After talking with several of my classmates, I asked six of my peers if they would like to work togethor. The four I mentioned above agreed and by the weekend, we had formalized a development plan. Adam and Payton worked on the login screen and app icon; Chance and Kennedy developed the core application and backend data model; and I developed the conversation interface and its ML backend.

<div class="row justify-content-sm-center">
    <div class="col-sm-4 mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/desparados_1.png' | relative_url }}" alt="" title="example image"/>
    </div>
    <div class="col-sm-4 mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/desparados_2.png' | relative_url }}" alt="" title="example image"/>
    </div>
</div>

I think all of us expected things to go faster than they really did. But by early April, the unknown unknowns were begining to surface. I thank all my team members &mdash; especially Kennedy &mdash; for enduring through this part with patience even though the due date was fast approaching. Deep learning isn't as plug-and-play as keras makes it seem. I mean, I tried fusing a transformer and bidirectional lstm togethor, but it kept diverging during training. Next, I attempted 'neural network surgery' by initializing a custom transformer with matrices from BERT, but that also had problem. Google Colab was starting to throttle my connection since I had used it so much, so in the end, I just settled for Facebook's Blenderbot-small and compiled it from the Huggingface `transformers` library tensorflow model to a tflite format[^1]

[^1]: You can download the tflite model [here](https://huggingface.co/jacob-valdez/blenderbot-small-tflite)

Our app was finished on May 6, 2021 with 1 hour to spare. We had developed the world's first application, to my knowledge, that uses blenderbot for on-device mobile chatting. You can view our final app on Github [here](https://github.com/JacobFV/DesparadosAEYE) and an intermediate presentation [here](https://uta.engineering/innovationday/project.php?p=57&h=06ec4e3de78466dd0a823ddf7a8bc532) and [here](https://youtu.be/8NrTVDh5_-s).
