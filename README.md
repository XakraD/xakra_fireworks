# xakra_fireworks
## Requirements
vorp_core
vorp_inventory

## Description
This script allows you to use, depending on the item, different fireworks (with sound) and a bonfire of smoke to send signals. In the 'config.lua' document you can modify the times of the fireworks. 

- Attention: Other players can't see the particles or hear the sounds.

Items used by this script:
- big_fireworks: Use powerful sounds, larger particles and longer duration.
- small_fireworks: Same as big_fireworks with different particles and smaller size, softer sound and shorter duration.
- smoke_campfire: A large campfire that emits a lot of white smoke, which allows you to see very far away, to be able to send a warning among other uses.
- firecracker: Launches a small firecracker that emits blue fire and emits sound for a while.

## Instructions to incorporate script
- Copy the script into a folder (to choose) from the 'resources' folder.
- Add 'ensure xakra_fireworks' in the 'Resources.cfg' document
- Run the 'items.sql' file or add the items manually: 'big_fireworks', 'small_fireworks', 'smoke_campfire' and 'firecracker'
- You will need to add an images called 'item_name.png' (with png format) in the 'vorp_inventory/html/items' folder. You can use the ones in the 'icons' folder.

Video:
https://youtu.be/zjXSPi207FM
