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

@export
@export_group("Terrain Layers")
var terrain_layers: Array[TerrainLayer] = []


@export
@export_group("Furniture")
var furniture_items: Array[Furniture] = []

var path_layer_callable_handles: Dictionary = Dictionary()

func _ready():
    pass

func _process(_delta):
    for i in range(terrain_layers.size()):
        if terrain_layers[i] == null:
            continue

        var callable: Callable = Callable(self, "path_layer_changed");
        callable = callable.bind(i);

        if path_layer_callable_handles.has(i):
            callable = path_layer_callable_handles[i]

            if terrain_layers[i].is_connected("changed", callable):
                continue
        else:
            path_layer_callable_handles[i] = callable


        print("(re)Connected terrain layer", i)
        terrain_layers[i].connect("changed", callable)


func path_layer_changed(index):
    print("path layer ", index, "changed")
