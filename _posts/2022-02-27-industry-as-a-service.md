---
layout: post
title: Industry as a Service (IndAAS)
date: 2022-02-28
description: Some ideas towards developing sustainable, productive, on-demand industry
categories: [idea]
tags:   []
---

## Initial motivation

My brother and I have always approached cooking from an economic perspective: what's the fastest way to cook X? how long will it last in the freezer? how much time and money does it take? We believe many of the demands imposed by the traditional culinary methodology are accidental and artificial -- rather than essential. Not that traditional cooking is a problem, but in our case, hard economic or practical concerns often overshadow the importance of replicating a particular subjective experience. 

Could we automate the entire culinary process? Further, could we even automate growing and harvesting the plants themselves? I google'd "fastest growing vegetables" and found several -- including carrots 🥕, lettuce 🥬, tomatoes 🍅, cucumbers 🥒, onions 🧅, broccoli 🥦, turnips, celery, and kale -- which all mature in around two months. That's really fast. Sometimes I think, "If only I had planted a fruit tree 5 years ago, it would be ready now." but for the above plants, the turnaround only takes 60 days!

## Dirt cheap is too expensive

Now how would I grow these plants? I remember hearing about a plant-growing technique called hydroponics. This is an old technique where you grow plants in a watery-nutrient solution instead of soil. Taking this approach makes it easier to control the environment surrounding the roots which reduces the likelihood of viral outbreaks, and hence, the need for fertilizers and pesticides. It also cuts down on labor requirements. A related techniuqe, areoponics, eliminates the need for large amounts of water altogether. The plants literally grow suspended in the air, and their roots are regularly spraying with a solution of water and nutrients. I'm going to explore both techniques, but if areoponics can be sucessfully applied to the above plants, I'll primarily lean on it given its apparent simplicity and low nutrient-solution requirements.  

Just doing some napkin math, tomato prices are around 2 \$/lb. This website[^1] claims their *Bush Early Girl Tomato* produces ~100 tomatoes that each weigh 6-7oz (~0.4 lbs) in a 60 day turnaround time. Multiplying this all togethor, we get: 100 tomatoes/plant &times; 0.4 lbs/tomato &times; 2 \$/lbs &approx; 80 \$/plant every 60 days. That's slightly above \$1/plant/day. I wouldn't be surprised if other plants weren't as productive, but this analysis makes even a small automated areoponic vegetable garden seem like an economically viable starting point. 

[^1]: https://bonnieplants.com/products/bush-early-girl-tomato

## Open, online, on-demand

Of course, if growing a small areoponic garden were my only concern, I could just get a spray bottle and mist the plants myself every day. Automation demands a signifcantly large or complex application space to justify its existance -- much bigger than I could ever manage. I have trouble growing "starter" plants, let alone large, diverse gardens. However, my associates and YouTube inform me that there are many people who do have this skill. This broadened my focus from "how to grow" to "how to help other people grow". My brother recommended adapting the AWS infrastructure-as-a-service (IAAS) model to farming with managed racking, stacking, packaging, and climate control. After playing around with it, we arrived at the idea for Ecosystem-as-a-Service (EaS):

- *Racks* come in various sizes with optional watering, misting, lighting, ventilation, and temperature control. *Containers* and *buildings* are climate controlled places that simulate various ecosystems.
- Racks are stacked on top of each other to form a *stack*. Stacks are placed in containers or buildings. Containers go in buildings.
- *Growers* pay to use racks and place them in publically available or privately rented containers. Growers can place fungi, plants, and approved animals in their racks.
- Growers also pay for things like cameras, tilling machines, and other equipment installed in their racks.

This service generalizes the automated farming model to many kinds of life. I think it could produce some interesting use-cases. For example, a community garden is a medium-sized garden that it managed by the local community. On the other hand, this online racking service would allow Internet communities to form their own decentralized, global community gardens. Cameras could be made to stream realtime footage of their plants to a website, and community members could remotely watch their plants grow up, initiate 'rain', control the temperature, or change the time of day. This touchless, online service would also help people who are afraid of bugs to get their garden itch satisfied. People could even use the racking service to remotely manage a bee hive and harvest honey. (As long as there is a polinator-friendly container available and other growers are cultivating flowering species there.) People like myself who want to farm but don't know how would benefit from its more-deterministic environments to learn in. Agg schools could use this service to teach their students. Ecology researchers might even build entire ecosystems with this service to help them understand the Earth and how to sustainably cultivate it.

*The Earth's ecosystem is an incredible complex dynamical system. In fact, it's so incredible, I hardley notice it. Unlike the economy which fluctuates in extremes or even the brain which peaks in the mid-20's and then slowely declines, the Earth's ecosystem is amazingly robust to the perturbations we throw at it. I think it can tell us a lot about economics, neuroscience, and artificial neural networks, and the Ecosystem-as-a-Service (EaS) model could be a great way to draw attention in that direction.*

## Food-prep-as-a-Service (FPAAS)

