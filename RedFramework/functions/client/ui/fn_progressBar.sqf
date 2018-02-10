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