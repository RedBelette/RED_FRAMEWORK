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

params ["_condition", "_job", ["_params", []], ["_remoteTarget", 0]];

// Accept code with parameters
if (typeName _job == "CODE") then {
	_job = format["[thisTrigger getVariable 'params'] spawn %1;", str(_job)];
};

_job = format ["
	params ['_params'];
	[
		_params,
		{
		 params ['_params'];
		 %1;
		}
	] remoteExec ['call', %2];
	", _job, _remoteTarget];

[_condition, _job, _params] call RF_fnc_action;
