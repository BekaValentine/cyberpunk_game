# Tasks

- Pre-production
  - [x] Visual references
    - [x]  Building Exteriors
      - [x] Grungy normal buildings
      - [x] Fancy centerpiece buildings
    - [x] Building Interiors
      - [x] Grungy normal buildings
      - [x] Fancy centerpiece buildings
    - [x] City layouts
    - [x] Public sculptures
  - [x] Setting
    - [x] Historical outline
    - [x] Rough maps
  - [x] Activities outlines
    - [x] Microlevel (see [microlevel_systems.md](microlevel_systems.md))
      - [x] Hacking
      - [x] Covert entry
      - [x] Social engineering
      - [x] Stealing information or objects
      - [x] Planting information or objects
      - [x] 3d printing (wet, dry)
      - [x] Diversions (e.g. Burn's flare gun)
    - [x] Macrolevel
      - Object retrieval
        - Information (eg secrets, dirt, manuals, etc)
          - Includes recording audio, video, etc.
        - Data containing devices
        - Chips
        - Tools that can be leveraged later
      - Object insertion
        - Information (eg incriminating evidence, viruses, etc.)
        - Access tools/bugs
  - [x] Story elements
    - [x] Themes / Major subjects
      - impact of augmentations
      - 3d printing
      - ai, data mining, self driving cars
      - copyright, drm
      - algorithmic discrimination
      - police robots
      - monopolism
      - predatory lending
    - [x] Rough major plot path
    - [x] Side quests rough outline
    - [x] Major corporations and their info
      - [x] Kinds/Sectors and Numbers
      - [x] Subsectors/subfields
      - [x] Related real-world corporations
      - [x] Names
      - [x] Details/Product Types
  - [ ] Main plot outline / story beats
  - [ ] Characters
    - [ ] PC and family/friends
    - [ ] Hackerspace folx
    - [ ] Work folx
    - [ ] Major corporate figures
      - CEO for each company
      - CFO for each company
      - CTO for each company
      - CISO for each company
      - Main researchers/developers
- Production
  - [ ] Main Menu v0
    - [ ] Prototypes
      - [x] Interactions
      - [X] Locks and Doors

  - [ ] UI
    - [ ] Menus
    - [ ] Backpack - non-diagetic UI
    - [ ] Phone - non-diagetic UI
      - [ ] Notes
      - [ ] Maps
      - [ ] Messages
      - [ ] Hacking app???
  - [x] ABANDONED - Navigation and Scene Generation Plugin - see [Nav and Scene Ideas](nav_and_scene_ideas.md)
  - [x] Prototypes
    - [x] First Person Interactions - NOTE: interactions should preferably involve physics so that its not just the player that can trigger them but objects and NPCs too
      - [x] Pick up object -- via MANIPULATE
        - [x] Drop object
        - [x] Throw object
      - [x] Push object
      - [x] Generic Use
        - Use optional equipped object on world item -- just generic use, passing in the held object to the used object as an argument
        - Pull object? -- only as an instane of USE
      - [x] Take object and stash in backpack
      - [x] Equip object from backpack
      - [x] Walk
      - [x] Run
      - [x] Crouch
      - [x] Stairs
    - [x] Basic Locks and Doors Prototype
      - [x] Class for interactable or holdable or stashable objects
      - [x] One lock type
      - [x] Two key types
      - [x] A basic door demo
      - [x] A basic window demo
      - [x] Basic Locks and Doors Test
      - [x] Tool Acquisition/Pickup?
      - [x] Lock/Door Opening Techniques
      - [x] Lock Destruction Techniques
      - [x] RFID use
    - [x] Object Focusing and Inspection
      - [x] Core inspection system
      - [x] Flat Focus Object
      - [x] Book Focus Object
    - [x] Advanced Locks and Doors Prototype
      - [x] Key Copying Techniques
        - [x] Interactions in focus mode - already doable w/ sim objects
        - [x] Manual copying
          - Requires key or photo and measurement tool
      - [x] Door Destruction
        - Should not involve destroying the door itself but rather changing its mesh and colliders and interaction possibilities
      - [x] Door Hinge Techniques
        - Special tool? Maybe also requires doors to know about hinges?
      - [x] Electronic Code lock use
        - [x] Interactions in focus mode - already doable w/ sim objects
      - [x] RFID + Electronic Code lock bypass
        - Bypass of controllers is just opening, inspecting, and triggering latch relays, which means its already doable w/ sim objects
      - [x] Sensors
        - Object of appropriate type (object with atypical temperature) enters view region should trigger opening
    - [x] Signal transmission and detection
    - [x] Ladder Prototype
      - [x] Make it possible to jump to attach to a ladder
  - [ ] Actual Models
  - [ ] Character generator
    - Ethnicity
    - Name
  - [ ] Vertical Slice to build and test:
    - [ ] 3D modeling and scene building - see modelling_tasks.md
    - [ ] Behaviors / Actions / Interactions
    - [ ] UI
    - [ ] AI
  - [ ] Play test
  - [ ] for each mission:
    - [ ] Mission / Story
    - [ ] Dialog

## MAJOR TODO

This kind of game should provide choice and consequence, main quests and side quests, within the context of IMPLICIT QUESTIONS about the players VALUES. A choice should REFLECT VALUES. So what are the questions/values?

  - What's more important, Doing The Right Thing, or Following The Rules?
  - How important is it to get Permission To Act?
  - Do the Needs Of The Many outway the Needs Of The Few/One?
  - What's more important, Principles or Wealth?
  - What's more important, People or Corporations/Property?
  - What's more important, Doing The Right Thing even if it cost you, or Ignoring Bad Things but keeping yourself safe?
  - When confronted with injustice (either a personal injustice or an unjust system), do you Try To Make The World Better or do you Keep Your Head Down And Survive?

These questions should frame the overall plot and motivate sub-plots. We should achieve that by forcing the player to make a choice, implicitly, about these questions. That means we need to...

  1. Expose the player to the event/situation that implicitly raises a question
  2. Make it explicit that there is a way for the player to interact with the situation
  3. Allow the player the space to choose to interact or not
  4. Show the consequences of each choice

Babylon 5 had a series of questions too, which represented the things that each culture valued most, and which drove their greater outlook and interactions with the universe:

  - Who are you? (Vorlons)
  - What do you want? (Shadows)
  - Why are you here? (Emperor Turhan)
  - Where are you going? (Techno Mage)
  - Do you have anything worth living for? (Lorien)
  - Who do you serve, and who do you trust? (Human)

Make the game more DX-illuminati focused
  NO! More conspiratorial, sure, but the illuminati and other canonical conspiracy theories should be treated like quaint fantasies and excuses for people who want easy solutions to their problems, and people who want a cover for their actually bad behavior (ala Echelon)

  HOWEVER!!! There should still be a driving focus around a big soft-conspiracy of capitalists. The main thrust, perhaps the Big Story, should be about universal constructors and their radical liberatory possibility, and the attempts by capitalists to prevent them from becoming widely available.

Tie DRM and remote shutoffs into the augmentation stuff
  - Backstory here should be cops locking down phones, computers, and augments at protests
  - Optional but beneficial side quests about Copyright Wars and Broadcast Flag style pseudo-secret meetings that you can drop in on

Tie in real world politics into the NSF backstory
  - farmers, amon bundy, etc
  - primitivism/anti-civ, kaczynski, and tracer tong
  - somehow bring in ruby ridge and waco maybe?
  - black panthers and guns?
  - "Who it does it for and who it does it to"

Figure out a way to make sure that you can never fail and have to restart, only go forward -- no character death, no Mission Failed, etc. only forward

Desert arcology? maybe NEOM?

SF Mission involving Hunters Point radiation, maybe? Could be rich techniques living in new construciton in Hunters Point getting sick from radiation? Alternatively, could use Hunter's Point for conspiratorial stuff, since its got lots of great buildings.

Moffet Field mission to penetrate secret government-corporate labs relating to conspiracies. Motivated perhaps by mysterious fleets of helicopters flying back and forth between Moffet and somewhere in SF or maybe further north, or maybe out in the Pacific?

Crumbling US infrastructure leading to disasters that get covered up, etc. creating badlands., emergence of walkaway-like communities.

Homelessness crisis worsens, NEET population explodes and is forced into greater poverty, Sanctuary Districts emerge as a policy decision in California and other liberal states

Climate refu housing that has all sorts of DRM-enforced auto-lockouts for rent payment failures, plus lots of onerous debt to get a spot

Emphasize different rebel factions, their respective concerns, etc.

- MAJOR PLOT POINT: There should be some big overarching conspiracy vibe, NOT ILLUMINATI STUFF THO, which culminates in it being discovered that the source of it all is aliens who are secretly manipulating things digitally, and then the finally of the "episode" ends with them making first contact

  - Make the game more DX-illuminati focused?? SORT OF
  - Maybe mirror the initial setup of DXHR: illuminati plot, big international legislation, paranoid boss, BUT: the first big mission is the illuminati mission and you very quickly learn that they're not the ones behind the legislation, they're just taking advantage of it

Spec out how the player gets mission assignments. Obviously in the parts of the game when they're aligned with a faction, they get missions from the folx in the faction, but what about when they're not? How do we navigate that underspecified moment? In DX, the factions come to you, and the context (eg MJ12 base under UNATCO, etc where they're all enemies now) forces you to go along or get killed.

  - HUD? Too contrived, not diagetic enough. Even with in-world excuses like smart contact lenses, it feels far fetched. But maybe, as an option later on.
  - Phone? Requires checking it, unless we emphasize the audio ringer/alert noise aspect. But a find option.
  - Email? Requires checking it, needs audio alerts. Probably would be phone based anyway. Also a fine option.
  - In person? Very diagetic. Nice way to initiate contact, and offers contextually determined opsec potential.
  - Dead drops, etc.? Very diagetic, a good way to have continued contact over time.

Encourage the player to learn from old text files, actual text files from textfiles.com

Educational debt/indenture explosion due to AI/automation requiring shit tonnes of upskilling, with the only real alternative being permanent poverty-level UBI, and the unreal option being permanent unemployment. Walkaway-style communities emerging in counterpoint to this.

### Experience Points / Skills

XP should be DIAGETIC! You do a thing to improve skill in that thing! But the ramp up in skill should be high so that you don't have to grind. Also the opportunities to do it should be either normal world activity (the more you pick locks to get into places the better you are a picking locks), OR special events like a TOOOL meetup (where you can VERY quickly skill up, and compensate for lack of practice in the field).

Previously the task list had this under the character creator:

- Abilities (determined by *time* units not "skill points", stuff you have to *practice* not *buy*)
  - NOTE: alternatively, all of this can be turned into skills that you develop by *doing* stuff in the world
  - Skill Practice
    - Lockpicking? - increases chances of success
  - Physical
    - Physical strength - increases weights that can be lifted or pushed
    - Physical stamina - increases the time that exertion can happen for before getting worn out
    - Hand/Arm dexterity - frequency of fumbles, affects hand-arm based actions' speed to completion by making them taking longer (eg lock stuff, typng, etc.)
    - Foot/Leg dexterity - frequency of fumbles, affects foot-leg based actions' speed to completion by making them more likely to fail when done too quickly
    - Quiet movement - reduces amount of noise produced when movement
    - Quiet breathing - reduces amount of noise produced by presence in a space, and in response to exertion levels
    - Tactile sensitivity - how sensitive the players hands are to vibrations, etc., decreases rate of errors on hand tasks
    - Hand-to-hand combat skills
    - Hand-eye coordination - how precise the players motions are involving interactions based on visible location (ie the reticle), reducing error rates and especially true for weapons/etc.
    - Hand stillness - how steady the players hands are, how much they wander visually

### BRANCHING PATHS

It ought to be able to play this game in a highly branching-path manner. Main branches should be:

1. Stay corporate (SEE CORP NOTE BELOW)
2. Work for a non-violent underground (compatible with (1) until you get caught)
3. Work for a violent underground (compatible with (1) and (2) until you get caught)

And major transitions happen because of your choices:

If you're sloppy and get caught violating corporate security outside of the parameters of your job, you'll get fired, which will lead to a few groups reaching out to you, possibly.

If you're sloppy and injure or kill people in a way that is traceable to you, you'll get fired from your job/kicked out of the non-violent underground, and possibly turned over to the cops, depending on how risky you are to them (corpos for sure will turn you in). This will lead to violence-tolerant groups reaching out.

These choices should also materially impact things like how much police/fed activity there is, how much heat is on groups, etc.

ALSO, the possibility to do all of this should depend on choices you make, too. The ability to be violent with fists is always present but not enormously useful or impactful in terms of consequences. The ability to be violent with knives is always present and can be more impactful. The ability to be violent with guns, or dangerously violent with martial arts, requires skill, that you either come into the game with or have to develop during the game.

These choices put you in different positions wrt ability to access certain information, certain places, etc. because different groups do different things. Also multiple allegiances means you have less time to do things, so you have to choose between missions. Also, sometimes different groups have conflicting goals so your choices are difficult. Both time constraints and goal conflicts can affect who's willing to work with you, especially if they find out about your activity.

ALSO: There should also be very real consequences for these moves, not just in the sense mentioned above, of having to MAKE the move from corporate to non-corporate or whatever, but also in the sense that being corporate lets you achieve certain things much more easily, or gives you a chance to meet certain people, or whatever, that being non-corporate doesn't. Same for the others. The consequences should be material not just the "corp" vs "not" label.

AND when the ending comes around and the aliens make first contact, who you're with affects which rebel faction you end up with, or if you're with a collaborator faction, or what.

Paths vary: corporate path has lots more pentesting missions, while underground paths have more dirt digging, etc. Corp paths have upsides and downsides -- upsides are more easy access to lots of corporate facilities, downsides are more morally questionable things you have to accept and let slide (b/c revealing them gets you fired).

Different paths all must be able to intersect w/ main story beats -- how depends on the beat, and there are different options, routes, easinesses, etc.

Observation: Movement between paths is not entirely up to the player unless that's desired. In some sense, there are certain changes which can be made at the player's choosing -- for instance, killing Anna Navarre in DX -- but other changes are in the hands of others -- for instahce, UNATCO JC an enemy after he sends the signal to Silhouette. If it's necessary to force th player down a path, that can be used: constrain the context of the player character.

Fraudulent or buggy high tech shit that fuck people over (predictive policing AI like mentioned before, but also things like shot spotter and other analogous things like facial recognition etc)

CORP NOTE: If you stay corporate, then you don't just remain as a pentester/etc. Your loyalty and skill lets the company trust you more so you're increasingly brought into higher value jobs that involve providing discrete "solutions" for high paying clients involving recovery of their secrets, stealing things for them, etc. Classic cyberpunk corporate espionage type stuff.

### First Mission Notes

The first mission should start very close to some real gameplay. It should be some pentesting engagement and it should lead to some troubling conclusions if played curiously. Probably it should be a special mission on behalf of a corporation that's looking to get information on some anti-corporate rebels or something like that, and in the process of doing the infiltration you have the opportunity to maybe interact with rebels or overhear them, or look at their computer systems. You should also be able to be caught by the rebels, which gives you an opportunity to escape their clutches. Getting caught leads to the mission partially failing if you can't escape and they end up releasing you, but being captured does give you a chance to build rapport.

What you learn in the first mission should make it possible, tho not necessary, to investigate the company more in the next mission to see if there's truth to the information. The truth should be vindicating of the rebels.

Possibly the next mission is a more standard pentesting, perhaps of the company itself as part of a longer term business relationship with them, thus giving you lots of opportunity. You should also be able to contact the rebels with information that you find, and there should be interactions etc based on the previous encounter with them. Perhaps they trust you more or trust you less, depending on if they captured you, if you talked to them, etc.

## Task Rambles

- wet printing medicines to heal yourself
- dry printing machines, devices you need in a mission
- stealing information to do other things
- planting information to cause things to happen
- stealing objects to do other things
- planting objects to cause things to happen
- lie cheat and steal your way into buildings
- key copying from pictures
- rex sensor foiling
- loiding
- rfid sniffing in various forms
- key impressioning
- manual key decoding
- hijacking self driving cars, drones, police robots, etc.
- algorithmic management, reverse centaurs
- chickenization
- felony contempt of business model


distractions work for various reasons -- sounds draw attention sure, but flare guns surprise and frighten

the final big mission of the main story should be a re-tred of the first pen testing mission

toy robots being used for surveillance of kids

PC is offered help in getting justice for their loved one after their death by a hacker. the catch is that, on an upcoming pen test at a subsidiary of the megacorp that caused the loved one's death, PC has to plant a bug in their system. this lets the hacker gain access and find a bunch of incriminating dirt

eventually PC is on a job and stumbles across something she shouldn't, and learns some horrible secret that she's asked to help keep secret. she can choose to go along with it, in which case she decides to become an undercover agent for the underground, or she can say no, in which case she'll be fired and punished and forced into the arms of the underground

maps (like google maps) should be available but should be realistic -- you get publicly available information, and MAYBE you add some info like destination markers based on your particular quest but you have to actually use the app

doors should always be openable SOMEHOW and there should always be a variety of options but the logical space of options is basically always there and that provides places where the actual options might be limited. for instance, every door in principle can be opened with a stolen key but whether THIS door can and how easy it is to find and steal a key depends on many things. this is what the player has to figure out. the play has to discover what their options are with every door, every lock, every computer, etc.

one interesting kind of problem for the player to solve might be something like a mission to disable surveillance tech, or alternatively/from a different role based on player choices, to do some secret mission during the time the surveillance is disabled

something about peter thiel's weird breeding cult for improving the future of humanity

something making fun of the rich white men who get lost in the idea that their robot arms make them oppressed

### Example tasks, backward chaining from the goal

Goal: Gain access to Mega Corp's R&D facility -- FINAL PART OF MACRO-MISSION

HOW???

One answer: Get keycard access from an employee. -- A SUBMISSION

HOW???

One answer: 1, Figure out who some employees are, and 2, follow them to an after-work bar to scan their keycard A SUB-SUB-MISSION

HOW TO 1???? One answer: public website listing employees

HOW TO 2??? One answer: watch them after work, another answer: hack their credit card  statements, another answer: hack their phone GPS or Tile/airtag to track their motions, another answer: hack their comms to see if they mention places

### Another example of the same

Goal: Gain access to Mega Corp's R&D facility -- FINAL PART OF MACRO-MISSION

WHY???

One answer: they have secret information we needs

HOW DO WE KNOW THAT???

One answer: we found it by analyzing software on a spy device -- SUB-MISSION

HOW DID WE FIND THE DEVICE???

One answer: we investigated a tragedy that it caused -- SUB-SUB-MISSION

HOW DID WE LEARN ABOUT THE TRAGEDY?

One answer: we spoke to somehow in the hackerspace -- ENCOUNTER