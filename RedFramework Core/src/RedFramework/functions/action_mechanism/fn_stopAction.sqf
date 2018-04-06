params ["_key"];

_trigger = [_key] call RF_fnc_getAction;

_statements = ["","",""];

_trigger setTriggerStatements _statements;