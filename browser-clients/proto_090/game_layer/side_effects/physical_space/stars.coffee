exports.default = ->


    galaxy_rayy = []

    for idx in [0 .. 922]

        origin_vertex_x = parseInt(Math.random() * 2000)
        origin_vertex_y = parseInt(Math.random() * 1000)

        the_star = new Float32Array [
            origin_vertex_x, origin_vertex_y
            origin_vertex_x - 2, origin_vertex_y + 2,
            origin_vertex_x + 1, origin_vertex_y
        ]
        galaxy_rayy.push the_star

    galaxy_rayy
