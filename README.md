# MinecraftServer-WaterBottle-Spec
**Describe the server content and rules.**

Water Bottle, the server name.

When you're fishing in Minecraft, sometimes you'll get a bottle of water instead of fishes. That was the source of this name.

**Goal:**
- Create a gamer-centric experience with near vanilla game content.
- No economy plugin, no system-shop, barter-based.
- Everything you can get in the vanilla game is all available. No TNT or lava are blocked.
- No teleport or warp point, but free fast-travel between station via riding an end dragon. And create station is free.

**Implemented by(Plugin list):**
- AuthMe[1]
- ChangeSkin[2]
- Clearlag[3[]
- DragonTravel[4]
- PermissionsEx[5]
- ProtocolLib, required by ChangeSkin.[6]

**Server hardware:**
- Solution: HP DL160 G6
- CPU: Intel Xeon L5630 2.13GHz * 2
- Ram: 48GB DDR3 1333 MHz 4GB * 12
- Hard drive: Seagate 1TB ST1000DM010-2EP102
- Network: China Unicom 300Mbps Home network with ZeroTier One enabled
- Router: NETGEAR genie R2000

**Comments:**

[1] Offline server, the plugin used to auth gamer identity.

[2] Offline server won't display skin from MOJANG by default even if gamer own valid license. The plugin used to display gamer's skin.

[3] Plugin used to optimize performance if needed.

[4] Plugin used to replace railway travel program, reduce many labor costs and material costs. Perhaps space, too. You're still able to build your own railway if you want.

[5] Plugin used to manage plugin and server admin permissions.

[6] A reference plugin required by another plugin.
