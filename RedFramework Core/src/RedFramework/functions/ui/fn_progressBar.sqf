/*
* Function name / Nom de la fonction: RF_fnc_progressBar
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Simplify the code to create a progress bar.
* Example: [myObject, "progressId", "Progress me", "Title", "hint 'Hello'", "hint 'Hey!'", [], 30] call RF_fnc_progressBar;
*
* FR:
* Utilisation: Simplifie le code pour gérér une barre de progression.
* Exemple: [myObject, "progressId", "Progress me", "Title", "hint 'Hello'", "hint 'Hey!'", [], 30] call RF_fnc_progressBar;
*/
params ["_targetObject", "_progressBarID", "_actionTitle", "_progressBarTitle", "_executeCode", "_cancelCode", "_params", "_time", ["_actionType", 0], ["_parentPath", ["ACE_MainActions"]], ["_actionIcon", ""]];

_action = [_progressBarID,
		_actionTitle,
		_actionIcon,
		{
			_executeCode = (_this select 2) select 0;
			_cancelCode = (_this select 2) select 1;
			_progressBarTitle = (_this select 2) select 2;
			_time = (_this select 2) select 3;
			_params = (_this select 2) select 4;
			[
				_time,
				_params,
				_executeCode,
				_cancelCode,
				_progressBarTitle
			] call ace_common_fnc_progressBar;
		},
		{true},
		{},
		[_executeCode, _cancelCode, _progressBarTitle, _time, _params]
	] call ace_interact_menu_fnc_createAction;
[_targetObject, _actionType, _parentPath, _action] call ace_interact_menu_fnc_addActionToObject;