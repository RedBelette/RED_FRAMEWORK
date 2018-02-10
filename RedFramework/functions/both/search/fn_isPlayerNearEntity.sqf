params ["_entity", "_radius"];

_found = false;
_entities = _entity nearEntities _radius;

{
	if (isPlayer _x) then {
		_found = true;
	};
} forEach _entities;

_found