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
    HookEvent("dod_round_win", Event_RoundWin);
    HookEvent("dod_round_start", Event_RoundStart);
    HookEvent("dod_win_panel", Event_WinPanel);
    HookEvent("player_spawn", Event_PlayerSpawn);
}

public void Event_RoundWin(Event event, const char[] name, bool dontBroadcast) {
    g_winTeam = event.GetInt("team");
}

public void Event_RoundStart(Event event, const char[] name, bool dontBroadcast) {
    Event_ResetWinTeam();
}

public void Event_WinPanel(Event event, const char[] name, bool dontBroadcast) {
    g_showTimerDefend = event.GetBool("show_timer_defend");
    g_showTimerAttack = event.GetBool("show_timer_attack");
    g_timerTime = event.GetInt("timer_time");
    g_finalEvent = event.GetInt("final_event");
    g_categoryLeft = event.GetInt("category_left");
    g_left1 = event.GetInt("left_1");
    g_leftScore1 = event.GetInt("left_score_1");
    g_left2 = event.GetInt("left_2");
    g_leftScore2 = event.GetInt("left_score_2");
    g_left3 = event.GetInt("left_3");
    g_leftScore3 = event.GetInt("left_score_3");
    g_categoryRight = event.GetInt("category_right");
    g_right1 = event.GetInt("right_1");
    g_rightScore1 = event.GetInt("right_score_1");
    g_right2 = event.GetInt("right_2");
    g_rightScore2 = event.GetInt("right_score_2");
    g_right3 = event.GetInt("right_3");
    g_rightScore3 = event.GetInt("right_score_3");
}

public void Event_PlayerSpawn(Event event, const char[] name, bool dontBroadcast) {
    if (Event_NoWinTeam()) {
        return;
    }

    int userId = event.GetInt("userid");

    Timer_ShowWinPanel(userId);
}

void Event_FireRoundWin(int client) {
    Event event = CreateEvent("dod_round_win");

    event.SetInt("team", g_winTeam);
    event.FireToClient(client);
}

void Event_FireWinPanel(int client) {
    Event event = CreateEvent("dod_win_panel");

    event.SetBool("show_timer_defend", g_showTimerDefend);
    event.SetBool("show_timer_attack", g_showTimerAttack);
    event.SetInt("timer_time", g_timerTime);
    event.SetInt("final_event", g_finalEvent);
    event.SetInt("category_left", g_categoryLeft);
    event.SetInt("left_1", g_left1);
    event.SetInt("left_score_1", g_leftScore1);
    event.SetInt("left_2", g_left2);
    event.SetInt("left_score_2", g_leftScore2);
    event.SetInt("left_3", g_left3);
    event.SetInt("left_score_3", g_leftScore3);
    event.SetInt("category_right", g_categoryRight);
    event.SetInt("right_1", g_right1);
    event.SetInt("right_score_1", g_rightScore1);
    event.SetInt("right_2", g_right2);
    event.SetInt("right_score_2", g_rightScore2);
    event.SetInt("right_3", g_right3);
    event.SetInt("right_score_3", g_rightScore3);
    event.FireToClient(client);
}
