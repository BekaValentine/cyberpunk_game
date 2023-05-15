# Microlevel Systems

Micro-level systems should be designed as things + interfaces/properties, rather than pair-wise interaction possibilities.

So instead of like, `LOCK_X` can interact with `PICK_Y`, it should be more like `LOCK_X` exposes `INTERFACE_I`, and also `PICK_Y` manipulates `INTERFACE_I`.

These exposed interfaces should potentially have properties.

An interaction should be able to specify how it affects the interacting objects and the world. Probably these should look something like a normal inference rule for actions, or a STRIPS rule or something, but with special reference to the interactors. Perhaps something like:

```s
  interaction:
    kind: use_tool.
    precondition:
      $TOOL.is_a = lock_pick,
      $OBJECT.is_a = lock,
      $TOOL.interface = $OBJECT.interface.
    result:
      $OBJECT.lock_state = open.
```

```s
(interaction
  use_tool
  (precondition
    (= (is_a $TOOL) lock_pick)
    (= (is_a $OBJECT) lock)
    (= (interface $TOOL) (interface $OBJECT)))
  (result
    (set (lock_state $OBJECT) open)))
```

```python
Lock.apply_tool(
  precondition: [
    V_TOOL.is_a('lock_pick'),
    V_SELF.is_a('lock'),
    V_TOOL.field('interface').equals(V_SELF.field('interface'))
  ],
  result: [
    V_SELF.field('lock_state').becomes('open')
  ]
)

class Lock(GameObject):
  def apply_tool(self, tool):
    match tool:
      case LockPick:
        self.apply_lock_pick(tool)
      ...
  def apply_lock_pick(self, pick):
    if self.lock_type == pick.lock_type:
      self.lock_state = "open"
```

## Kinds of Interactions

- use: an agent uses a tool on an object
- throw, release, grab, push, pull, equip, store: an agent acts on an object
- detect: an agent detects some light or sound ("sees" and "hears", in animate form)
- emit: an object or agent emits some light or sound (??? and "says", in the personified form)
- experience_force: one object experiences force from another

Acts are tried, and either succeed or fail. Occurrences simply occur. Occurrences like "create"
or "absorb" or "destroy" are compound: something creates something else when a rule affecting the one causes
the other to spawn, and something absorbs or destroys something else when a rule affecting both causes one
to die.

The precise mechanism should be event driven in the OO sense. Here, an interaction has a target, and then an
event that has affected it. For example, consider a bullet colliding with an exploding barrel, to produce an
explosion and the destruction of the bullet. This would be two events, one is a touch event that targets the
barrel, with the bullet as the toucher, and the second targets the bullet with the toucher being the barrel.
A Python analogy might be

```python
class Bullet(Entity):
  def touch(toucher):
    match toucher:
      case ExplosiveBarrel:
        self.die()

class ExplosiveBarrel(Entity):
  def touch(toucher):
    match toucher:
      case Bullet:
        Explosion.spawn_at(self.location)
        self.die()
```

## Similarities in Hacking, Covert Entry, and Social Engineering

- Trust relates to Privileges relates to Capabilities
- Lack of trust is not necessarily obvious, suspicion is not necessarily obvious
- Patterns of behavior/action affect trust/suspicion

The general process of gaining access in both cases is often quite similar:

1. Gather information given your current access. This can be information about people, places, things. Information that's relevant includes things like how to communicate with the thing, how it works internally so as to find vulnerabilities, secret information, non-secret information that allows cover stories to work better, etc.
2. Using information to establish trust/privileges/capabilities. EG getting a person to trust you, or want to help you, or need you to help them, or alternatively authenticating with a computer as a certain user, etc., or alternatively using a key to get through a door.
3. Using trust/privileges/capabilities to cause actions that further your goals. For instance, making a request to a person, asking for information, issuing a command to a system, or plugging a device into a computer in a locked room.
4. Goto 1 if necessary

All these domains have different levels of "typical behavior" that can affect suspiciousness/trust:

- Computer systems can monitor for statistically anomalous behavior, or behavior that security software knows is typical of an attack.
- Physical systems can monitor for specific trips, for instance a security camera or motion detector or smart card reader looking for too many failed badge-ins
- Social systems look for all sorts of things. See below for Mitnick's list.

