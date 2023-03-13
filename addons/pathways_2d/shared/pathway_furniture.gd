@icon("../assets/pathway_furniture_icon.png")
class_name PathwayFurniture extends Resource

## Resource to contain everything that is needed to define a type of furniture to be placed along a Pathway.

## The texture to use for this furniture item.
##
## If you leave this null, this layber will be ignored.
@export var texture: Texture2D

## Set the z index for this item. Use it if you need to resolve sorting.
##
## You can use this to put furniture below pathway layers, like railway ties for example.
@export var z_index: int = 0

## Set the scale of the texture. This will reduce the size of the furniture.
@export var texture_scale: float = 1.0

## Set's the distance, in pixels, between furniture items to be placed on the pathway.
@export var furniture_spacing: float = 100.0
