# Swap player location when world name between two saves must be swapped
# In Minecraft 1.21.1, sand duper only work when sand from "world" to "world_the_end" with exact name
# Thus a redstone world added by mv plugin named "lemon" and "lemon_the_end" can't allow sand duper to work
# Files in "world" and "lemon" must be swapped to fix sand duper doesn't work in redstone world, and let "world" become redstone world
# In this case, player location will be a mess, they will stand in unknown location after world change
# This program swap player location and their bed location to sync world change

import os
import nbtlib

cwd = os.path.abspath(".")

dimensionList = []
# world(Dimension): [Int(0), String('minecraft:lemon'), String('minecraft:overworld'), String('minecraft:dig'), String('minecraft:lemon_the_end'), Int(-1)]
# bed(SpawnDimension): [String('minecraft:lemon'), String('minecraft:overworld')]

for (dirpath, dirnames, filenames) in os.walk(cwd):
    for filename in filenames:
        if filename.endswith('.dat'):
            nbtFilePath = os.path.join(dirpath, filename)
            nbtFile = nbtlib.load(nbtFilePath)

            # world
            if 'Dimension' in nbtFile:
                dimension = nbtFile['Dimension']
                # world to lemon
                if dimension == nbtlib.Int(0):
                    nbtFile['Dimension'] = nbtlib.String('minecraft:lemon')
                # lemon to world
                elif dimension == nbtlib.String('minecraft:lemon'):
                    nbtFile['Dimension'] = nbtlib.String('minecraft:overworld')
                # world to lemon
                elif dimension == nbtlib.String('minecraft:overworld'):
                    nbtFile['Dimension'] = nbtlib.String('minecraft:lemon')
                # lemon_the_end to world_the_end
                elif dimension == nbtlib.String('minecraft:lemon_the_end'):
                    nbtFile['Dimension'] = nbtlib.String('minecraft:the_end')
                # nether to lemon_nether
                elif dimension == nbtlib.Int(-1):
                    nbtFile['Dimension'] = nbtlib.String('minecraft:lemon_nether')

            # bed
            if 'SpawnDimension' in nbtFile:
                dimension = nbtFile['SpawnDimension']
                if dimension == nbtlib.String('minecraft:lemon'):
                    nbtFile['SpawnDimension'] = nbtlib.String('minecraft:overworld')
                elif dimension == nbtlib.String('minecraft:overworld'):
                    nbtFile['SpawnDimension'] = nbtlib.String('minecraft:lemon')
                else:
                    print(dimension)

            nbtFile.save()

# uniqueDimensions = list(set(dimensionList))
# print(uniqueDimensions)