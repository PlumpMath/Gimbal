



#### Development setup:


##### prerequisites:

- Node.js installed. Nodemon, CoffeeScript, Webpack installed globally with e.g. `npm i -g webpack`
- Redisv4 server running locally


##### then do this :
- from ./browser-clients/proto\_090 folder `webpack -w`
- from ./servers folder `nodemon --watch . --watch ../concordance server_091.coffee`


##### explanation:

The browser-client is pretty self-explanatory.  Built with webpack, it has a WebGL layer for the game graphics, and a React layer for the GUI menus.

In the server side I've separated the concerns of endpoint bootstrapping from state & side-effect managament. The endpoint bootstrapping is handled in /servers folder, and this is expected to differ significantly between development vs. staging/production.  On the other hand, everything which is common between development and production is contained in the /concordance module.  I've designed it so the developer should be able to ignore the /server code once it's acceptably set up, and just focus on the implementation in /concordance.  

As this is another R&D platform, there will be distinct implementations of the concordance system under that folder for distinct applications; all following the same pattern.
