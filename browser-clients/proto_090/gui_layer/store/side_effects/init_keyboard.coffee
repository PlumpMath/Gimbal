arq = {}


arq['init_keyboard'] = ({ store }) ->
    c 'initiating keyboard1111111111111111111111111111111111111111111'

    document.addEventListener 'keydown' (e) ->
        switch e.keyCode
            when 13 #enter
                store.dispatch
                    type: 'enter_key_press'

            when 27 # escape
                store.dispatch
                    type: 'escape_key_press'




exports.default = arq
