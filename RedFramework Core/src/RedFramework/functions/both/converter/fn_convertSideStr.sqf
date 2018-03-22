params ["_side"];

switch (_side) do
{
	case "east":
	{
		_side = east;
	};

	case "west":
	{
		_side = west;
	};

	case "resistance":
	{
		_side = resistance;
	};

	case "civilian":
	{
		_side = civilian;
	};

	default
	{
		_side = nil;
	};
};

_side