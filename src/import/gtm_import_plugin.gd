@tool
class_name GodotTrenchGtmImportPlugin extends EditorImportPlugin
## Imports .gtm maps so they ship in exported games, where the source file is not packed.

func _get_importer_name() -> String:
	return "godottrench.gtm"

func _get_visible_name() -> String:
	return "GodotTrench Map"

func _get_resource_type() -> String:
	return "GodotTrenchImportedMap"

func _get_recognized_extensions() -> PackedStringArray:
	return PackedStringArray(["gtm"])

func _get_priority():
	return 1.0

func _get_save_extension() -> String:
	return "tres"

func _get_import_options(path, preset):
	return []

func _get_preset_count() -> int:
	return 0

func _get_import_order():
	return 0

func _import(source_file, save_path, options, r_platform_variants, r_gen_files) -> Error:
	var save_path_str: String = "%s.%s" % [save_path, _get_save_extension()]
	var map_resource: GodotTrenchImportedMap = null
	if ResourceLoader.exists(save_path_str):
		map_resource = load(save_path_str) as GodotTrenchImportedMap
	if map_resource:
		map_resource.revision += 1
	else:
		map_resource = GodotTrenchImportedMap.new()
	map_resource.map_bytes = FileAccess.get_file_as_bytes(source_file)
	return ResourceSaver.save(map_resource, save_path_str)
