/*
* Function name / Nom de la fonction: RF_fnc_missionGenerator
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Generate a random mission based on the description.ext.
* Example: call RF_fnc_missionGenerator;
*
* FR:
* Utilisation: Génère une mission aléatoire sur base du description.ext.
* Exemple: call RF_fnc_missionGenerator;
*/

// get all the mission paths by the description.ext
_missionPathsConfig = (getMissionConfig "RedFrameworkConfig" >> "MissionGenerator" >> "missionPaths") call  BIS_fnc_returnConfigEntry;

// create the registry when it's not already created
if (isNil "missionGeneratorExcludedPath") then {
	missionGeneratorExcludedPath = ["new", []] call OO_HASHMAP;
};

// Separe the mission who can be looped or not. 
// Create by script can be looped.
// Create by 3den cannot be looped at this time.
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