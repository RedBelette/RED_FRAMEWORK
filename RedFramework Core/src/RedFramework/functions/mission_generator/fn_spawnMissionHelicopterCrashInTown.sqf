/*
* Function name / Nom de la fonction: RF_fnc_spawnMissionHelicopterCrashInTown
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Generates an example mission based on the condig file or past parameters.
* Example: call RF_fnc_spawnMissionHelicopterCrashInTown;
*
* FR:
* Utilisation: Génère une mission d'exemple sur base du fichier de condig ou des paramètres passées.
* Exemple: call RF_fnc_missRF_fnc_spawnMissionHelicopterCrashInTownionState;
*/
params ["_side","_helicopterClass", "_unitTypes"];

// Get all the configuration from description.ext if the parameters arent present.
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

// Get random location
_locationPos = call RF_fnc_locationGenerator;

// Spawn patrol and garrison
[_locationPos] call RF_fnc_spawnCirclePatrols;
[_locationPos] call RF_fnc_spawnGarrisons;

// Perform random position inside random location
_calculatedPos = [_locationPos, random 300, random 360] call BIS_fnc_relPos;
// Spawn helicopter
_vehicle = _helicopterClass createVehicle _calculatedPos;
// Add object editable for zeus
[[_vehicle]] call RF_fnc_makeObjectsEditableForAllCurators;
// Remove items
removeAllItems _vehicle;
removeAllWeapons _vehicle;
clearMagazineCargo _vehicle;
clearWeaponCargoGlobal _vehicle;
// Stop ace cooking
_vehicle setVariable ["ace_cookoff_enable", false, true];
_vehicle setVariable ["ace_cookoff_enableAmmoCookoff", false, true];
// Kill the helicopter
_vehicle setDamage [1, false];
// Turn the helicopter
_vehicle setVectorDirAndUp [[0,0,-1],[0,1,0]];

waitUntil {!isNil "RF_fnc_spawnGarrisons"};
[getPos _vehicle, 10, _side, _unitTypes, 7] call RF_fnc_spawnGarrisons;

waitUntil {!isNil "RF_fnc_spawnCirclePatrols"};
[getPos _vehicle, 10, _side, _unitTypes, [20,10,5]] call RF_fnc_spawnCirclePatrols;

// Create mission
_missionID = ["generatedMissionHelicopterInTown", blufor, "", localize "str_redMissionGenerator_mission1_title", localize "str_redMissionGenerator_mission1_description"] call RF_fnc_createMission;

// Create marker
_marker = createMarker [_missionID, _locationPos];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [300, 300];
_marker setMarkerColor "colorOPFOR";

// Add progress bar on the helicopter by remote exec
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
			// Close the mission when the progress bar is ended
			_missionID = (_this select 0) select 0;
			_marker = (_this select 0) select 1;
			[_missionID] call RF_fnc_closeMission;
			deleteMarker _marker;
		},
		{},
		[_missionID, _marker],
		5
	] call RF_fnc_progressBar;

}] remoteExec ["BIS_fnc_spawn", 0, true]; // Add the progress bar on each client

_missionID