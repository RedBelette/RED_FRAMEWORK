_centerOfTheWorld = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_locations = nearestLocations [_centerOfTheWorld, ["NameVillage", "NameCity", "NameCityCapital"], worldSize];

_locations