#include <sourcemod>

#include "bonus-round-win-panel/event"
#include "bonus-round-win-panel/timer"

#include "modules/event.sp"
#include "modules/timer.sp"

public Plugin myinfo = {
    name = "Bonus round win panel",
    author = "Dron-elektron",
    description = "Allows you to show the win panel after respawn",
    version = "1.0.0",
    url = "https://github.com/dronelektron/bonus-round-win-panel"
};

public void OnPluginStart() {
    Event_Create();
}

public void OnMapStart() {
    Event_ResetWinTeam();
}