These systems are also not separate! Getting a person to trust you can be used to get access to a computer system. Or, getting access to a computer system can get a physical system to trust you. Or, getting access to a physical system can get a person to trust you. Or any other combination! There's nine total: {Person, Physical, Computer} * {Person, Physical, Computer}

### Ways of modelling security issues

A way to think about these phenomena can be seen from the following example:

A telephone operator at the telephone exchange will treat anyone who calls in on a specific phone line as trusted, because that phone line is connected only to certain phones that are all in secure locations. Those locations are secure because you need keys to the locks in order to get in. Those keys are only distributed to certain people with specific roles and permissions. Therefore, anyone calling the in on the phone line must have certain privileges, and is therefore trusted.

Trust Phone Line ---> Trusted Phones
Trusted Phones ---> Secured Rooms
Secured Rooms ---> Keys to Locks
Keys to Locks ---> Trusted Person

Each of these steps is a false assumption. E.G. "only trusted people have keys to these locks" (ie if X has key to Y then X is trusted).

Therefore, if you want to be a trusted person in the eyes of the phone operator, it suffices to call the trusted phone line, by getting access to the trusted phones, by getting into the trusted rooms, by getting a key to the locks.

The inference stems partially from the reverse capability inferences. For instance: if key K matches lock L then you can use K on L to open L.

It also stems from an assumption of exclusive intention -- not only X can cause Y, but only X can cause Y.

VULNERABILITIES are when "only X can cause Y" is false.

ERRORS and TRAPS are when "X can cause Y" is false.

The vulnerability inference seems to be related to the formal fallacy called Affirming The Consequence:

1. If A, then B.
2. B.
3. Therefore A.


## Hacking

Hacking is basically never done by real hackers sitting at the computer to hack, it's almost always over the network. This is ignoring the aspects of hacking that involve access to devices to sniff data, eg physical keyloggers, etc.

Therefore, we can treat hacking as mostly just an automatable piece of software that the hacker uses -- a standard script. The script might require information from the user, but it's not going to require active hacking.

On the other hand, one thing that definitely will require the player to do something is knowing *where* to hack. Just like knowing where to lock pick is important, knowing what computers have necessary resources is part of the task of hacking. Finding and exploring the network space, instead of the physical space.

This presents a few possibilities for portraying hacking: because its computery, we can obviously choose to do it realistically. Finding out what to hack is portrayed precisely as it its done in the real world. That's obviously going to play some role already, when that information is external to the system. But what about when the information is *internal* to the system? A realistic portrayal here is also of course possible. But alternatively, we can stylize it, make it very aesthetically novel or symbolic, for instance the way Johnny Mnemonic portrays cyberspace.

### DESIGN PROPOSAL

Here's one option for the design of the hacking sub-system: use a very spatial metaphor for the network structure. Accessing another computer system directly is being in a space, and moving from one computer to another over the network is a spatial relocation through visuo-spatial "portals" or "doors" or whatever. They can be stylized to indicate the computer they correspond to.

Communicating with a computer through multiple hops is a series of open portals from your computer through the bridge computers to the final computer you're using, and that's visually present somehow. That should partially involve spatial representations, eg seeing through portals, coloring them by "forward" and "backward", but also by some kind of visual map on the screen maybe.

To get a direct portal, you need to somehow get a backdoor into the system or get the net location of the system, but once you do, you can directly connect without using bridge nodes.

Each computer presents a variety of tools available to it, as spatialized mostly-2d UIs.

Other computers that are connected to a given computer are represented as portals, but possibly as unknown type, so you might have to interact with them to learn what they are. Networks are not first-class objects, they're things connected to router computers.

Authentication/permissions can be represented by symbolic locks and keys, and unless an authentication action has happened, the portals remain locked. Changing permissions are represented by changing lockedness. Loss of access is represented by spatial movement back through the sequence of portals to the last accessible space.

### Virtual Exploration

But, just how *does* hacking work in the real world when you have to explore a system to find out where things are?

A simple case would be one where the thing you want to hack is the thing you're directly connecting to. For instance, a website might have a login form, and you're just directly accessing the site and the form. But another possibility is that the site makes secondary connections to servers via XHR requests. Or alternatively, a program you're using makes network requests to some external computer. In these cases, additional tools, like say a browser's debugging console, or wireshark, let you detect and analyze those hidden interaction points.

