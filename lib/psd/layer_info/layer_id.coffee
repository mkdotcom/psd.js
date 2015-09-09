LayerInfo = require '../layer_info.coffee'

module.exports = class LayerId extends LayerInfo
  @shouldParse: (key) -> key is 'lyid'

  constructor: (layer, length) ->
    super(layer, length)
    @id = null

  parse: ->
    @id = @file.readInt()

  export: ->
    id: @id
