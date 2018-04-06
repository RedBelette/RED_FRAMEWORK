params ["_unit" , "_anim"];

diag_log ["function playMoveLoop", _unit, _anim];
[["_unit,anim"],{
params ["_unit" , "_anim"];
diag_log ["script playMoveLoop", _unit, _anim];

while {true} do {
	_unit switchMove _anim;
	waitUntil {!(animationState _unit == _anim)}
;
}] RemoteExec ["Spawn", 0, true];
//[[_unit, _anim], "RedFramework\script\both\sc_playMoveLoop.sqf"] remoteExec ["execVM", 0];