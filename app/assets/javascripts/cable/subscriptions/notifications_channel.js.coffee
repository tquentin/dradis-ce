App.cable.subscriptions.create 'NotificationsChannel',
  connected: ->
    console.log('Subscribed to NotificationsChannel.')

  rejected: ->
    console.log('Error subscribing to NotificationsChannel.')

  received: (data)->
    $('[data-behavior~=notifications-dot]').removeClass('hidden')

    $container = $('[data-behavior~=notifications-dropdown] + div')
    $unreadCount = $('[data-behavior~=unread-count]')
    if $container.is(':visible')
      $container.find('ul > div:first-child').after(data.notification_html)
      $unreadCount.text(parseInt($unreadCount.text()) + 1)