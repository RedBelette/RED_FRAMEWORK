params ["_key","_action"];

_actionRegistry = missionNamespace getVariable "actionRegistry";

_verifyKey = ["containsKey", _key] call _actionRegistry;
if (_verifyKey) throw "key already exist";


["Put", [_key, _action]] call _actionRegistry;

_actionConditionRegistryMap = missionNamespace getVariable "actionConditionRegistryMap";

["Put", [_key, triggerStatements _action]] call _actionConditionRegistryMap;