


### roadmap elements

- refactor implementation of brujo-terminal, the whole dev-env redis bootstrapping thing, and the structured logging thing associated.  really this is 3 things-to-do, all associated with dev-ops in its purely development aspects rather than production stage aspects.  if brujo-terminal needs to be a different express app (!?!?) then it should likely be a separate node process.  it should be on the same node process with the main websocket endpoint so that can share that raw base state with the system it's monitoring. (edit!!!) no no no.  their static-asset delivery is supposed to be on different endpoints, rather than just different paths, for basically obvious reasons.  the websocket endpoints are distinct from their main (asset delivery) endpoints anyways (cors cors), so no reason not to point to same websocket endpoint.  that websocket endpoint can be considered well-referenced by **/concordance**.   in the dev-server instance we simulate this main-endpoint distinction by having them each be separate express apps, whereas in staging or production it might be something else entirely from node.js.  the websocket endpoint in production would be node.js and require **/concordance** in the same way, but soon would like to get linux sockets api working and have computational microservices in other threads running Rust.

- after doing multi-threading should enable a general interface protocol for linux socket communication with other processes on the same linux system, for the server process of course, and simultaneously for other services ('micro' or not) out over websockets.  this way the node.js codebase doesn't become an obstacle to problems to solve on the server side that are best solved in other languages. (planned)

- speed up browser-client performance with web-assembly (can use Rust) [web-assembly](https://hacks.mozilla.org/2017/02/creating-and-working-with-webassembly-modules/)

- implement audio.   (planned asap as soon as get spacewar refactor sort of happening in client)

- implement webrtc bare-bones in the browser-clients (planned). data p2p for gaming

- implement 3d games: spacewar the dos game clone is just a placeholder, as this project is intended to have general applicability to networked games and other networked applications including military or commercial network applications broadly, in principle.  (tldr: planned, other games w better graphics, other similar applications like drone sensor consolidation)

- setup cors such that can (potentially barring restrictions) have the main app static assets (express server) served by one app dyno, and the websockets mgmt served by another.  this mostly for proof of concept. (planned)

- create a worker-like development structure for multi-threading operations on the concordance side.

- figure out what goes into web-workers and what should stay on main thread (ongoing)

- implement network gaming with websockets/ primus (ongoing)

- ~~move express routing and cookies / sessions mgmt to concordance side-effects or some module.~~ no because remember the static asset server is supposed to be pretty dumb.  even if webpack asset strategy, will think in terms dumb endpoints.  so no.  keep it in the dev server(deferred)

- change the repo name ; new auspice aegis etcetera ; general project focus grows ::::====>>>> Nodejs websocket server, express dev server, flux immutable architecture concordance, Rust microservices connecting by Linux sockets as well as by websockets, more advanced Redis 4.0 usage, more developed brujo(admin monitoring/analytics ui app interface   )
