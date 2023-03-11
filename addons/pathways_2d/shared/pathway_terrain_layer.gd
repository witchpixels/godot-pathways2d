@tool
@icon("../assets/pathway_texture_icon.png")
class_name PathwayTerrainLayer extends Resource

## Resource to contain everything that is needed to define a terrain layer.

## The texture to use for this terrain layer. You should note that it be be stretched along a line2d
##
## If you leave this null, this layber will be ignored.
@export var texture: Texture2D

## Set the z index for this layer. Use it if you need to resolve sorting of one layer over another.
@export var z_index: int = 0

## Set the scale of the texture. This will reduce the width of the line, as it will be based on the size of the texture * scale
@export var texture_scale: float = 1.0