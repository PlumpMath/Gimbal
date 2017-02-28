

got_remote_stream = (e) ->
    c 'got remote stream'


got_offer = (desc) ->
    pc.setLocalDescription desc
    sendOffer desc

got_answer = (desc) ->
    pc.setRemoteDescription desc

arq = {}


arq['init_webrtc'] = ({ state, dispatch }) ->
    c 'Initiating webrtc 989999999999999999999999999999999999999999999999'

    # pc = new RTCPeerConnection(null)

    peer_connection = new RTCPeerConnection()

    send_channel = peer_connection.createDataChannel 'send_channel'

    send_channel.onopen = ->
        c 'send_channel opened'

    send_channel.onclose = ->
        c 'send_channel closed'

    c 'pc', peer_connection

    remote_connection = new RTCPeerConnection()
    remote_connection.ondatachannel = ->
        c 'receiving on remote'

    peer_connection.onicecandidate = (e) ->
        c 'on ice candidate peer'

        remote_connection.onicecandidate = (e) ->
            c 'remote_connection has on ice candidate'


    peer_connection.createOffer()
    .then (offer) ->
        c 'created offer', offer
        peer_connection.setLocalDescription offer
        # c 'set local description'
    .then ->
        remote_connection.setRemoteDescription peer_connection.localDescription
        # c 'set remote description'
    .then ->
        answer = remote_connection.createAnswer()
        c 'remote connection created answer', answer
        answer
    .then (answer) ->
        c 'have answer', answer
        remote_connection.setLocalDescription(answer)
        # c 'remote_connection setLocalDescription'
    .then ->
        peer_connection.setRemoteDescription remote_connection.localDescription

    # pc.onaddstream = got_remote_stream
    # pc.addStream localStream
    #
    # pc.createOffer got_offer

exports.default = arq
