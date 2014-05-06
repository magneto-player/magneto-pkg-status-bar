
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
    @on 'click', '.os-nav-item-close', -> niceplay.emit('!window:exit')
    @on 'click', '.os-nav-item-min', -> niceplay.emit('!window:minimize')
    @on 'click', '.os-nav-item-max', -> niceplay.emit('!window:maximize')
    @on 'click', '.fullscreen', -> niceplay.emit('!window:toggle-fullscreen')

  setTitle: (title) ->
    @find('.title-file').html(title)
    niceplay.emit('!window:set-title', title)

  setIcon: (icon) ->
    @find('.icon').find('i')
      .removeClass()
      .addClass(icon)

module.exports = StatusbarView
