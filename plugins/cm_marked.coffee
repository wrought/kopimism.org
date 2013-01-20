# A CoffeeMugg plugin for converting marked markdown syntax to HTML

@MarkedPlugin = (context) ->

  _marked = require('marked')
  _marked.setOptions
    gfm:        true
    tables:     true
    breaks:     false
    pedantic:   false
    sanitize:   true
    highlight:  (code, lang) ->
      if lang is 'js'
        highlighter.javascript(code)
      else
        code

  context.marked = (text) ->
    @textnl "<!-- Generated by Marked -->"
    @textnl _marked(text)
    @textnl "<!-- END generated by Marked -->"

  return context