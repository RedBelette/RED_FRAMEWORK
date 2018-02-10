params ["_key"];

_actionRegistry = missionNamespace getVariable "actionRegistry";

_verifyKey = ["containsKey", _key] call _actionRegistry;
if (!_verifyKey) throw "Invalid key";

_action = ["Get", _key] call _actionRegistry;

_action