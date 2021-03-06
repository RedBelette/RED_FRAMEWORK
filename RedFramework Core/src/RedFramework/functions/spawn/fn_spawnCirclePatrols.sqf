/*
* Function name / Nom de la fonction: RF_fnc_spawnCirclePatrols
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Create patrols around an area based on the description.ext or parameters.
* Example: call RF_fnc_spawnCirclePatrols;
*
* FR:
* Utilisation: Créer des patrouilles autour d'une zone sur base du description.ext ou des paramètres.
* Exemple: call RF_fnc_spawnCirclePatrols;
*/
params ["_modulePos", "_distanceRadius", "_side", "_unitTypes", "_radiusPatrols"];

// Get the configuration from description.ext when no parameters
if (isNil "_distanceRadius") then {
	_distanceRadius = (getMissionConfig "RedFrameworkConfig" >> "combatPatrol_SpawnCirclePatrols" >> "distance") call  BIS_fnc_returnConfigEntry;
};

if (isNil "_side") then {
	_side = (getMissionConfig "RedFrameworkConfig" >> "combatPatrol_CfgEnemis" >> "side") call  BIS_fnc_returnConfigEntry;
	_side = [_side] call RF_fnc_convertSideStr;
};

if (isNil "_unitTypes") then {
	_unitTypes = (getMissionConfig "RedFrameworkConfig" >> "combatPatrol_SpawnCirclePatrols" >> "unitTypes") call  BIS_fnc_returnConfigEntry;
};

if (isNil "_radiusPatrols") then {
	_radiusPatrols = (getMissionConfig "RedFrameworkConfig" >> "combatPatrol_SpawnCirclePatrols" >> "radiusPatrols") call  BIS_fnc_returnConfigEntry;
};

_maxPatrol = count _unitTypes;

// stepDir is the incremental value
_stepDir = 360 / _maxPatrol;
_dir = 0;
_i = 0;
_allGroups = [];
for [{_i = 0}, {_i < _maxPatrol}, {_i = _i + 1; _dir = _dir + _stepDir}] do {
	// create the group at the correct position
	_calculatedPos = [_modulePos, _distanceRadius, _dir] call BIS_fnc_relPos;
	_spawnedGroup = [_side, _unitTypes select _i, _calculatedPos] call RF_fnc_spawnUnits;
	// Stay calm
	_spawnedGroup setBehaviour "SAFE";
	_spawnedGroup setSpeedMode "LIMITED";
	// Order to patrol
	[_spawnedGroup, getPos leader _spawnedGroup, _radiusPatrols select _i] call CBA_fnc_taskPatrol;
	_allGroups pushBack _spawnedGroup;
};
// return all the generated group if the user to do more specifics
_allGroups