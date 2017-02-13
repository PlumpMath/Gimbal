c = console.log.bind console



c 'hello'

Worker = require('worker-loader?inline!./worker')


worker = new Worker()

# worker.postMessage('graga')

# worker.onmessage = (event) ->
#
#     c ' now index has message from worker'
