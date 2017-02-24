### concordance


This is the brain of the server side.  I separated the concerns of bootstrapping the endpoints -- for static asset serving, websocket channel serving, DBs etc -- from the thing that actually manages state and handles side-effects.  That thing is called _concordance._

Since we may be developing multiple games in parallel, we have multiple subfolders here that are each a self-contained _concordance_ in its own right.  These will be reflected in the clients, there will be multiple, one for each distinct game likely.
