_missionPaths = (getMissionConfig "RedFrameworkConfig" >> "MissionGenerator" >> "missionPaths") call  BIS_fnc_returnConfigEntry;

if (isNil "missionGeneratorExcludedPath") then {
	missionGeneratorExcludedPath = ["new", []] call OO_HASHMAP;
};

_missionPathSelected = selectRandom _missionPaths;
_missionPath = "";
_replay = true;
if (typeName _missionPathSelected == "ARRAY") then {
	_missionPath = _missionPathSelected select 0;
	_replay = (_missionPathSelected select 1) == "true";
	_excluded = ["containsKey", _missionPath] call missionGeneratorExcludedPath;
	_missionAvailable = (("size" call missionGeneratorExcludedPath) < (count _missionPaths));
	diag_log ["missionGenerator", _replay, _excluded, _missionAvailable];
	while {!_replay and _excluded and _missionAvailable} do
	{
		["put", [_missionPath, []]] call missionGeneratorExcludedPath;
		call RF_fnc_missionGenerator;
		return;
	};
} else {
	_missionPath = _missionPathSelected;
};

execVM _missionPath;

_missionID = [_missionPath, false, "", "", ""] call RF_fnc_createMission;

_missionID