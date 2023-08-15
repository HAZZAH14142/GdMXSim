extends VehicleBody


var max_rpm = 1000
var max_tourque = 300

func _physics_process(delta):
	var steer = -Input.get_action_strength("d") + Input.get_action_strength("a")
	steering = lerp(steering, steer * 0.5, 5 * delta)
	var acceleration = -Input.get_action_strength("s") + Input.get_action_strength("w")
	var rpm = $BR.get_rpm()
	$BR.engine_force = acceleration * max_tourque * (1 - rpm / max_rpm)
	rpm = $BL.get_rpm()
	$BL.engine_force = acceleration * max_tourque * (1 - rpm / max_rpm)
