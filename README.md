# MinecraftServer-WaterBottle-Spec
**Describe the server content and rules.**

The server codenamed, Water Bottle. Also called "Good old days".

When you're fishing in Minecraft, sometimes you'll get a bottle of water instead of fishes. That was the source of this name.

**Goal:**
- Create a gamer-centric experience with near vanilla game content.
- No economy plugin, no system-shop, barter-based.
- Everything you can get in the vanilla game is all available. No TNT or lava are blocked.
- No teleport or warp point, but free fast-travel between station via riding an end dragon. And create station is free.

**Implemented by(Plugin list):**
- AuthMe[1]
- BossShop[6]
- Clearlag[3]
- CustomRepairCost[7]
- DragonTravel[4]
- Horizon[8]
- Orebfuscator[9]
- PermissionsEx[5]
- SkinRestorer[2]

**Server hardware:**
- Solution: HP DL160 G6
- CPU: Intel Xeon L5630 2.13GHz * 2
- Ram: 48GB DDR3 1333 MHz 4GB * 12
- Hard drive: Seagate 1TB ST1000DM010-2EP102
- Network: China Unicom 300Mbps Home network with ZeroTier One enabled
- Router: NETGEAR genie R2000

**Comments:**

[1] Offline server, the plugin used to auth gamer identity.

[6] Sell and buy shop.

[3] Profile performance if needed.

[7] Remove too expensive hint while using anvil.

[4] Replace railway travel program, reduce many labor costs and material costs. Perhaps space, too. You're still able to build your own railway if you want.

[8] [9] Anti cheats.

[5] Manage plugin and server admin permissions.

[2] Offline server won't display skin from MOJANG by default even if gamer own valid license. The plugin used to display gamer's skin.
