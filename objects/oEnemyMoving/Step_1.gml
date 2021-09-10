/// @description Insert description here
// You can write your code in this editor
var _targetX = endX, _targetY = endY;
if (goingToStart) {
	_targetX = startX;
	_targetY = startY;
}

// Set movement
moveX = sign(_targetX - x) * currentSpeed;
moveY = sign(_targetY -y) * currentSpeed;