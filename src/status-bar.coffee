
StatusbarView = require './views/status-bar'
path = require 'path'

class Statusbar
  initialize: ->
    @statusbarView = new StatusbarView()
    @statusbarView.appendTo('body')

    magneto.on 'file:new', @load

    magneto.on '!player:play', @play
    magneto.on '!player:pause', @pause
    magneto.on '!player:stop', @stop

  play: =>
    @statusbarView.setIcon 'icon-play'

  pause: =>
    @statusbarView.setIcon 'icon-pause'

  stop: =>
    @statusbarView.setIcon 'icon-stop'

  load: (fileName) =>
    @statusbarView.setTitle(
      path.basename(
        fileName
      )
    )

  remove: ->
    @statusbarView.remove()
    magneto.off 'file:new', @load
    magneto.off '!player:play', @play
    magneto.off '!player:pause', @pause
    magneto.off '!player:stop', @stop

module.exports = Statusbar
