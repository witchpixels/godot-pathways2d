@tool
extends EditorPlugin


func _enter_tree():
	add_custom_type(
		"PathwayTerrainLayer",
		"Resource",
		preload("shared/pathway_terrain_layer.gd"),
		preload("assets/pathway_texture_icon.png")
	)
	add_custom_type(
		"PathwayFurniture",
		"Resource",
		preload("shared/pathway_furniture.gd"),
		preload("assets/pathway_furniture_icon.png")
	)
	add_custom_type(
		"Pathway2D", "Path2D", preload("pathways/pathway_2d.gd"), preload("assets/pathway_icon.png")
	)


func _exit_tree():
	remove_custom_type("Pathway2D")
	remove_custom_type("PathwayTerrainLayer")
	remove_custom_type("PathwayFurniture")
