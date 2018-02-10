_archetypes = ["spawnMissionHelicopterCrashInTown"];
_randomMission = selectRandom _archetypes;
_missionID = "";
switch (_randomMission) do
{
	case ("spawnMissionHelicopterCrashInTown"):
	{
		_missionID = [] call RF_fnc_spawnMissionHelicopterCrashInTown;
	};

	default
	{

	};
};

_missionID