/*
* Function name / Nom de la fonction: RF_fnc_huntirSatellite
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN: 
* Usage:This feature allows you to use a huntir ammo as a satellite that you can later use via ACE's 
* huntir monitor.
* Example: [satellitePos] call RF_fnc_huntirSatellite
* 
* FR: 
* Utilisation: Cette fonction permet de vous servir d'une munition huntir comme d'un satellite que vous
* pouvez par la suite utiliser via le huntir monitor de ACE.
* Exemple: [satellitePos] call RF_fnc_huntirSatellite; 
*/

if (!isServer) exitWith {};

params ["_position"];

_satelittePosX = _position select 0;
_satelittePosY = _position select 1;
_satelittePosZ = _position select 2;

_satelitte = "ACE_HuntIR" createVehicle [_satelittePosX,_satelittePosY,_satelittePosZ];
_satelitte setPos [_satelittePosX,_satelittePosY,_satelittePosZ];

hideObject _satelitte;
_satelitte allowDamage false;

[_satelitte, _satelittePosX, _satelittePosY, _satelittePosZ] spawn {
	_satelitte = _this select 0;
	_satelittePosX = _this select 1;
	_satelittePosY = _this select 2;
	_satelittePosZ = _this select 3;
	while {true} do {
		_satelitte setVelocityTransformation [
			[_satelittePosX,_satelittePosY,_satelittePosZ],
			[_satelittePosX,_satelittePosY,_satelittePosZ],
			[0,0,0],
			[0,0,0],
			[0,0,0],
			[0,0,0],
			[0,0,0],
			[0,0,0],
			0
		];
		sleep 0.3;
	};
};

_satelitte