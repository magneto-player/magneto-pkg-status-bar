
{View} = niceplay.Views

class StatusbarView extends View
  @content: () ->
    @header class: 'status-bar', =>
      @ul class:'os-nav', =>
        @li class: 'os-nav-item os-nav-item-close', =>
          @a href: '#'
        @li class: 'os-nav-item os-nav-item-min', =>
          @a href: '#'
        @li class: 'os-nav-item os-nav-item-max', =>
          @a href: '#'

      @div class: 'title-file'

      @a class:'fullscreen', href: '#', 'fullscreen'

  initialize: ->
    @on 'click', '.os-nav-item-close', -> process.exit(0)
    @on 'click', '.os-nav-item-min', -> niceplay.workspace.minimize()
    @on 'click', '.os-nav-item-max', -> niceplay.workspace.maximize()
    @on 'click', '.fullscreen', -> niceplay.workspace.toggleFullscreen()

  setTitle: (title) ->
    @find('.title-file').html(title)
    nw.gui.Window.get().title = title

  setIcon: (icon) ->
    @find('.icon').find('i')
      .removeClass()
      .addClass(icon)

module.exports = StatusbarView
