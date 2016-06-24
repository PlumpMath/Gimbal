c = -> console.log.apply console, arguments

document.getElementsByTagName('body')[0].style.overflow = 'hidden'
vertex_shader_source = require('../shaders/vertex_shader_001_.glsl')
fragment_shader_source = require('../shaders/fragment_shader_000_.glsl')

canvas = document.getElementById('canvas_000')
canvas.width = window.innerWidth
canvas.height = window.innerHeight
gl = canvas.getContext 'experimental-webgl'  #, preserveDrawingBuffer: true

fragment_shader = get_shader(gl, fragment_shader_source, gl.FRAGMENT_SHADER, 'FRAGMENT')
vertex_shader = get_shader(gl, vertex_shader_source, gl.VERTEX_SHADER, 'VERTEX')

program = gl.createProgram()
gl.attachShader program, vertex_shader
gl.attachShader program, fragment_shader
gl.linkProgram program
gl.useProgram program

colorLocation = gl.getUniformLocation program, "u_color"
resolutionLocation = gl.getUniformLocation(program, "u_resolution")
gl.uniform2f(resolutionLocation, canvas.width, canvas.height)

buffer = gl.createBuffer()
gl.bindBuffer gl.ARRAY_BUFFER, buffer

positionLocation = gl.getAttribLocation program, "a_position"
gl.enableVertexAttribArray positionLocation
gl.vertexAttribPointer positionLocation, 2, gl.FLOAT, false, 0, 0


# console.log canvas

module.exports = { gl, canvas, colorLocation }
