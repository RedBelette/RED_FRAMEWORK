/*
* Function name / Nom de la fonction: RF_fnc_action
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: This function acts as a trigger and executes code when a condition is true.
* Example: ["alive michel", "michel setDamage 1"] call RF_fnc_action
* Example2: ["alive michel", {michel setDamage 1}] call RF_fnc_action
*
* FR:
* Utilisation: Cette fonction agit comme un trigger et exécute du code lorsqu'une condition est vrai.
* Exemple: ["alive michel", "michel setDamage 1"] call RF_fnc_action
* Example2: ["alive michel", {michel setDamage 1}] call RF_fnc_action
*/

params ["_condition", "_job", ["_params", []]];

// Accept stringcode with parameters
if (typeName _job == "STRING") then {
	_job = format["[thisTrigger getVariable 'params'] spawn {%1};", _job];
};

// Accept code with parameters
if (typeName _job == "CODE") then {
	_job = format["[thisTrigger getVariable 'params'] spawn %1;", str(_job)];
};

_trigger = createTrigger ["EmptyDetector", [0,0,0], false];
_trigger setVariable ["params", _params];
_trigger setTriggerActivation ["NONE", "PRESENT", false]; // The condition replace the basic trigger activation
_trigger setTriggerStatements [_condition, _job, ""];

// The trigger is return if the user want make something more specific
_trigger