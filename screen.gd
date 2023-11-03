extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect the finished event
	$Node/VideoStreamPlayer.finished.connect(_on_finished)

	# Start playing
	$Node/VideoStreamPlayer.play()

	# Wait 0.1 seconds then connect the video texture to the surface
	await get_tree().create_timer(0.1).timeout
	get_active_material(0).set_shader_parameter("movie", $Node/VideoStreamPlayer.get_video_texture())

func _on_finished() -> void:
	$Node/VideoStreamPlayer.play()
