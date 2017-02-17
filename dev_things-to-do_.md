


### things to do:


- implement audio.  never done this in the browser, would be a good time to start. (planned)

- implement webrtc bare-bones in the browser-clients (planned).  this is for audio (see above) as well as advanced networking

- implement 3d games: spacewar the dos game clone is just a placeholder, as this project is intended to have general applicability to networked games and other networked applications including military or commercial network applications broadly, in principle.  (tldr: planned, other games w better graphics, other similar applications like drone sensor consolidation)

- setup cors such that can (potentially barring restrictions) have the main app static assets (express server) served by one app dyno, and the websockets mgmt served by another.  this mostly for proof of concept. (planned)

- create a worker-like development structure for multi-threading operations on the concordance side.

- figure out what goes into web-workers and what should stay on main thread (ongoing)

- implement network gaming with websockets/ primus (ongoing)

- move express routing and cookies / sessions mgmt to concordance side-effects or some module. (deferred)
