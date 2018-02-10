if (!isServer) exitWith {};

params ["_side", "_minTriggerReddition"];

_sideCount = _side countSide allUnits;

_redition = false;

if (_sideCount < _minTriggerReddition) then {
	{
		if (side _x == _side) then {

			if (!isNull vehicle _x) then {
				moveOut _x;
			};

			_x playmove "AmovPercMstpSsurWnonDnon";
			[_x, "AmovPercMstpSsurWnonDnon"] remoteExec ["playMove"];
			_x disableAI "ANIM";
			_x setCaptive true;
		};
	} forEach allUnits;
	_redition = true;
};
_redition;