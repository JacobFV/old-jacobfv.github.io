---
layout: page

title: Cookie Cutter CNC

hidden:
redirect: https://jacobfv123.medium.com/cookie-cutter-cnc-923c68932ee6
category: [personal]
importance: 5

date: 2015-03-01 #  YYYY-MM-DD, must be specified
start: 2015-03-01
end: 2015-05-29
display_date: # used instead of `date` or date range

img: /assets/img/cc_1.jpg
github: JacobFV/CookieControl # uname/repo, don't include the prefix `https://github.com/`

description: Full stack engineering project
bullet_points: | # at least two bullet points
    - 36"×36" sheet metal cutter with [server](https://github.com/JacobFV/CookieControl) and Arduino [client](https://github.com/JacobFV/Arduino-CookieControl) control systems
    - Designed and developed C\# .svg parser, toolpath scheduler, and optimizer, Arduino controller with serial protocol and electronics, and CNC machine with electrodischarge machining head.
    - [Presented](https://youtu.be/yGfpX0WXYFM) on project in May 2015 and June 2016
    - Development journey published [here](https://jacobfv123.medium.com/cookie-cutter-cnc-923c68932ee6)
---

Outcomes:

- 36”×36” sheet metal CNC (without cutting tool) with server and client control systems
- Became significantly more fluent in C#
- Developed .svg parser and toolpath scheduler with local optimization
- Learned elementary electrical engineering
- Engineered basic Arduino CNC controller
- Wrote serial client featuring optimized protocol

<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        This project started with the objective of making a 2&times;2 plasma cutter. You see, until then, I had been painstakingly hacksawing all my sheet metal, and I probabbly broke 3 or more cutting blades each day in the process. It seemed like a no-brainer then to automate this process... or so I thought.
    </div>
    <div class="col-sm-4 mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/cc_problem.jpg' | relative_url }}" alt="" title="example image"/>
    </div>
</div>
<div class="caption"></div>

I quickly began deciding objectives. PDFs started piling up on material science, electrical engineering, mechanotronics, programming, and gcode. For the first month, I spent much of my time in school taking notes, formulating designs, and drafting parts. It's so easy to get tempted to plan out every millimeter of a machine.

Finally, I settled on an _acceptable_ design and began construction. At this point, there were only a few weeks of school left, and I wanted to share my work with my peers so I intensified my activity: no more basketball, programming through class and lunch, staying in the garage much of the evening. (I would've made more balanced decisions now) At this point, I began actually learning about machanical and electrical engineering, arduino programming, C#, SVG processing, matrix transformations, and of course, failure.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/cc_0.jpg' | relative_url }}" alt="" title="CookieCutter mechanotronics"/>
    </div>
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/cc_2.jpg' | relative_url }}" alt="" title="CookieCutter electronics"/>
    </div>
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/cc_1.jpg' | relative_url }}" alt="" title="CookieCutter mechanotronics"/>
    </div>
</div>
<div class="caption">
    CookieCutter in development
</div>

It's hard to maintain a crazy level of involvement for long without losing some enthusiasm, and when the roadblocks came, I was ready to move on to another more exciting project. One of the bigest setbacks was the day before I was scheduled present the machine to my class. I was showing the electro-discharge cutting head to some of my teachers and school principle. It had worked before on aluminum foil, but this time I was using a homebuilt transformer to carry higher current. Because of a miscalculation however, the moment I turned on the switch, it shorted half of the classroom I was in and also a neighboring lab. Needless to say, that was a very embarassing moment. Summer break was just around the corner anyway so from then on, I gave up on making a working machine and just focused on giving a good presentation.

In honor of an attempted 3D printer, the Cookie Baker, I named this machine the Cookie Cutter. This system has all the bare-bones you would expect from a sheet metal cutting CNC except for an actual working cutting head. It uses CookieWare to read SVG files, an Arduino Mega with CookieWare Client to buffer serial input and make appropriate movements, and a threadscrew XY table. Check out the CookieCutter's Github repos for [server](https://github.com/JacobFV/CookieControl) and [client](https://github.com/JacobFV/Arduino-CookieControl) code.

<div class="row">
    <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/cc_3.jpg' | relative_url }}" alt="" title="Final CookieCutter"/>
    <div class="col-sm mt-3 mt-md-0">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/dyWwv9mZEvk?start=61" title="YouTube video player" frameborder="0" class="z-depth-1 rounded" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
    <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/cookie_control.png' | relative_url }}" alt="" title="Cookie Control"/>
</div>
Mock product-release video (above) and final CookieCutter (below)
Final CookieCutter (left), mock product-release video (center), and CookieControl (right)
    