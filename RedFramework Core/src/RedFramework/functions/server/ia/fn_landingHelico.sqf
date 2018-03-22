if (!isServer) exitWith {};

params ["_helicoGroup", "_returnPos"];

helicoBack = false;

diag_log ["RF_fnc_landingHelico", _helicoGroup, _returnPos];

while {(count (waypoints _helicoGroup)) > 0} do {
	deleteWaypoint ((waypoints _helicoGroup) select 0);
};

_helicoGroup setBehaviour "CARELESS";
_helicoGroup setCombatMode "BLUE";

_helicoGroup addWaypoint [_returnPos,0];

_helicoSave = "";
_helicos = [];
{
 if !(_helicoSave isEqualTo (vehicle _x)) then {
	  _helicoSave = vehicle _x;
	  _helicos pushBack _helicoSave;
 };

} forEach units _helicoGroup;

{
	_heli = _x;

	[_heli, _returnPos] spawn {
		_heli = _this select 0;
		_returnPos = _this select 1;

		diag_log ["Landing by plane", _heli, _returnPos, str(alive _heli and (_heli distance _returnPos) < 300)];

		while {alive _heli and (_heli distance _returnPos) > 300} do {};

		diag_log ["Landing", _heli, _returnPos, _heli distance _returnPos];

		sleep random 30;

		_heli land "LAND";

		while {alive _heli and !isTouchingGround _heli} do {};

		diag_log ["stop Fueld", _heli, _returnPos];
		_heli setFuel 0;

		diag_log ["Landing by plane end", _heli, _returnPos, str(alive _heli and (_heli distance _returnPos) < 300)];
	};

} forEach _helicos;