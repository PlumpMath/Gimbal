window.c = console.log.bind console
window.React = require 'react'
window.React_DOM = require 'react-dom'
window._ = require 'lodash/fp'
window._sq = require 'lodash'
window.shortid = require 'shortid'
window.key_mirror = require 'keymirror'
{ connect: window.connect } = require 'react-redux'
window.Imm = require 'immutable'
window.EE = require "wolfy87-eventemitter"


window.debounce = (fn, wait, immediate) ->
    timeout = false
    ->
        context = @
        args = arguments
        later = ->
            timeout = null
            if not(immediate) then fn.apply(context, args)
        callNow = immediate and not(timeout)
        clearTimeout timeout
        timeout = setTimeout(later, wait)
        if callNow then fn.apply(context, args)

window.rr = -> React.createFactory(React.createClass.apply(React, arguments))
window.rc = -> React.createFactory.apply(React, arguments)

dom_stuff = {
    p, form, strong, pre, div, h1, h2, h3, h4, h5, h6, span, svg, circle, Image,
    tspan, rect, ul, line, li, ol, code, a, input, defs, clipPath,
    body, img,
    linearGradient, stop, g, path, d, polygon, image, pattern,
    filter, feBlend, feOffset, polyline, feGaussianBlur, feBlend, feMergeNode,
    feMerge, radialGradient, foreignObject, text, textArea, ellipse,
    pattern, thead, th, tr, tbody
} = React.DOM

for k, v of dom_stuff
    window[k] = v

for item in ['textArea', 'filter', 'foreignObject', 'feGaussianBlur', 'feImage', 'feOffset', 'feMerge', 'feMergeNode', 'feBlend', 'feComponentTransfer', 'feFuncR', 'feFuncG', 'feFuncB', 'feComposite']
    window[item] = React.createFactory item

window.assign = _.assign
window.keys = _sq.keys
window.includes = _sq.includes
window.map = _.map
window.reduce = _.reduce
