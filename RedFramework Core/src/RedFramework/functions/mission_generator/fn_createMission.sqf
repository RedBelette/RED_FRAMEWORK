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