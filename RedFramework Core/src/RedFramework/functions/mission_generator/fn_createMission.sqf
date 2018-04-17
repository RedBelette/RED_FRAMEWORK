/*
* Function name / Nom de la fonction: RF_fnc_createMission
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Creates a new mission in the framework and generates an Arma task.
* This task may not be visible to players.
* Example: ["mymissionID", east, "parentMission", "Save spiderman", "Throw insecticide"] call RF_fnc_createMission;
*
* FR:
* Utilisation: Crée une nouvelle mission dans le framework et génère une tâche Arma. 
* Cette tache peut ne pas être visible par les joueurs.
* Exemple: ["mymissionID", east, "parentMission", "Sauve spiderman", "Jète l'insecticide"] call RF_fnc_createMission;
*/
params ["_missionID", "_missionTarget", "_missionParentID", "_missionTitle", "_missionDescription", ["_missionTaskType", "default"], ["_missionTaskDestination", objNull], ["_missionTaskSetCurrent", false], ["_missionTaskPriority", 0], ["_missionNotification", true], ["_missionTaskSharing", false]];


if (isNil "missionRegistryMap") then {
	missionRegistryMap = ["new", []] call OO_HASHMAP;
};

_evalMissionID = nil;
_number = 0;
_searchingKey = true;
while {_searchingKey} do {
	_evalMissionID = _missionID + str _number;
	_searchingKey = ["containsKey", _evalMissionID] call missionRegistryMap;
	_number = _number + 1;
};

_missionID = _evalMissionID;

diag_log ["create mission", _missionTarget];
[
	_missionTarget,
	[_missionID, _missionParentID],
	[_missionDescription, _missionTitle],
	_missionTaskDestination,
	_missionTaskSetCurrent,
	_missionTaskPriority,
	_missionNotification,
	_missionTaskType,
	_missionTaskSharing
] call BIS_fnc_taskCreate;

_missionParams = [];
["Put", [_missionID, _missionParams]] call missionRegistryMap;

_missionID