if Meteor.isClient

  Session.setDefault('currentPage','default')

  Template.shell.helpers counter: ->
    Session.get 'counter'
  Template.shell.events 'click button': ->
    # increment the counter when button is clicked
    Session.set 'counter', Session.get('counter') + 1

  Template.display.helpers counter: ->
    Session.get 'counter'
  Template.display.events 'click button': ->
    # increment the counter when button is clicked
    Session.set 'counter', Session.get('counter') + 1
    return

  Template.displayScreenContent.helpers
    currentScreen: ()->
      page = Session.get('currentPage')
      switch page
        when 'default' then Template.defaultScreen
        else Template.ErrScreen

  Template.info.helpers counter: ->
    Session.get 'counter'
  Template.info.events
    'mousedown .arrow-key': (evt) ->
      $('#info-arrow-keys').css('margin','-9px 0')
    'mouseup .arrow-key, mouseout .arrow-key': (evt) ->
      $('#info-arrow-keys').css('margin','-11px 0')

    'click a.route-change': (evt)->
      pg = evt.target.getAttribute('data-id')
      Session.set('currentPage', pg)


  Template.info.helpers
    currentPage: ()->
      page = Session.get('currentPage')
      switch page
        when 'default'
          {
            title: 'Welcome To The Pokedex'
            desc: '
              <a class="route-change" data-id="index">Pokemon Index</a>
              <br>
              <a class="route-change" data-id="types">Type Index</a>
              <br>
              <a class="route-change" data-id="battle">Battle</a>
            '
          }
        when 'index'
          {
            title: "Complete Pokemon Index"
            desc: "Select a Pokemon to view its Stats."
          }
        when 'battle'
          {
            title: "Battle Royale"
            desc: "Please choose your trainer to send into battle."
          }
        else {title: 'yours', desc: 'mine'}

# Template.registerHelper 'htmlSafe' (string)->
#   return Spacebars.SafeString(string)


# if Meteor.isServer
#   Meteor.startup ->
#     # code to run on server at startup
#     return