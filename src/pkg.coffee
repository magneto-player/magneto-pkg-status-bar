
[StatusBar] = []

module.exports =
  activate: ->
    StatusBar = StatusBar or require './status-bar'

    @statusBar = new StatusBar()
    @statusBar.initialize()

  desactivate: ->
    @statusBar.remove()
