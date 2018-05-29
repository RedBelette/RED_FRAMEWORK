/*
* Function name / Nom de la fonction: RF_fnc_remoteAction
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.7
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: This function acts as a trigger and executes code when a condition is true on remote target.
* Example: ["alive michel", "michel setDamage 1"] call RF_fnc_remoteAction
* Example2: ["alive michel", {(_params select 0) setDamage 1}, [michel]] call RF_fnc_remoteAction
*
* FR:
* Utilisation: Cette fonction agit comme un trigger et exécute du code lorsqu'une condition est vrai.
* Example: ["alive michel", "michel setDamage 1"] call RF_fnc_remoteAction
* Example2: ["alive michel", {(_params select 0) setDamage 1}, [michel]] call RF_fnc_remoteAction
*/

params ["_condition", "_job", "_time", ["_params", []], ["_remoteTarget", 0]];

// Accept code with parameters
if (typeName _job == "CODE") then {
	_job = format["[_params] spawn %1;", str(_job)];
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

[_job, _time, _params] call RF_fnc_repeatedAction;