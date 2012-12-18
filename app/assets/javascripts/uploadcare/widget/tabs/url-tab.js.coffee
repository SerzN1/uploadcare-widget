uploadcare.whenReady ->
  {
    namespace,
    jQuery: $
  } = uploadcare

  {t} = uploadcare.locale

  namespace 'uploadcare.widget.tabs', (ns) ->
    class ns.UrlTab
      constructor: (@widget) ->

      setContent: (@content) ->
        input = @content.find('@uploadcare-dialog-url-input')
        input.on 'change keyup input', ->
          button.attr('disabled', not $(this).val())

        button = @content.find('@uploadcare-dialog-url-submit')
          .attr('disabled', true)

        @content.find('@uploadcare-dialog-url-form').on 'submit', =>
          url = input.val()
          @widget.closeDialog()
          @widget.upload('url', url)
          false