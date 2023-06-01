# Navigation/Pathfinding Notes

Pathfinding almost certainly cannot be done using Godot's navigation tools because of how stairs etc. work.

Probably the right approach is to re-use the player controller mechanism, and simply drive the character in a particular direction based on where they need to move to. Let the in-game physics move them like it moves the player.

But this presents an interesting problem: how do we make sure an NPC can find their destination?

## Design

Scene root node should be a NavSpace

Sub-regions should be NavSpaces nested underneath the root

InternalNavLinks connect leaf regions (checked at edit time by the plugin)

The scene can also have ExternalNavLinks which can be used to connect scenes together

- Select items, click "create navlink" -> adds new nav link, just an object
- NavLink gizmo draws lines between objects

## A Pathfinding Option

We can model the game world as a map defined as a graph of connecte spaces. Each "space" should be a conceptually distinct place, like a floor of a building, maybe a *room* or a single flight of stairs of the landing in a stairwell or whatever.

Knowing "where to go" means knowing the destination and a path to it through the graph. The graph can be partially known, meaning the NPCs can do navigation with partial knowledge.

Within a single space, navigation is "aimed" at the destination in that space: either the person or object needed, or the portals that connect it to the next space that needs to be reached. In-space navigation happens by utilizing a force field map: the destination applies a positive attractive force and the obstances provide negative repulsive force. This defines a "down hill" vector that the NPC moves into.

But what if the NPC gets "stuck"? We can define stuckness as trying a route and not being able to get close to the destination.

One possibility is that the NPC can enter a backtracking mode, where it walks backwards along the path it came, putting a kind of "repulsive obstacle" in the way as they retrace back. But we have to be careful because merely being repelled by the path doesn't push it toward a better path.

What we might instead try to do is backtrack and look for "decision points", places where the force field has different maxima, and then we ignore the one we chose before.

## Another Pathfinding Option

Perhaps we can use the previous option but augment it: instead of using force field navigation in a space, we can use nav meshes inside a space but not between spaces.