But both of those cases involve a program you're using pointing out what other computers its talking to. So in some sense you "already" know the target (you just might only know it implicitly, in virtue of the program knowing it and you controlling the program). What if you don't know where the target is, you just sort of ... know it must logically exist? For instance, a CEO's computer inside the corporate network.

Well, for something like that, you can make plausible predictions about routes to the computer from the outside. For instance, an email to the CEO will likely end up on that computer (tho not always). So one route to that computer might be to phish the CEO, sending an email and hoping the CEO will open the attachment. Once your code is on the computer, it can then call out to your computer and give you access to the CEO's computer.

But that's still pretty direct. What about something like an internal file server? That won't necessarily have anyone opening email on it, so how do you find it? Merely knowing it exists isn't helpful by itself. Instead, you need to get *inside* the network and explore. One route into the network might be the phishing vector. Another might be to connect to the network via wifi or ethernet. If the network isn't secured that might be easy, but if it's secured that requires breaking the security somehow. Either that means wifi hacking, or it means physical penetration to plug in a device into the ethernet and maybe doing network authentication hacking. But once you're in the *network* what do you do?

You have some options for exploring the network you're on:

- nmap: probe every IP address in the networks range to see what ports are open, and then poking the ports to see what kinds of protocol they speak. this is very loud b/c it hits every IP and port, and is likely to trigger security systems!
- service discovery: use standard "who's there" protocols to find out for some specific protocols whether or not anyone on the network can talk it. this is less loud and is less likely to trigger security systems depending on how many protocols you try
- packet sniffing: passively monitoring the network to see what messages people are sending and where they sending them, and therefore what devices speak what protocols. this is very quiet but it requires being in a place on the network that receives the packets. on wifi networks, its the same physical space as the packets. on older ethernet networks, this was every computer on the ethernet wire. on modern ethernet networks, you have to have access to the router.

What if there are multiple sub-networks? Well there's two ways this could look.

1. Sub-networks defined by address range, in which case you can't talk to the secure part of the network without convincing the router to let you be on the more secure network. But, routers are just special purpose computers, and so you can talk to it from the insecure network, and maybe hack into the router, and make it trust you and let you talk on the secure network.
2. Physically separate networks with bridging computers. In this case, you talk to the secure devices through the bridging computer. This itself could take a few different forms:
   1. If the bridging computer acts as a forwarding node, then it might pretend to be the entire secure network, and map each of the secure computers to a port on its IP address on the insecure side. It might then require some kind of authentication to accept incoming messages to the secure side.
   2. Alternatively, the bridging computer might merely be on two networks, the insecure one and the secure one. In this case, connecting to the secure network requires finding a way to talk to the bridging computer so that it'll let you somehow send messages out. For instance, if you can get a low-privilege user's shell on the bridge and then use privilege escalations on the bridge to get a high-privilege user's shell that can talk to the secure side.

### Defense

Defense can involve monitoring system activity, looking for anomalies, determining the route into a particular computer, and tracing it back to other computers either forward or backward in time, deeper into the attack or further out to the outskirts of the computer network.

Also, hacking back is an interesting phenomenon. Various options exist but fundamentally the problem is about trying to find out who's attacking, and where they're attacking from, so that their own systems can be messed with. This can involve things like tracing where exfiltrated data is sent, hacking that system, looking in logs for forwarding, etc.

### Real Life Example

A common real-like technique is to set up a sequence of machines -- computers, phone switches, whatever -- to forward the commands or signals, thereby creating a harder-to-trace access route. Factors that matter are things like connectivity -- can one node talk to another -- as well permissions -- does one node have access rights on the other.

### Johnny Mnemonic Sequences

Johnny Mnemonic uses a SEEMINGLY heavy spatial metaphor. Cyberspace is a *place*. But it's actually just a fancy UI environment that brings up mostly 2D interfaces.

#### Johnny Mnemonic Cyberspace Sequence

1. Log into network
2. Play with tetrahedron???
3. Select map and use it to dial the Beijing Hotel's network
4. Use Beijing Hotel's UI, hack it to get internal access
5. Use the hotel's UI to find the telecom subsystem and move into the fax system
6. Select the fax machine for the room and check its call log to find the recipient of the fax, a copy shop in Newark
7. Move over to the copy shops computers -- the internal network is represented as a 2d map of the shop and its computers
8. Check the copyshop computer's fax buffer, get the name Dr Allcome
9. Try to contact Strike, security won't let the connection through, so hack it
10. Strike has no information about Allcome knows that the data in Johnny's head is Pharmakom

