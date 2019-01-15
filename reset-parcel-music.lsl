#include "lib/debug.lsl"

#ifndef CHECK_INTERVAL
// While the parcel is not empty, check this often to see if people have left.
#define CHECK_INTERVAL 30.0
#endif

#ifndef EMPTY_CHECK_INTERVAL
// While the parcel is empty, check this often to see if people are in the cafe again.
#define EMPTY_CHECK_INTERVAL 10.0
#endif

#ifndef EMPTY_THRESHOLD
// If the parcel has been empty for 10 minutes, then reset the radio.
#define EMPTY_THRESHOLD 600.0
#endif

integer agent_count()
{
    list agents = llGetAgentList(AGENT_LIST_PARCEL, []);
    integer count = llGetListLength(agents);

    return count;
}

default
{
    state_entry()
    {
        debug("Entering busy state. We will watch for the parcel to be empty.");
        llResetTime();
        llSetTimerEvent(CHECK_INTERVAL);
    }

    timer()
    {
        integer count = agent_count();

        if(count > 0)
            llResetTime();
        else {
            float time = llGetTime();
            if(time > EMPTY_THRESHOLD)
                state empty;
        }
    }
}

state empty
{
    state_entry()
    {
        debug("The parcel has been empty for some time. Resetting radio.");
        llSetTimerEvent(EMPTY_CHECK_INTERVAL);
        llRegionSay(RADIO_RESET_CHANNEL, "reset");
    }

    timer()
    {
        integer count = agent_count();
        if(count > 0) state default;
    }
}
