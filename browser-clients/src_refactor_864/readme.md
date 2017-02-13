


### src-refactor-864  :: design considerations


- can't follow old concordance pattern exactly for some reasons.

- don't want to trigger whole reducer on every keyboard event, we want to have an action-cache that is built up over a tick from a bunch of keyboard and other websocket events that came in over that period.  This is all aggregated and sent to reducer to get new state.  This is then sent to GL graphics pipeline side-effect to render.

- as much as possible we want stuff into web-workers, and this needs to be worked into the architecture at the outset.
