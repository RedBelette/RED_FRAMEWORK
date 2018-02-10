params ["_condition", "_job", "_time"];

_trigger = createTrigger ["EmptyDetector", [0,0,0], false];
_trigger setTriggerActivation ["NONE", "PRESENT", false];
_trigger setTriggerStatements [_condition, _job, ""];
_trigger setTriggerTimeout [_time, _time, _time, false];

_trigger