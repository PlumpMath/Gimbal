


# < name: to be decided >

## What is in this repository ?










_Web-browser gaming, networking applications., WebGL, WebRTC, WebSockets, ReactJS, NodeJS, ._
#### history:

**this project started when:**

_from before_
>I wanted to learn WebGL and create a 2d game first, before building a lightweight 3d engine roll from scratch (possibly then moving to an open source project) to learn.  The focus here isn't on the game itself; the platform is intended to have general applicability over the problem space. Excellence in networking, sensor aggregation, AI, and informatically-rich UIs are common requirements.

That was/is Spacewar, doing a proto for WebGL and some other stuff (WebWorkers, WebRTC).  Now I'm refactoring the wholly fawk out of it and turning it into a fully networked conglomeration with all kinds of extensibility, from WebRTC to Rust microservices, giving chances to learn each in turn while simultaneously establishing POC and a working pattern.

As an amateur aerospace maven, ultimately my goal was/is to do a kind of Falcon Version 23.0, a hackers' paradise of a flight simulator, updated with 2018 hardware and software to max it. Linux open-source.  Nodejs, Rust, React, WebGL, later desktop clients.  Accomplishing this leads to something deeper with great generality of applicability.  

Physical systems simulation, the computation of counterfactuals to the correctness of the fully referential models.  The simulation of machinic, social, etc systems within physical systems.  This is the forgotten pole, counterpoint, and corollary to the much more publicized revolution in AI (machine learning, deep learning, neural nets, machine vision, etc).  In a scenario universe where biological intelligence continues to reign over machinic (on plausible lines that Penrose was indeed on to something in Emperor's New Mind &c), the sensor aggregation to situational awareness interface is fulcrum (as centrally important as AI tools); and even in a scenario where AI supercedes vastly, simulation remains the AIs' best tool (I presume..?) for extrapolation/inquiry in counterfactuals. More directly, I'm asserting the importance of (A) simulation (physical, machinic, social, whatever as long as it's made referentially rigourous), and (B) sensor-aggregation/situational-awareness-interface, as well as stating that these are the central concerns of this project, and more prosaically, of flight-sims as software artifacts.  Commercially, these tools/techniques have application to game-server systems and any shopping or social-media contraption the next disruptors/startup founder cares to bring to the table.


Backing up again, I've been a programmer in an amateur sense for 24 years, and but only professionally for y 5 years-- meaning fulltime engagement whether employed or not.  I got into fullstack web-programming and am now fullstack plus mobile via React-Native experience, and asserting ability to pick up Android &or iOS programming pretty quickly.

As a lifelong aerospace maven, I want eventually to do a flight-sim, although typically those are team efforts of 60 neckbeard C++ geniuses, and me just some fullstack web-dev.  But anyways I'd done OpenGL before with C++ and Ruby (in the most limited feetwet amateur sense), so to do a minimal WebGL game became the focus, and this repo started as that implementation of Spacewar, the DOS game from the Eighties-NineTeen.  So that is done, and then later that year I did this full-stack thing for a client and so I had this networking infrastructure, and then I want to be like architectural and make it a full system with Redis4, Rust microservices, the Nodejs just handling websocket servers.  The browser-client React + WebGL + WebRTC + WebWorkers becomes a nice testbed project itself, but leave open the possibilites that the Rust components can be not just computational / ai or whatever microservices, but can have GUI side effects as well, so desktop clients then.  Rust + OpenGL.

So that's kind of the idea with this project now.  It was a simple game project for getting started with WebGL and games.  Now using this as an R&D platform , experimental stack and assorted prototypes.  Lab.

The browser-client initially is a refactor of the spacewar 2d thing, with the other missing features (gravity well planet, lasers, scoring, rounds, ) and network play.  
Eventually will move to 3d and other games.  The 'games' need not be games in the traditional sense, and could be e.g. simulations of naturalistic/real-world phenomena/processes.
And the clients need not be user-oriented applications, they could be AI bots themselves.  The possibilities in terms of configuration is related to the extent of generality of the toolset and associated patterns.




**\***Arguably, simulation is a superset of AI, in the sense of AI being 'simulated' intelligence. To the extent that the simulated intelligence is considered real and is indeed useful in practical applications (in a way that simulated physical reality isn't/ can't be substituted into a real physical system in that way), not so much.  But the constructive simulative approach is similar from a modeling approach to the problem aspect anyway.
