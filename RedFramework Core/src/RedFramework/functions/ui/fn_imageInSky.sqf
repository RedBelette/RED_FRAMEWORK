params ["_imagePath", ["_time", 5]];

diag_log ["enter image in sky"];


[_imagePath, _time] spawn {
	diag_log ["enter image in sky on each client"];
	if (!hasInterface) exitWith {};
	diag_log ["dont take in account the server"];
	_imagePath = _this select 0;
	_time = _this select 1;

	_posPlayerHeight = [0, 0, 500];
	camera = "camera" camcreate _posPlayerHeight;
	camera cameraEffect ["internal", "back"];
	camera camCommit 0;
	showCinemaBorder false;

	sleep 2;

	[_imagePath, _time] call RF_fnc_imageFullScreen;
	sleep _time;

	cutText ["", "BLACK OUT", 1];

	player cameraEffect ["terminate","back"];
	camDestroy camera;

	cutText ["", "BLACK IN", 1];
}