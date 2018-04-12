/*
* Function name / Nom de la fonction: RF_fnc_delayedAction
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN: 
* Usage: This function acts as a trigger and executes code when a condition is true with a delay time.
* Example: ["alive michel", "michel setDamage 1", 100] call RF_fnc_delayedAction
* 
* FR: 
* Utilisation: Cette fonction agit comme un trigger et exécute du code lorsqu'une condition est vrai avec un délai de retard.
* Exemple: ["alive michel", "michel setDamage 1", 100] call RF_fnc_delayedAction
*/


params ["_condition", "_job", "_time"];

_trigger = createTrigger ["EmptyDetector", [0,0,0], false];
_trigger setTriggerActivation ["NONE", "PRESENT", false];
_trigger setTriggerStatements [_condition, _job, ""];
_trigger setTriggerTimeout [_time, _time, _time, false];

_trigger