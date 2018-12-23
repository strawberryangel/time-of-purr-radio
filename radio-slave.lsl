// This script changes the parcel stream.
// It needs to be deeded to th land group.
//
// This listens on a channel for the command to change the parcel stream.
// You need to #define LISTEN_CHANNEL

integer listen_handle;

default {
    listen(integer channel, string name, key id, string message)
    {
        if(llStringLength(message) > 0) {
            llSetParcelMusicURL(message);
            llSay(0, "Changing stream to " + message);
        }
    }

    state_entry()
    {
        llSay(0, "Starting radio slave.");
        llListenRemove(listen_handle);
        listen_handle = llListen(RADIO_SLAVE_CHANNEL, "", NULL_KEY, "");
    }
}
