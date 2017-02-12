
window.c = console.log.bind console
window.Imm = require 'immutable'

window._ = require 'lodash'
window._fp = require 'lodash/fp'

window.async = require 'async'

window.mat3 = gal_mat.mat3
window.vec3 = gl_mat.vec3
window.vec2 = gl_mat.vec2

window.cos = Math.cos.bind Math
window.sin = Math.sin.bind Math
window.pi = Math.PI.bind Math


window.EE = require "wolfy87-eventemitter"
