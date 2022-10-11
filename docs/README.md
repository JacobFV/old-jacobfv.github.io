# [jacobfv.github.io](https://jacobfv.github.io)

Hello! I'm a machine learning engineer 👨‍🔬, roboticist 👨‍🏭, and entreprenuer 👨‍💼 at my startup, [Limboid LLC](https://limboid.ai), where I work to develop [artificial general intelligence (🖥️+🧠)](https://jacobfv.github.io/blog/the-master-plan-part-1/) and [affordable humanoid robots (🤖−💲)](https://jacobfv.github.io/blog/the-master-plan-part-2/). During the day, I work as a software engineer 🧑‍💻 at Motio Inc. I just graduated 👨‍🎓🎉 from the University of Texas at Arlington with my bachelor's degree in computer science. I 💙 [open source work](https://github.com/JacobFV), [artificial intelligence](https://jacobfv.github.io/blog/category/ai/), and [robotics](https://jacobfvaldez.weebly.com/engineering.html). When I'm not interacting with artificial agents, you'll find me working with real people. [I hope that includes you 📫](https://jacobfv.github.io/bio#contact)

---

## Dev notes

- This is how I know to update:
  
  ```bash
  conda activate ai
  ./bin/build.sh
  # optional, jekyll serve --skip-initial-build

  git add .
  git commit -m "Update"
  git push
  ```

- I manually set uglifier.rb `DEFAULTS[harmony] = true`, but what really mattered was inserting the following config:

```yaml
jekyll-minifier:
  uglifier_args:
    harmony: "true"
```