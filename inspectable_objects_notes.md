# Inspectable Objects Notes

Some objects should be inspectable. Ideally this wouldn't require a special screen?

Perhaps the right way to do this is to move into a mode where the inspected object is focused and large, and then interactions with it are just clicks, possibly with a tool in hand.

Idea: Inspecting things normally is by looking at it, which generally will be an upright activity aimed at things away from the player character. Inspecting something in the player character's hand will involve looking very far down, which brings any held tool into focus as the inspectable object.

Inspecting an object moves it into full screen focus. If it can take up the full screen, like a control panel, it does, otherwise it gets much bigger and fills the screen and non-focused items behind it are blurred or something like that.

## Progress Notes

The current version allows a stack of focal objects simultaneously on screen separated by some distance. The first one has a backdrop behind it that makes everything behind it darker. Both of these are done entirely in world space and so the actual interactable objects need to be spaced far enough apart to not overlap each other or the darkener. This ought to mean something like fixing the maximum size of the objects to be a fixed size, that way the spacing can guaranteed to prevent them from overlapping. The stack also moves off to the left and back visually which is kind of nice but may need to change.

Held objects appear in front of all focused objects so that they can be used on the focused objects. Something will need to be done for held objects that are "attached" to other objects, both for focus or outside of focus.

Currently there's no interactions with the objects themselves. A likely option here is to just add a cursor of some sort, maybe a movable version of the reticle. Then the usual primary and secondary clicks are possible as well as the use button, having a consistent feel across the focus view and non-focus view.

Inventory ought to be a hotkey for a particular inspectable object (your backpack). You should never be able to drop your backpack or other storage items, phones, etc. but you CAN drop or discard particular tools, or items in the packs. Equipping a tool should be just picking it up from the pack. The tools should also be inspectable, making them potentially interactable with other tools.

## Plausible Inspectables

- Books, Magazines, News Papers???, Documents
  - inspection means to read the item. interactions are page turns, maybe highlighting or dogear-ing? no tools needed
- Keys
  - inspection means to look at the key from various angles. interactions are to rotate to different angles
  - could yield info about the bitting code, the marks on the keys from impressioning, etc.
  - tools could be measuring tools, filing or cutting tools
- Key Cards???
  - inspection means to look at the keycard from various angles. interactions are to rotate
  - could yield info about the keycard protocol, frequency, manufacturer, model, etc.
  - tools could be reading a writing with an RFID inspector gadget
- Devices?
  - inspection means to look at various angles
  - could yield info about serial number, model, ports, etc.
- Interfaces?
  - inspection means to look at it close up
  - tools could be pressing buttons and removing screws and plugging things in and removing things?

## Deus Ex Examples

Books, Magazines, News Papers, Data Cubes, Pocket Secretaries, etc.