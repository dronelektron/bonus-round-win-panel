void Timer_ShowWinPanel(int userId) {
    CreateTimer(TIMER_WIN_PANEL_DELAY, Timer_OnShowWinPanel, userId, TIMER_WIN_PANEL_FLAGS);
}

public Action Timer_OnShowWinPanel(Handle timer, int userId) {
    int client = GetClientOfUserId(userId);

    if (client == INVALID_CLIENT || Event_NoWinTeam()) {
        return Plugin_Continue;
    }

    Event_FireRoundWin(client);
    Event_FireWinPanel(client);

    return Plugin_Continue;
}
