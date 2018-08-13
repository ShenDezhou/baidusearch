Shell = require 'shell'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'baidusearch:baidu-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "https://www.baidu.com/s?wd=#{cased}"
        Shell.openExternal url
