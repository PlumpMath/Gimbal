

require './top_level_globals.coffee'



{ dispatch } = require('./game_layer/index.coffee').default()
game_layer_dispatch = dispatch



# now we can pass game layer dispatch to the gui layer.  so all websocket traffic will
#be handled by the game layer.  maybe in refactor can architect differently, this
# is going a bit ad-hoc for now
# so really the gui layer shouldn't need its own side-effects module, that will be
# handled by game layer.
# or maybe more accurate to say that the gui layer has one side-effect option which is to
# call dispatch on the game layer.


{ gui_dispatch } = require('./gui_layer/containers/Root/index.coffee').default { game_layer_dispatch }


game_layer_dispatch
    type: 'gui_dispatch_delivery'
    payload: { gui_dispatch }
