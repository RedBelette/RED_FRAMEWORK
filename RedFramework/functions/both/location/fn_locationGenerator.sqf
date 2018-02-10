_locations = call RF_fnc_locations;
_randomLocation = _locations select (random (count _locations));

_markerName = "MissionZone";
if (isNil "locationMarkerArray") then {
	locationMarkerArray = [];
	locationMarkerIndex = 0;
	_markerName = _markerName + STR locationMarkerIndex;
} else {
	locationMarkerIndex = locationMarkerIndex + 1;
	_cutMarkerName = [_markerName, 0, 10] call CBA_fnc_substring;
	_markerName = _cutMarkerName + STR locationMarkerIndex;
};

_locationPos = getPos _randomLocation;
_marker1 = createMarker [_markerName, _locationPos];
_markerName setMarkerShape "ELLIPSE";
_markerName setMarkerSize [300, 300];
_markerName setMarkerColor "colorOPFOR";

locationMarkerArray pushBack _markerName;

_locationPos