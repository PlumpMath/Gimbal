

require './top_level_globals.coffee'

c 'into entry'


{ dispatch: game_layer_dispatch } = require('./game_layer/index.coffee').default()

c 'game_layer_dispatch', game_layer_dispatch
