# Time of Purr Radio

These are the scripts for the radio in Time of Purr Cafe.

*   `radio-controller.lsl` is in the radio.
    The user interacts with this.
*   `radio-slave.lsl` is in a prim deeded to the group in an obscure location.
    The prim needs to be deeded for `llSetParcelMusicURL` to work.
    Details are in
    [the documentation](http://wiki.secondlife.com/wiki/LlSetParcelMusicURL).
    It's a pain in the butt when the actual radio is deeded to the group.
*   `Radio Control config` is a sample configuration file. This is not the one used at Time of Purr Cafe.
*   `reset-parcel-music.ls` waits for the parcel to be empty, then sends
    a reset message for the radio.

The script `radio-controller.lsl` was taken from
[Shoutcast - radio controller v0.3](http://wiki.secondlife.com/wiki/Shoutcast_-_radio_controller_v0.3_(remake_of_similar_scripts))
and altered.

The scripts use the Firestorm LSL pre-processor.
The actual scripts in-world look like the following,
where `XXXX` is the communication channel name.

If the optional `RADIO_SLAVE_CHANNEL` is defined,
the radio will attempt to set the parcel music stream by
broadcasting to a listening `radio-slave.lsl` script.

If the optional `RADIO_RESET_CHANNEL` is defined,
the radio will listen for a reset message on this channel.

If the optional `RADIO_SYNC_CHANNEL` is defined,
this radio will attempt to keep its genre and station
synchronized with other radios in the region
that are listening on this channel.

If the optional `QUIET` is defined,
the radio will minimize what it says in local chat.

```c
#define RADIO_RESET_CHANNEL -1234
#define RADIO_SLAVE_CHANNEL -5678
#include "radio/radio-slave.lsl"
```

```c
#define QUIET
#define RADIO_RESET_CHANNEL -1234
#define RADIO_SLAVE_CHANNEL -5678
#define RADIO_SYNC_CHANNEL -9012
#include "radio/radio-controller.lsl"
```
