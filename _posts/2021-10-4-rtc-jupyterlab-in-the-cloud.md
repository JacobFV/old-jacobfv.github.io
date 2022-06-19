---
layout: post
title:  RTC Jupyterlab in the Cloud
date:   2021-06-18
description: How to run jupyterlab on AWS and GCP in realtime collaborative mode.
categories: [ai, tutorial]
tags:   [gpt3]
---


Jupyter notebooks have been a huge productivity boost for machine learning researchers. They are a great way to share code, and to share ideas. Still, it's only been recently that they have introduced support for realtime collaboration. I have written this post as a tutorial to help you get started with realtime collaboration using Jupyter lab on AWS and GCP.

According to gpt3:

    ## What is Jupyter lab?
    
    Jupyter lab is a Jupyter notebook extension that allows you to run Jupyter notebooks in realtime. It is a Jupyter notebook server that runs on your local machine, and it is connected to a Jupyter notebook server on a remote machine.

    ## What is realtime collaboration?

    Realtime collaboration is the ability to run Jupyter notebooks in realtime. Jupyter notebooks are run on your local machine, and Jupyter notebooks are connected to a remote Jupyter notebook server. The remote Jupyter notebook server is the one that is running on your machine.
    
    ## What is GCP?
    
        Google Cloud Platform is a cloud computing platform that provides a set of open-source software tools for developers to build, deploy, and manage their cloud computing resources.

    ## What is AWS?
        
        Amazon Web Services is a cloud computing platform that provides a set of open-source software tools for developers to build, deploy, and manage their cloud computing resources.

## AWS

1. Create an ec2 instance with the deep learning image 
2. Create a security group that allows all inbound traffic on ports 22 (ssh) and 8888 (jupyter lab) and allows all outbound traffic on all ports.
3. Open a local terminal and ssh into the instance
4. Run the following command to start jupyter lab
```
jupyter lab --ip=0.0.0.0 --port=8888 --collaborative
```
6. Copy and paste the URL that the jupyter lab server pits out into your browser but replace `https://localhost` with the ephemeral ip address of the instance. Make sure to use the port 8888.
7. Troubleshooting: sometimes, I have to explicitly reassign the security group.
8. Terminate the instance when you are done.

## GCP
    
1. Create a GCP project and request a GPU quote increase
2. Create a GCP compute engine instance with the deep learning image
3. Run the following command to start jupyter lab
```
jupyter lab --ip=0.0.0.0 --port=8888 --collaborative
```
4. Copy and paste the URL that the jupyter lab server pits out into your browser but replace `https://localhost` with the ephemeral ip address of the instance. Make sure to use the port 8888.
5. Troubleshooting: sometimes, I have to explicitly run a network analysis on port 8888 on the instance.
6. Delete the instance when you are done.