This reasonably involves things like:

- Information lookup/directory services
  - Map for hotel
  - Hotel-internal system map to locate telecom system
- Movement between sub-systems, or access of sub-UIs
  - Hotel directory -> hotel telecom system -> particular fax machine
- Movement between macro systems
  - Switching from hotel UI to copyshop UI
  - Switching from copyshop UI to Strike's board UI

This presupposes lots of stuff is just computers on networks. Plausible these days! Also presupposes that instead of big complicated integrated systems, everything is components on networks, systems and subsystems.

The Johnny Mnemonic UI is especially semantically rich. The Beijin Hotel map is somewhat sensible given Google Maps, but what about the internal UI? It has a metaphorical map of the subsystems with semantically useful information -- room number for each fax machine.

### Hackers Sequences

Hackers presents things in terms of computer UIs, some of them conventional, like the MacOS-based school UI, and some of them less conventional, like the OTV UI.

#### Hackers OTV Hack Sequence

1. Dade SE's his way into getting a number for a computer on the network.
2. Dade dials into the computer, which controls whats on the air
3. Change the video

#### Hackers School Fire Suppressant System Sequence

1. Log into highschool computer
2. Access the Network Control tool
3. Browse networks and find the Fire network and select it -- each network is visualized spatially as a 3d map of the system
4. In the tool, change the settings on the network

### The Net Sequences

The Net also has normal UI-oriented hacking, with unconventional but plausible UIs, also presenting spatial information when necessary.

#### Getting Into Bennett's Computer

1. Locate the computer by SE-ing the target into revealing her location in the building
2. Access the building's internal infrastructure system
3. Access the fire subsystem -- building is visualized as a 3d map + floors
4. Access the appropriate floor of the building -- visualized as a map of the floor
5. Select a fire detector and trigger it
6. Wait for target to evacuate

## Covert entry

- physical
  - locks
    - bumping - LCK-UNS-CSH
    - pick - LCK-SKL
    - rake - LCK-UNS-CSH
    - comb/overlifting - LCK-HNS-CSH
    - shim - LCK-DIS-CSH
    - momentum/impact - LCK-DIS-CSH
    - destruction - LCK-DST-CSH
    - impressioning - LCK-CPY-CSH
    - decoding - LCK-CPY-CSH
    - pick guns/snapping - LCK-UNS-CSH
  - keys
    - steal - KEY-STL-PLN
      - in home or office
      - in lock boxes etc
    - duplication
      - photo - KEY-CPY-REC
      - temporary in hand
        - measure - KEY-CPY-PLN
        - mold - KEY-CPY-PSH
      - bitting codes (direct and indirect) - KEY-CPY-INF
  - doors/gates
    - latch slipping - MNT-DIS-PSH
    - under/through door tools - INT-SKL-CSH
    - pop hinge pins - MNT-REM-CSH
    - kick it in - MNT-DST-CSH
    - remove hinges - MNT-REM-CSH
  - electrical strikes/latches/magnets
  - floor-to-ceiling walls - destroy, climb
  - fences and separator walls - destroy, climb
  - windows
    - open
    - break them - MNT-DST-CSH
    - cut glass - MNT-DST-CSH
- electronic
  - keypads
    - look for wear - LCK-CPY-LOS/REC
    - look for heat - LCK-CPY-LOS/REC
    - open up and bypass by the power to the latch if its controlled on the near side - LCK-DIS-CLN
    - open up and record data with a hidden tool - LCK-CPY-CLN
  - rfid
    - open up and bypass by the power to the latch if its controlled on the near side - LCK-DIS-CLN
    - open up and record data with a hidden tool - LCK-CPY-CLN
    - steal rfid key - KEY-STL-PLN
      - in home or office
      - in lock boxes etc
    - clone rfid key (short and far range, no crypto only) - KEY-CPY-CSH/NER
    - replay attacks
  - alarms - disable
  - cameras - disable
  - motion/heat sensors - disable
  - sound sensors - disable
  - vibration sensors - disable
  - exit sensors - trick them - INT-UNS-NER

## Social engineering

