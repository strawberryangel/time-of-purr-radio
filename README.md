# Time of Purr Radio

These are the scripts for the radio in Time of Purr Cafe.

*   `radio-controller.lsl` is in the radio.
    The user interacts with this.
*   `radio-slave.lsl` is in a prim deeded to the group in an obscure location.
    The prim needs to be deeded for `llSetParcelMusicURL` to work.
    Details are in
    [the documentation](http://wiki.secondlife.com/wiki/LlSetParcelMusicURL).
    It's a pain in the butt when the actual radio is deeded to the group.
*   `Radio Control config` is the configuration file for Time of Purr Cafe.

The script `radio-controller.lsl` was taken from
[Shoutcast - radio controller v0.3](http://wiki.secondlife.com/wiki/Shoutcast_-_radio_controller_v0.3_(remake_of_similar_scripts))
and altered.

The scripts use the Firestorm LSL pre-processor.
The actual scripts in-world look like the following,
where `XXXX` is the communication channel name.

```c
#define RADIO_SLAVE_CHANNEL XXXX
#include "radio/radio-slave.lsl"
```

```c
#define RADIO_SLAVE_CHANNEL XXXX
#include "radio/radio-controller.lsl"
```
