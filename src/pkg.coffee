
[StatusBar] = []

module.exports =
  activate: ->
    StatusBar = StatusBar or require './status-bar'

    new StatusBar().initialize()

  desactivate: ->
