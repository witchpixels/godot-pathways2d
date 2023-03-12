@tool
@icon("../assets/pathway_texture_icon.png")
class_name PathwayTerrainLayer extends Resource

## Resource to contain everything that is needed to define a terrain layer.

## The texture to use for this terrain layer. You should note that it be be stretched along a line2d
##
## If you leave this null, this layber will be ignored.
@export var texture: Texture2D: 
    get:
        return _texture
    set(value):
        if value != _texture:
            _texture = value
            emit_changed()

## Set the z index for this layer. Use it if you need to resolve sorting of one layer over another.
@export var z_index: int:
    get:
        return _z_index
    set(value):
        if value != _z_index:
            _z_index = value
            emit_changed()

## Set the scale of the texture. This will reduce the width of the line, as it will be based on the size of the texture * scale
@export var path_width: int:
    get:
        return _path_width
    set(value):
        if value != _path_width:
            _path_width = value
            emit_changed()

var _texture: Texture2D
var _z_index: int = 0
var _path_width: int = 16