Abstractly, SE is basically about establishing *trust* ie getting someone to trust you, and then using that "access" to get information or whatever. Additionally, it involves manipulating the thresholds required to establish trust.

Some general kinds of SE methods:

- Manipulate existing trust mechanisms
  - Human trust systems with easily-broken security/recognition
    - Interactive
      - Posing as a fellow employee
      - Posing as an employee of a vendor, partner company, or law enforcement
      - Posing as someone in authority
      - Posing as a new employee requesting help
      - Posing as a vendor or systems manufacturer calling to offer a system patch or update
      - Using insider lingo and terminology to gain trust
      - Pretending to be from remote office and asking for email access locally
      - Offering help if a problem occurs, then making the problem occur, thereby manipulating the victim to call them for help
      - Getting a voice mailbox set up so callbacks perceive attacker as internal
      - Modifying fax machine heading to appear to come from internal location
      - Asking for a file to be transferred to an apparently internal location
    - Non-interactive
      - Sending free software or patch for victim to install
      - Sending a virus or Trojan Horse as an email attachment
      - Using a false pop-up window asking user to log in again or sign on with password
      - Leaving a floppy disk or CD around the workplace with malicious software on it
      - Offering a prize for registering at a Web site with username and password
      - Dropping a document or file at company mail room for intraoffice delivery
  - Non-human trust systems (ie a human or computer trusts a device, the device is vulnerable physically)
    - Capturing victim keystrokes with expendable computer system or program
    - Asking receptionist to receive then forward a fax
  
### How to people determine trustworthiness?

Categories of trustedness! E.G. "fellow employee", "police officer", "authorized technician", etc.

How are categories attributed to people? By reasoning off appearances and other known information. For example:

1. X called in on phoneline L
2. Anyone who calls on phoneline L has physical access to phone P
3. Anyone who has physical access to phone P has key K
4. Anyone who has key K has authorization level Z
5. Therefore, X has authorization level Z

Or more compressed (more likely in real world settings):

1. X called in on phoneline L
2. Anyone who calls in on phoneline L has authorization level Z
3. Therefore, X has authorization level Z

### How are thresholds for establishing trust manipulated?

The above kinds of inferences can often involve heuristical parts that are vulnerable. For instance, suppose we have an inference like

1. X is wearing a courier's uniform
2. X is carrying boxes
3. Anyone wearing a courier's uniform is probably a courier
4. Anyone carrying boxes might be a courier
5. Therefore X is probably a courier (for two reasons)
6. Anyone who is a courier has authorization to access premises
7. Therefore X has authorization to access premises

Principles 3 and 4 here are extremely heuristical and can be gamed. The conclusion of each is more likely to be arrived at under certain conditions, and subject to manipulation.

But how do these kinds of heuristics get manipulated? Time pressure is an example of a common one, but really it comes down to a rough estimate of the likelihood that the conclusion is wrong, and the magnitude of consequences of false positive and false negative conclusions. That is to say, different choices (esp. permission-granting) can be assigned quantities of risk to the agent (risk determined by confidence of reasons + knowledge of consequences), and the one with the least risk is chosen.

### Mitnick's List of Warning Signs of an SE Attack

- Refusal to give callback number
- Out-of-ordinary request
- Claim of authority
- Stresses urgency
- Threatens negative consequences of noncompliance
- Shows discomfort when questioned
- Name dropping
- Compliments or flattery
- Flirting

## Stealing information or objects

No special subsystems beyond physical entry etc.

For physical objects, just stashing in your backpack when you physically are able to.

For information, just finding it and recording it on a notebook.

## Planting information or objects

No special subsystems beyond physical entry etc.

For physical objects, just unstashing from your backpack when you physically are able to.

For information, just entering it into an appropriate input device when needed. E.g. into a computer, a keypad, a radio tuner dial, etc.

In either case, the location it needs to be put into has to be an object that is responsive to this action. For instance, plugging something into a computer requires the computer/port is interactable and when the *target* computer is interacted with, it triggers other things to happen. This is how goals and success are defined in code -- specific objects respond in special ways to specific interactions. We merely represent those as "goals" in English to the player.

## 3d printing (wet, dry)

3d printing should just be interactions with objects that have special ways to spawn new objects.

## Diversions (e.g. Burn's flare gun)

A diversion should be just a generic interaction with specific kinds of objects -- NPCs, robots, etc. -- that affect how it pays attention to the world.