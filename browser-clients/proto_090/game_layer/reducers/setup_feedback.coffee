



arq = {}


arq['completed:init:webgl'] = ({ state, action }) ->
    c 'into completed webgl', action.payload
    { gl, canvas, colorLocation } = action.payload
    state



exports.default = arq
