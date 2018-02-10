// Only server
if (!isServer) exitWith {};
diag_log ["RedFramework initialization"];

// Desable saving
enableSaving [false, false];

// Desactivate the voice of playable units
{_x setSpeaker "NoVoice"} forEach playableUnits;

// Compile and include object oriented and hashmap (used by the cronjob registry at least)
call compilefinal preprocessFileLineNumbers "\RedFramework\lib\map\oo_hashmap.sqf";