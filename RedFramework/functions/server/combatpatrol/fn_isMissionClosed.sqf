params ["_missionID"];

_type = [_missionID] call RF_fnc_missionState;

_isMissionClosed = false;
if (_type == 'Succeeded' or _type == 'Failed' or _type == 'Canceled') then {
	_isMissionClosed = true;
};

_isMissionClosed
