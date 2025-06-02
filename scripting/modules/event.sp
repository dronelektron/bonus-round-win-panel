static int g_winTeam = TEAM_UNASSIGNED;

static bool g_showTimerDefend;
static bool g_showTimerAttack;
static int g_timerTime;
static int g_finalEvent;
static int g_categoryLeft;
static int g_left1;
static int g_leftScore1;
static int g_left2;
static int g_leftScore2;
static int g_left3;
static int g_leftScore3;
static int g_categoryRight;
static int g_right1;
static int g_rightScore1;
static int g_right2;
static int g_rightScore2;
static int g_right3;
static int g_rightScore3;

bool Event_NoWinTeam() {
    return g_winTeam == TEAM_UNASSIGNED;
}

void Event_ResetWinTeam() {
    g_winTeam = TEAM_UNASSIGNED;
}

void Event_Create() {
    HookEvent(EVENT_ROUND_WIN, OnRoundWin);
    HookEvent(EVENT_ROUND_START, OnRoundStart);
    HookEvent(EVENT_WIN_PANEL, Event_WinPanel);
    HookEvent(EVENT_PLAYER_SPAWN, Event_PlayerSpawn);
}

static void OnRoundWin(Event event, const char[] name, bool dontBroadcast) {
    g_winTeam = event.GetInt(KEY_TEAM);
}

static void OnRoundStart(Event event, const char[] name, bool dontBroadcast) {
    Event_ResetWinTeam();
}

public void Event_WinPanel(Event event, const char[] name, bool dontBroadcast) {
    g_showTimerDefend = event.GetBool(KEY_SHOW_TIMER_DEFEND);
    g_showTimerAttack = event.GetBool(KEY_SHOW_TIMER_ATTACK);
    g_timerTime = event.GetInt(KEY_TIMER_TIME);
    g_finalEvent = event.GetInt(KEY_FINAL_EVENT);
    g_categoryLeft = event.GetInt(KEY_CATEGORY_LEFT);
    g_left1 = event.GetInt(KEY_LEFT_1);
    g_leftScore1 = event.GetInt(KEY_LEFT_SCORE_1);
    g_left2 = event.GetInt(KEY_LEFT_2);
    g_leftScore2 = event.GetInt(KEY_LEFT_SCORE_2);
    g_left3 = event.GetInt(KEY_LEFT_3);
    g_leftScore3 = event.GetInt(KEY_LEFT_SCORE_3);
    g_categoryRight = event.GetInt(KEY_CATEGORY_RIGHT);
    g_right1 = event.GetInt(KEY_RIGHT_1);
    g_rightScore1 = event.GetInt(KEY_RIGHT_SCORE_1);
    g_right2 = event.GetInt(KEY_RIGHT_2);
    g_rightScore2 = event.GetInt(KEY_RIGHT_SCORE_2);
    g_right3 = event.GetInt(KEY_RIGHT_3);
    g_rightScore3 = event.GetInt(KEY_RIGHT_SCORE_3);
}

public void Event_PlayerSpawn(Event event, const char[] name, bool dontBroadcast) {
    if (Event_NoWinTeam()) {
        return;
    }

    int userId = event.GetInt(KEY_USER_ID);

    Timer_ShowWinPanel(userId);
}

void Event_FireRoundWin(int client) {
    Event event = CreateEvent(EVENT_ROUND_WIN);

    event.SetInt(KEY_TEAM, g_winTeam);
    event.FireToClient(client);

    CloseHandle(event);
}

void Event_FireWinPanel(int client) {
    Event event = CreateEvent(EVENT_WIN_PANEL);

    event.SetBool(KEY_SHOW_TIMER_DEFEND, g_showTimerDefend);
    event.SetBool(KEY_SHOW_TIMER_ATTACK, g_showTimerAttack);
    event.SetInt(KEY_TIMER_TIME, g_timerTime);
    event.SetInt(KEY_FINAL_EVENT, g_finalEvent);
    event.SetInt(KEY_CATEGORY_LEFT, g_categoryLeft);
    event.SetInt(KEY_LEFT_1, g_left1);
    event.SetInt(KEY_LEFT_SCORE_1, g_leftScore1);
    event.SetInt(KEY_LEFT_2, g_left2);
    event.SetInt(KEY_LEFT_SCORE_2, g_leftScore2);
    event.SetInt(KEY_LEFT_3, g_left3);
    event.SetInt(KEY_LEFT_SCORE_3, g_leftScore3);
    event.SetInt(KEY_CATEGORY_RIGHT, g_categoryRight);
    event.SetInt(KEY_RIGHT_1, g_right1);
    event.SetInt(KEY_RIGHT_SCORE_1, g_rightScore1);
    event.SetInt(KEY_RIGHT_2, g_right2);
    event.SetInt(KEY_RIGHT_SCORE_2, g_rightScore2);
    event.SetInt(KEY_RIGHT_3, g_right3);
    event.SetInt(KEY_RIGHT_SCORE_3 , g_rightScore3);
    event.FireToClient(client);

    CloseHandle(event);
}
