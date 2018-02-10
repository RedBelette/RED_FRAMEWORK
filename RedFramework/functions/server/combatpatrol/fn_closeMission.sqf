params ["_missionID", ["_missionStatus", "SUCCEEDED"], ["_missionShowHint", true]];

[_missionID, _missionStatus, _missionShowHint] spawn BIS_fnc_taskSetState;