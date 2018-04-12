/*
* Function name / Nom de la fonction: RF_fnc_playMoveLoop
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Play a looping animation with the playMove instruction
* Example: [player, "amovppnemstpsraswrfldnon"] call RF_fnc_playMoveLoop;
*
* FR:
* Utilisation: Joue une animation en boucle avec l'instruction playMove
* Exemple: [player, "amovppnemstpsraswrfldnon"] call RF_fnc_playMoveLoop;
*/
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