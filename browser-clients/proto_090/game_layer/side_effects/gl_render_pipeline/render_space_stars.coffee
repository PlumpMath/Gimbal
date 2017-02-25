

galaxy_rayy = require('./physical_space/stars.coffee').default()



render_space_stars = ({ render }) ->

    bk_rayy_3 = new Float32Array [
        0, 0,
        0, 1000,
        2000, 0
        2000, 0,
        0, 1000,
        2000, 1000
    ]
    # draw_space = " draw a black background "
    render
        rayy: bk_rayy_3
        uni_color: [0, 0, 0, 1]

    # draw_stars = " draw a bunch of stars"
    for star_rayy_2, idx in galaxy_rayy
        render
            rayy: star_rayy_2
            uni_color: [1, Math.random(), 1, 1]



exports.default = render_space_stars
