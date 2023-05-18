Character behaviors and responses should be appropriate for the context. A counterexample is: putting a basket on a shopkeeper's head in Skyrim blocks their vision and lets you rob them but they don't notice you doing this and don't take it off.

This can be addressed possibly like so:

- Characters use expectations about people, places, and actions
  - Expectations about who is typically in a place -- on a public sidewalk, in a shop, in a corporate office, in a police station
  - Expectations about typical actions in a place -- walking, talking, shopping, sneaking
  - Expectations about the states of self and others' bodies -- how they feel, look, sense, etc.

We can achieve some of this by reasoning. For example:

1. A person is wielding a gun. - holding(PERSON, GUN), gun(GUN)
2. The person is a cop. -- cop(PERSON)
3. Cops are trusted. -- forall X. cop(X) => trusted(X), trusted(PERSON)
5. Cops typically wield guns. -- forall X. cop(X) => exists Y. gun(Y) & typical(holding(X, Y)), typical(holding(PERSON, GUN))
4. THEREFORE, the cop is not feared. -- forall S. typical(S) => not-feared(S), not-feared(holding(PERSON, GUN)) <<< this should be decomposed into causal attribution
5. Cops typically wield guns in order to catch criminals. -- typical(forall X Y. holding(X, Y) & cop(X) & gun(Y) => exists Z. criminal(Z) & search-for(X,Z))
6. A criminal is probably nearby. -- exists Z. criminal(Z) & search-for(PERSON, Z)
7. Criminals are dangerous. -- forall X. criminal(X) => dangerous(X), dangerous(Z)
8. THEREFORE, the criminal is feared. -- forall X. dangerous(X) => feared(X), feared(Z)
9. The location of the criminal is not known. -- ???
10. The criminal should be avoided/fled-from. -- forall X. feared(X) => should(avoid(X)), forall X. should(avoid(X)) & ???
11. THEREFORE, the criminal should be watched-out-for. should(watch-out-for(Z))

or

1. A person is wielding a gun.
2. The person is not a cop.
3. Random people are not trust.
4. Random people typically do not wield guns.
5. Random people typically wield guns to hurt people.
6. THEREFORE, the person dangerous and is feared.
7. The location of the person is know.
8. The person should be avoided/fled-from.
9. THEREFORE, flee from the person.

IDEA: make the goal system part of the normal reasoning. possibly by having inferences about necessity etc. for example, if there is an inference rule that looks like this:

    A  B  C
    -------
       D

then the inference is an inverse inference goal(D) => goal(A) & goal(B) & goal(C). or perhaps something more complex, describing the relationships more explicitly with variables, eg

  forall G. goal(G) & propositional_content(G,D)
    => exists G0, G1, G2. subgoal(G, G0) & subgoal(G, G1) & subgoal(G, G2) &
          goal(G0) & propositional_content(G0, A) & ...etc.

all of this would be wrapped in the choice stuff mentioned below, so like

  forall G. goal(G) & propositional_content(G, D)
    => CAN_CHOOSE[exists G0, G1, G2. ...]

OPEN QUESTION: how can reasoning about possible actions and choices turn into particular choices?
POSSIBLE ANSWER: by making only the options explicit, and letting the choice be extra-logical

OPEN QUESTION: how can the inference systm cope with changing truths?
POSSIBLE ANSWER: have some kind of linear or temporal reasoning

OPEN QUESTION: how can the knowledge representation avoid re-calculating all the truths when the world changes?

IDEA: lazy enrichment of NPC lives? there are some things that pretty much everyone does in the world that is visible externally to us
for instnace going from place to place, eating food, talking to others, reading their phone, etc etc. That is relatively simple and easy
to implement for all NPCs. but the details of who they are, what they're doing, why, where they're going, what they're reading or talking
about, etc. is harder to do all at once, from the outset of the game. perhaps instead, this kind of information can be generated on the
fly, lazily enriching the NPCs as needed, in response to the user. for instance, an NPC that is just walking around need not have a given
destination. but if the NPC is followed, or seen multiple times, it could be useful to generate a destination, fleshing out a little bit
of their life because the player might *see* that extra bit of their life.

## Navigation/Pathfinding Notes

Pathfinding almost certainly cannot be done using Godot's navigation tools because of how stairs etc. work.

Probably the right approach is to re-use the player controller mechanism, and simply drive the character in a particular direction based on where they need to move to. Let the in-game physics move them like it moves the player.

But this presents an interesting problem: how do we make sure an NPC can find their destination?

### A Pathfinding Option

We can model the game world as a map defined as a graph of connecte spaces. Each "space" should be a conceptually distinct place, like a floor of a building, maybe a *room* or a single flight of stairs of the landing in a stairwell or whatever.

Knowing "where to go" means knowing the destination and a path to it through the graph. The graph can be partially known, meaning the NPCs can do navigation with partial knowledge.

Within a single space, navigation is "aimed" at the destination in that space: either the person or object needed, or the portals that connect it to the next space that needs to be reached. In-space navigation happens by utilizing a force field map: the destination applies a positive attractive force and the obstances provide negative repulsive force. This defines a "down hill" vector that the NPC moves into.

But what if the NPC gets "stuck"? We can define stuckness as trying a route and not being able to get close to the destination.

One possibility is that the NPC can enter a backtracking mode, where it walks backwards along the path it came, putting a kind of "repulsive obstacle" in the way as they retrace back. But we have to be careful because merely being repelled by the path doesn't push it toward a better path.

What we might instead try to do is backtrack and look for "decision points", places where the force field has different maxima, and then we ignore the one we chose before.

### Another Pathfinding Option

Perhaps we can use the previous option but augment it: instead of using force field navigation in a space, we can use nav meshes inside a space but not between spaces.