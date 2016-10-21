$(document).on('turbolinks:load', function(){
App.game = App.cable.subscriptions.create("GameChannel", {
  connected: function() {
    this.printMessage("Waiting for opponent...");
  },
  disconnected: function() {

  },
  printMessage: function(message) {
     $("#status").text( message );
  },
  received: function(data) {
    switch(data.action) {
    case "game_start" :

    case "correct_awnser" :

    case "opponent_forfeits" :
        this.printMessage("Waiting for opponent...");
    }
  }
});

})
