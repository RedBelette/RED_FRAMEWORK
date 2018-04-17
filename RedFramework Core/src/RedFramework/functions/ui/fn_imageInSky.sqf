/*
* Function name / Nom de la fonction: RF_fnc_imageInSky
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Displays an image in full screen in the sky during a given time.
* Example: ["mypaa.paa", 10] call RF_fnc_imageInSky;
*
* FR:
* Utilisation: Affiche une image en plein écran dans le ciel durant un temps donnée.
* Exemple: ["mypaa.paa", 10] call RF_fnc_imageInSky;
*/
params ["_imagePath", ["_time", 5]];

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