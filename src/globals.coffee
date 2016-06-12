

gl_mat = require 'gl-matrix'

arq =
    c : -> console.log.apply console, arguments
    Immutable : require 'immutable'
    _ : require 'lodash'
    Bluebird : require 'bluebird'
    rxjs : require 'rxjs'
    get_shader : require './helpers/get_shader.coffee'
    shortid : require 'shortid'
    gl_mat : gl_mat
    mat3 : gl_mat.mat3
    vec3 : gl_mat.vec3
    vec2 : gl_mat.vec2
    cos : Math.cos
    sin : Math.sin


for k, v of arq
    window[k] = v
