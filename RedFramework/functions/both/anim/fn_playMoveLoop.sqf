params ["_unit" , "_anim"];

diag_log ["function playMoveLoop", _unit, _anim];

[[_unit, _anim], "RedFramework\script\both\sc_playMoveLoop.sqf"] remoteExec ["execVM", 0];