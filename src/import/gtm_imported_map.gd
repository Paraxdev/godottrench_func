@icon("res://addons/func_godot/icons/icon_quake_file.svg")
class_name GodotTrenchImportedMap extends Resource
## A .gtm map as imported by Godot, read by [GodotTrenchGtmFile] in exported games where the source file is not packed.

## Number of times this map file has been imported.
@export var revision: int = 0

## The file's bytes, the binary container or the JSON of older maps.
@export var map_bytes: PackedByteArray
