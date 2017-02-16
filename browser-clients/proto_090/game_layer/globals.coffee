




window.c = console.log.bind console
window.Imm = require 'immutable'

window._ = require 'lodash'
window._fp = require 'lodash/fp'

{
    keys: global.keys
    assign: global.assign
    includes: global.includes
} = _

global.shortid = require 'shortid'

global.work = require 'webworkify-webpack'

window.gl_mat = require 'gl-matrix'

window.async = require 'async'

window.mat3 = gl_mat.mat3
window.vec3 = gl_mat.vec3
window.vec2 = gl_mat.vec2

window.cos = Math.cos.bind Math
window.sin = Math.sin.bind Math
window.pi = Math.PI


window.EE = require "wolfy87-eventemitter"

window.primus = new Primus('http://localhost:3883', {})
