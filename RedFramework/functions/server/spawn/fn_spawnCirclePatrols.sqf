params ["_modulePos", "_distanceRadius", "_side", "_unitTypes", "_radiusPatrols"];

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

_stepDir = 360 / _maxPatrol;
_dir = 0;
_i = 0;
_allGroups = [];
for [{_i = 0}, {_i < _maxPatrol}, {_i = _i + 1; _dir = _dir + _stepDir}] do {
	_calculatedPos = [_modulePos, _distanceRadius, _dir] call BIS_fnc_relPos;
	_spawnedGroup = [_side, _unitTypes select _i, _calculatedPos] call RF_fnc_spawnUnits;
	_spawnedGroup setBehaviour "SAFE";
	_spawnedGroup setSpeedMode "LIMITED";
	[_spawnedGroup, getPos leader _spawnedGroup, _radiusPatrols select _i] call CBA_fnc_taskPatrol;
	_allGroups pushBack _spawnedGroup;
};

_allGroups