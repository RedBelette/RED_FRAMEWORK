params ["_objects"];

{
	_curator = _x;
	{
		_curator addCuratorEditableObjects [[_x], true];
	} foreach _objects;
} foreach allCurators;