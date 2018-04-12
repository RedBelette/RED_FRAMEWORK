/*
* Function name / Nom de la fonction: RF_fnc_repeatedAction
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN: 
* Usage: This function acts as a trigger and executes code every x seconds.
* Example: ["hint 'again'", 60] call RF_fnc_repeatedAction
* 
* FR: 
* Utilisation: Cette fonction agit comme un trigger et exécute du code toutes x secondes.
* Exemple: ["hint 'again'", 60] call RF_fnc_repeatedAction
*/

params ["_job", "_time"];

_trigger = createTrigger ["EmptyDetector", [0,0,0], false];
_trigger setTriggerActivation ["NONE", "PRESENT", true];
_trigger setTriggerStatements ["!(triggerActivated thisTrigger)", _job, ""];
_trigger setTriggerTimeout [_time, _time, _time, true];

_trigger