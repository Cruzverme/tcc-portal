var dispatcher = new WebSocketRails("192.168.0.105:3000/websocket");
dispatcher.on_open = function(data) {
    console.log('Connection has been established: ', data);
}

var channel = dispatcher.subscribe('updates');
channel.bind('update', function(command) {
    $('#commands').text(command);
});

function left() {
  dispatcher.trigger('left');
}

function right() {
  dispatcher.trigger('right');
}

function up() {
  dispatcher.trigger('up');
}

function down() {
  dispatcher.trigger('down');
}