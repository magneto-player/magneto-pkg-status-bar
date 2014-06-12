
{View} = magneto.Views

class StatusbarView extends View
  @content: () ->
    @header class: 'status-bar', =>
      @ul class:'os-nav', =>
        @li class: 'os-nav-item os-nav-item-close', title: 'Close', =>
          @a href: '#'
        @li class: 'os-nav-item os-nav-item-min', title: 'Minimize', =>
          @a href: '#'
        @li class: 'os-nav-item os-nav-item-max', title: 'Maximize', =>
          @a href: '#'

      @div class: 'title-file'

      @a class:'fullscreen', href: '#', title: 'Fullscreen', =>
        @i class: 'icon icon-fullscreen'

  initialize: ->
    @on 'click', '.os-nav-item-close', -> magneto.emit('!window:exit')
    @on 'click', '.os-nav-item-min', -> magneto.emit('!window:minimize')
    @on 'click', '.os-nav-item-max', -> magneto.emit('!window:maximize')
    @on 'click', '.fullscreen', -> magneto.emit('!window:toggle-fullscreen')

  setTitle: (title) ->
    @find('.title-file').html(title)
    magneto.emit('!window:set-title', title)

  setIcon: (icon) ->
    @find('.icon').find('i')
      .removeClass()
      .addClass(icon)

module.exports = StatusbarView
