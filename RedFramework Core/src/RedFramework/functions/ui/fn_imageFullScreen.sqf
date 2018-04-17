/*
* Function name / Nom de la fonction: RF_fnc_imageFullScreen
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Displays an image in full screen for a given time.
* Example: ["mypaa.paa", 10] call RF_fnc_imageFullScreen;
*
* FR:
* Utilisation: Affiche une image en plein écran durant un temps donnée.
* Exemple: ["mypaa.paa", 10] call RF_fnc_imageFullScreen;
*/
if (isServer and !hasInterface) exitWith {};

params ["_imagePAA", "_time"];

[_imagePAA, _time] spawn {

	_imagePAA = (_this select 0);
	_time = (_this select 1);

	_x = 0.00125001 * safezoneW + safezoneX;
	_y = -0.00399999 * safezoneH + safezoneY;
	_w = 0.9975 * safezoneW;
	_h = 1.008 * safezoneH;

	with uiNamespace do {
		titleImage = findDisplay 46 ctrlCreate ["RscPicture", -1];
		titleImage ctrlSetPosition [_x,_y,_w,_h];
		titleImage ctrlCommit 0;
		titleImage ctrlSetText _imagePAA;
	};

	sleep _time;

	with uiNamespace do {
		ctrlDelete titleImage;
	};
};