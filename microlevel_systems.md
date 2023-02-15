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

## Hacking

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

## Stealing information or objects

## Planting information or objects

## 3d printing (wet, dry)

## Diversions (e.g. Burn's flare gun)
