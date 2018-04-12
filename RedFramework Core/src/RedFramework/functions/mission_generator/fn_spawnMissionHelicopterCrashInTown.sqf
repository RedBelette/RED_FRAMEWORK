params ["_side","_helicopterClass", "_unitTypes"];

if (isNil "_side") then {
	_side = (getMissionConfig "RedFrameworkConfig" >> "combatPatrol_CfgEnemis" >> "side") call  BIS_fnc_returnConfigEntry;
	_side = [_side] call RF_fnc_convertSideStr;
};

if (isNil "_helicopterClass") then {
	_helicopterClass = (getMissionConfig "RedFrameworkConfig" >> "combatPatrol_missions" >> "combatPatrol_helicopterCrashInTown" >> "helicopterClass") call  BIS_fnc_returnConfigEntry;
};

if (isNil "_unitTypes") then {
	_unitTypes = (getMissionConfig "RedFrameworkConfig" >> "combatPatrol_missions" >> "combatPatrol_helicopterCrashInTown" >> "unitTypes") call  BIS_fnc_returnConfigEntry;
};

_locationPos = call RF_fnc_locationGenerator;

[_locationPos] call RF_fnc_spawnCirclePatrols;
[_locationPos] call RF_fnc_spawnGarnisons;

_calculatedPos = [_locationPos, random 300, random 360] call BIS_fnc_relPos;
_vehicle = _helicopterClass createVehicle _calculatedPos;
[[_vehicle]] call RF_fnc_makeObjectsEditableForAllCurators;
removeAllItems _vehicle;
removeAllWeapons _vehicle;
clearMagazineCargo _vehicle;
clearWeaponCargoGlobal _vehicle;
_vehicle setVariable ["ace_cookoff_enable", false, true];
_vehicle setVariable ["ace_cookoff_enableAmmoCookoff", false, true];
_vehicle setDamage [1, false];
_vehicle setVectorDirAndUp [[0,0,-1],[0,1,0]];

waitUntil {!isNil "RF_fnc_spawnGarnisons"};
[getPos _vehicle, 10, _side, _unitTypes, 7] call RF_fnc_spawnGarnisons;

waitUntil {!isNil "RF_fnc_spawnCirclePatrols"};
[getPos _vehicle, 10, _side, _unitTypes, [20,10,5]] call RF_fnc_spawnCirclePatrols;

_missionID = ["generatedMissionHelicopterInTown", blufor, "", localize "str_redMissionGenerator_mission1_title", localize "str_redMissionGenerator_mission1_description"] call RF_fnc_createMission;

_marker = createMarker [_missionID, _locationPos];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [300, 300];
_marker setMarkerColor "colorOPFOR";

[[_vehicle, _missionID, _marker], {
	_vehicle = _this select 0;
	_missionID = _this select 1;
	_marker = _this select 2;

	[
		_vehicle,
		_missionID,
		localize "str_redMissionGenerator_mission1_title",
		localize "str_redMissionGenerator_mission1_progressbar",
		{
			_missionID = (_this select 0) select 0;
			_marker = (_this select 0) select 1;
			[_missionID] call RF_fnc_closeMission;
			deleteMarker _marker;
		},
		{},
		[_missionID, _marker],
		5
	] call RF_fnc_progressBar;

}] remoteExec ["BIS_fnc_spawn", 0, true];

_missionID