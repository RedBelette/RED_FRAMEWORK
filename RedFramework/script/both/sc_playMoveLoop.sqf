_unit = _this select 0;
_anim = _this select 1;

diag_log ["script playMoveLoop", _unit, _anim];

while {true} do {
	_unit playMove _anim;
	waitUntil {!(animationState _unit == _anim)}
;