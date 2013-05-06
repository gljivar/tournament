var io = require('socket.io').listen(8190),
    secret = '9f8urg90$u3#92u8rh_gu(rfhi8rj*fih';

io.set('log level', 2);
io.sockets.on('connection', function(socket) {
    socket.on('tournament-ruby', function (data) {
        if (data !== undefined && data.secret === secret) {
            socket.broadcast.emit(data.action, data.info);
        }
    });
});

