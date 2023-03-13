@tool
@icon("../assets/pathway_icon.png")
class_name Pathway2D extends Path2D

## Represents and open end (not closed loop) path, with an artibrary number of textures and terrain furniture.
##
## Currently nothing really stops you from looping the path, but I can't guarentee you won't get wierd rendering results if you do this.
## I do plan on including a closed path version of this, which will be largely the same, but this one will eventually support end caps for terrain.
##
## @tutorial:            https://github.com/witchpixels/godot-pathways_2D/blob/main/README.md

const TerrainLayer = preload("../shared/pathway_terrain_layer.gd")
const Furniture = preload("../shared/pathway_furniture.gd")

@export @export_group("Terrain Layers")
var terrain_layers: Array[TerrainLayer] = []

@export @export_group("Furniture")
var furniture_items: Array[Furniture] = []

var path_layer_callable_handles: Dictionary = Dictionary()


func _ready():
	curve.changed.connect(curved_has_changed)


func _process(_delta):
	for i in range(terrain_layers.size()):
		if terrain_layers[i] == null:
			continue

		var callable: Callable = Callable(self, "path_layer_changed")
		callable = callable.bind(i)

		if path_layer_callable_handles.has(i):
			callable = path_layer_callable_handles[i]

			if terrain_layers[i].is_connected("changed", callable):
				continue
		else:
			path_layer_callable_handles[i] = callable

		print("(re)Connected terrain layer ", i)
		terrain_layers[i].changed.connect(callable)
		call_deferred("path_layer_changed", i)


func curved_has_changed():
	_apply_curves_to_lines()
	pass


func path_layer_changed(index: int):
	var path_layer := terrain_layers[index]

	print(path_layer)

	var line_2D: Line2D = get_node_or_null("./layer" + str(index))

	if line_2D == null:
		print("No line2D found for layer ", index, " creating one")

		line_2D = Line2D.new()
		line_2D.name = "layer" + str(index)
		line_2D.texture_mode = Line2D.LineTextureMode.LINE_TEXTURE_TILE
		line_2D.texture_repeat = CanvasItem.TextureRepeat.TEXTURE_REPEAT_ENABLED

		add_child(line_2D)
		call_deferred("curved_has_changed")

	line_2D.texture = path_layer.texture
	line_2D.width = path_layer.path_width
	line_2D.z_index = path_layer.z_index


func _apply_curves_to_lines():
	var points = curve.get_baked_points()

	for index in range(terrain_layers.size()):
		var line_2D: Line2D = get_node_or_null("./layer" + str(index))
		if line_2D != null:
			line_2D.points = points
