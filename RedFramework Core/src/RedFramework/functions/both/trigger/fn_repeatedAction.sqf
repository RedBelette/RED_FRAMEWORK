params ["_job", "_time"];

_trigger = createTrigger ["EmptyDetector", [0,0,0], false];
_trigger setTriggerActivation ["NONE", "PRESENT", true];
_trigger setTriggerStatements ["!(triggerActivated thisTrigger)", _job, ""];
_trigger setTriggerTimeout [_time, _time, _time, true];

_trigger