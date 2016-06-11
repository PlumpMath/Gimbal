
require './globals.coffee'

document.getElementsByTagName('body')[0].style.overflow = 'hidden'



vertex_shader_source = require('./shaders/vertex_shader_000_.glsl')
fragment_shader_source = require('./shaders/fragment_shader_000_.glsl')

canvas = document.getElementById('canvas_000')

gl = canvas.getContext 'experimental-webgl'

c 'index here'

fragment_shader = get_shader(gl, fragment_shader_source, gl.FRAGMENT_SHADER, 'FRAGMENT')

vertex_shader = get_shader(gl, vertex_shader_source, gl.VERTEX_SHADER, 'VERTEX')

# program = createProgramFromScripts gl, [vertex_shader, fragment_shader]

program = gl.createProgram()

gl.attachShader program, vertex_shader
gl.attachShader program, fragment_shader
gl.linkProgram program
gl.useProgram program

positionLocation = gl.getAttribLocation program, "a_position"

buffer = gl.createBuffer()

gl.bindBuffer gl.ARRAY_BUFFER, buffer

rayy = new Float32Array [
    -1.0, -1.0,
    1.0, -1.0,
    -1.0, 1.0,
    -1.0, 1.0,
    1, -1.0,
    1.0, 1.0
    ]

c 'rayy', rayy

gl.bufferData gl.ARRAY_BUFFER, rayy, gl.STATIC_DRAW
gl.enableVertexAttribArray positionLocation
gl.vertexAttribPointer positionLocation, 2, gl.FLOAT, false, 0, 0

gl.drawArrays gl.TRIANGLES, 0, 6
