params ["_key"];

_actionRegistry = missionNamespace getVariable "actionRegistry";

_verifyKey = ["containsKey", _key] call _actionRegistry;
if (!_verifyKey) throw "Invalid key";

["Remove", _key] call _actionRegistry;

_actionConditionRegistryMap = missionNamespace getVariable "actionConditionRegistryMap";

["Remove", [_key]] call _actionConditionRegistryMap;