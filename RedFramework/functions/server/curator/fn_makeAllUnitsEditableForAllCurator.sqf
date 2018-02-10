{
	_curator = _x;
	{
		_curator addCuratorEditableObjects [[_x], true];
	} foreach allunits;
} foreach allCurators;