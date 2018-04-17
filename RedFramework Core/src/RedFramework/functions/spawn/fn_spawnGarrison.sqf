/*
* Function name / Nom de la fonction: RF_fnc_spawnGarrison
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Create garrisons around an area based on the description.ext or parameters.
* Example: call RF_fnc_spawnGarrison;
*
* FR:
* Utilisation: Créer des garnisons autour d'une zone sur base du description.ext ou des paramètres.
* Exemple: call RF_fnc_spawnGarrison;
*/
params ["_position", "_distanceGarnison", "_side", "_unitTypes", "_ramdomizeDistance"];

if (isNil "_distanceGarnison") then {
	_distanceGarnison = (getMissionConfig "RedFrameworkConfig" >> "combatPatrol_SpawnGarnisons" >> "distance") call  BIS_fnc_returnConfigEntry;
};

if (isNil "_side") then {
	_side = (getMissionConfig "RedFrameworkConfig" >> "combatPatrol_CfgEnemis" >> "side") call BIS_fnc_returnConfigEntry;
	_side = [_side] call RF_fnc_convertSideStr;
};

if (isNil "_unitTypes") then {
	_unitTypes = (getMissionConfig "RedFrameworkConfig" >> "combatPatrol_SpawnGarnisons" >> "unitTypes") call BIS_fnc_returnConfigEntry;
};

if (isNil "_ramdomizeDistance") then {
	_ramdomizeDistance = (getMissionConfig "RedFrameworkConfig" >> "combatPatrol_SpawnGarnisons" >> "ramdomizeDistance") call BIS_fnc_returnConfigEntry;
};

_allSpawnedGroup = [];
_maxInsideGarnison = count _unitTypes;
_stepDir = 360 / _maxInsideGarnison;
for [{_i = 0; _dir = 0}, {_i < _maxInsideGarnison}, {_i = _i + 1; _dir = _dir + _stepDir}] do {
	_distanceGarnison = _distanceGarnison - (random _ramdomizeDistance);
	_calculatedPos = [_position, _distanceGarnison, _dir] call BIS_fnc_relPos;
	_nearBuilding = nearestBuilding _calculatedPos;
	_spawnedGroup = [_side, _unitTypes select _i, getPos _nearBuilding] call RF_fnc_spawnUnits;
	_spawnedGroup setBehaviour "SAFE";
	_spawnedGroup setSpeedMode "LIMITED";
	[_spawnedGroup] call CBA_fnc_taskDefend;

	_allSpawnedGroup pushBack _spawnedGroup;
};

_allSpawnedGroup