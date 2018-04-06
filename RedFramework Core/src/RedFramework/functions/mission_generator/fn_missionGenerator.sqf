_missionPathsConfig = (getMissionConfig "RedFrameworkConfig" >> "MissionGenerator" >> "missionPaths") call  BIS_fnc_returnConfigEntry;

if (isNil "missionGeneratorExcludedPath") then {
	missionGeneratorExcludedPath = ["new", []] call OO_HASHMAP;
};

_missionWithNoReplayArray = [];
_missionPaths = [];
{
	if (typeName _x == "ARRAY") then {
		_missionPath = (_x select 0);
		_replay = (_x select 1) == "true";
		_excluded = ["containsKey", _missionPath] call missionGeneratorExcludedPath;
		if (_replay or (!_replay and !_excluded))  then {
			_missionPaths pushBack _missionPath;
			if (!_replay) then {
				_missionWithNoReplayArray pushBack _missionPath;
			};
		};
	} else {
		_missionPaths pushBack _x;
	};
} forEach _missionPathsConfig;

_missionPathSelected = selectRandom _missionPaths;
{
	if (_missionPathSelected == _x) then {
		["put", [_missionPathSelected, []]] call missionGeneratorExcludedPath;
	};
} forEach _missionWithNoReplayArray;

execVM _missionPathSelected;

_missionID = [_missionPathSelected, false, "", "", ""] call RF_fnc_createMission;

_missionID