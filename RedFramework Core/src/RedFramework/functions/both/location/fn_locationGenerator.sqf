_locations = call RF_fnc_locations;
_randomLocation = _locations select (random (count _locations));
_locationPos = getPos _randomLocation;

_locationPos