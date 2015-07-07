LayerInfo = require '../layer_info.coffee'
Descriptor = require '../descriptor.coffee'

module.exports = class PlacedLayer extends LayerInfo
  @shouldParse: (key) -> key is 'SoLd'

  parse: ->
    try
      @file.seek 12, true # Skip sig
      @data = new Descriptor(@file).parse()
    catch e
      @data['Trnf'] = [0, 0, 0, 0, 0, 0, 0, 0]

  transform: ->
    @data['Trnf']
