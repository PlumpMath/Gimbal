










#### architecture & the graphics pipeline

- the graphics pipeline happens after state is completely determined

- the graphic pipeline is basically a side-effects monad.  it's a bunch of sequential procedural insruction stuff parametrised by state.  typically state is passed to specialised functions to get the payload to push to GL array buffer to render.  