Returning to the earlier problem, I need a way to automate the culinary process. I will start by making a small scale areoponic farm in my room using wooden racks, LED lights, pressurized spray misting pipeline, and a camera-equipted raspberry pi with aluminum foil blanketing it all. Once I get the kinks worked out, I will rent a storage unit building that has electricity and scale up to a larger workspace. Then I will use the revenue from this personally managed areoponic farm to rent factory space where the Ecosystem-as-a-Service (EaS) model can go full scale. Still, I need to automate the cooking process. Extending the on-demand web service model here, I will use the revenue from the earlier EaS model to create an automated food service. Here's the plan:

- Restaurants supply a recipie with indegredient quantities and the preparation strategy.
- The stragegy is a list of steps, each step specifies a list of ingredients and the operation performed.
- Operations are limited to stack, fold, mix, pour, and a few other simple procedures allowing them to be entirely automated.
- The ingredients are stored in a warehouse, and the warehouse is connected to the kitchen via a network of containers using a similar rack-management system as in the EaS model.
- Restaurants can sell food to other restaraunts directly within the production infrastructure network.
- Several managed logistics services are available to the restaurant, including a warehousing, trucking service, and home delivery service.
- Morterless restaurants using this service can also pay for a complete e-commerce website with realtime video virtual dinning rooms and a delivery service that delivers food to all guests at the same time.
- This restaurant-as-a-service (RAS) model could be used to automate the entire food production process.

## Generalizing the idea

At this point, I've described plans to automate two steps on the culinary value chain: producing and cooking. Why stop there? Would it be possible to apply the same automatic, online racking, stacking, and environment management system service to manufacturing, small animal farming, and other production-related industries? Imagine an online warehousing service where customers bring in *stations* for their unique business domains. Manufacturing customers bring in their CNC's, bakers bring in their industrial cooking equiptment, farmers bring in their chicken coups, and so on. Then the warehouse provides moving, racking, stacking, and other intra-warehouse logistics as a service. Better yet, it provides a *service infrastructure* of several common services like drilling, milling, welding, mixing, oven cooking, planting, misting, climate control, and so on which are available at inexpensive -- perhaps even disadvantageous prices to encourage customers to capitalize on the warehouse infrastructure for producing their own products and services. Instead of growing plants or even directly managing a farm service, the warehouse simply provides an infrastructure for business customers to use to build their own farm-as-a-service (FAS). Maybe the warehouse's only profitable service would be pallete shuttling -- which is an unavoidable service that all customers must buy into.

Imitating AWS, this warehouse service would be online and adopt a pay-as-you-go model -- no upfront costs or artificial friction to economic activity. Just as AWS offers multi-AZ[^2] deployment, the warehouse service would offer multi-warehouse deployment, and warehouses within a single region would be linked by high-speed, high-capacity railways. The warehouse service would also offer a *service infrastructure* that would allow customers to build their own services on top of the warehouse infrastructure and sell them to other businesses using the warehouse. Finally, customers could pay the warehouse service company to set up and maintain on-premise warehousing systems in other company's warehouses. This would be important in industries where the shipping costs are high like car or heavy machinery manufacturing.  

[^2]: multi-AZ deployment means Amazon Web Services deploys its services on multiple data centers in different, yet reasonably nearby, geographic locations. This helps decouple power or internet availability from service availability.

I've already described two use-cases for this warehouse service above. Here are some more:

- A retail store uses machine learning to note what products the customer is interested in most and where those customers will walk. Then the store automatically circulates products on its shelves with a selection that is predicted to maximize revenue. This process happens continuously, automatically, and asynchonously on empty isles.   

- A fast food restaurant installs an on-premise palate management system to replace its manual labor prep and assembly line. Human labor is only used to apply finishing touches to dishes, clean the machines, interface with customers.

- A company uses the warehousing service to build a virtual chicken coup. This company sells access to its coup on a service-based model and its customers use the virtual coup to produce chickens and eggs, offer virtual chicken coup visiting experiences to children, and provide training grounds for poultry businesses.

- Collectively owned *virtual makerspaces* could democratize access to expensive equiptment like metal 3d printers, 5-axis CNC machines, and metal forming machines.

- A startup doesn't want to pay thousands to a Chinese factory and doesn't have enough money for its own factory equiptment yet. It can use the warehouse service to go from initial to medium-sized production until it can afford its own space and equipment. Since the warehouse and on-demand manufacturing infrastructure are both managed, on-demand services, the startup can quickly change its product design as it works through kinks in the value chain.

- Much of the manufacturing sector could go virtual. Instead of managing a factory, it could use the warehouse service to manage its own production facilities. This would allow increasing emergence of *e-manufacturing companies* where more focus can stay on core business rather than infrastructure.

*Macro-economic activity often fluctuates chaoticly in response to unpredictable world dynamics. This automated warehouse service with its online, on-demand service model could allow small and large businesses to adaopt faster to the economy's shifting winds and remain competitive. It has strong potential to democratize access to 21st century manufacturing technology.*

## Conclusion

This has been a long and sprawling post outlining some very lofty ideals for the 4th industrial revolution. I hope to see some of them implemented in the next few years and maybe even take part in realizing them. Please let me know if you used this business model so myself and others can the watch out for the certain, yet unknown pitfalls ahead. Thanks for reading!