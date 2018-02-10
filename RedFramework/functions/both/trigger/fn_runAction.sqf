params ["_key"];

_trigger = [_key] call RF_fnc_getAction;

_actionConditionRegistryMap = missionNamespace getVariable "actionConditionRegistryMap";

_statements = ["Get", _key] call _actionConditionRegistryMap;

_trigger setTriggerStatements _statements;