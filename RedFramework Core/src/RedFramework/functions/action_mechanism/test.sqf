["true", {
	params ["_params"];
	[
		_params,
		{
		 params ["_params"];
		 hint _params;
		}
	] remoteExec ["call",0];
}, ["andrea"]] call RF_fnc_action;
