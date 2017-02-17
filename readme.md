


# _spacewar_
_Web-browser gaming, networking applications., WebGL, WebRTC, WebSockets, ReactJS, NodeJS, ._
#### history:

I wanted to learn WebGL and create a 2d game first, before building a lightweight 3d engine roll from scratch (possibly then moving to an open source project) to learn.  The focus here isn't on the game itself; the platform is intended to have general applicability over the problem space. Excellence in networking, sensor aggregation, AI, and informatically-rich UIs are common requirements.





__________________________________________________________----

# old readme:
######  spacewar the classic DOS era game with 2D world and spaceships flying around, sometimes with a planetary gravity well.

Here we will use React to setup the menu UIs, restart game, hi scores, stuff like that, and we'll use webGL for the game screen.

This is just a prototype project to get started (again) with WebGL.  With proof of concept & competence of the tools and techniques can then move onto more interesting projects.  3D games and whatever else.


### how to play
**at alpha**
- control ship1 with the left and right arrow keys to rotate, the up arrow key to apply thrust, 'z' key shoots torpedos from ship1.  hitting ship2 will result in primitive kill graphics.

- at the moment the other ship with whatever the x, c, and v keys are on the dvorak keyboard.  i'll fix this later today.


### development how-to

- clone and `npm i`
- `npm i -g coffee-script`
- `webpack -w`
- `coffee server.coffee`


### ttd

- Start using this http://twgljs.org/docs/, after learn low level stuff well enough to comprehend its usefulness

- maybe start using THREE.js after learning enough low level stuff / home rolling ortho projections enough to understand its usefulness

- http://hammerjs.github.io/ for mouse gestures

- webrtc audio and

- webrtc for p2p play if latency not too bad.

- webworkers concurrency if perf gains and if a strategy to optimisie

### after implement 2D version, then implement a 3D version:

3D version takes place in a spherically bounded region where hitting the boundary takes you to the opposite end of the sphere, just like in the 2D version.  you should be able to see the boundary somehow in the 3D version, without it impeding view overly of the background decoration, whatever that might be.  question is where is the camera in the 3D version?  might have to be 2 separate views in the player view, right behind each craft, with a HUD cursor for aiming.  maybe have another canvas window open at the bottom showing a god's-eye view of the whole sphere.
