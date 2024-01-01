# kinds of techniques

- physical
  - locks
    - bumping - LCK-UNS-CSH-OPN
    - pick - LCK-SKL-OPN
    - rake - LCK-UNS-CSH-OPN
    - comb/overlifting - LCK-HNS-CSH-OPN
    - shim - LCK-DIS-CSH-OPN
    - american bypass tool - LCK-DIS-CSH-OPN
    - magnets
    - spinning magnet
    - 175 bypass
    - "master" pick
    - momentum/impact - LCK-DIS-CSH-REM
    - destruction - LCK-DST-CSH-REM
    - impressioning - LCK-CPY-CSH
    - decoding - LCK-CPY-CSH
    - pick guns/snapping - LCK-UNS-CSH-OPN
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
    - latch slipping - MNT-DIS-PSH-OPN
    - under/through door tools - INT-SKL-CSH-OPN
    - pop hinge pins - MNT-REM-CSH-REM
    - kick it in - MNT-DST-CSH-REM
    - remove hinges - MNT-REM-CSH-REM
  - electrical strikes/latches/magnets
  - walls - destroy
  - fences - destroy, climb
  - windows
    - open
    - break them - MNT-DST-CSH
    - cut glass - MNT-DST-CSH
- electronic
  - keypads
    - look for wear - LCK-CPY-LOS/REC-OPN
    - look for heat - LCK-CPY-LOS/REC-OPN
    - open up and bypass by the power to the latch if its controlled on the near side - LCK-DIS-CLN-OPN
    - open up and record data with a hidden tool - LCK-CPY-CLN
  - rfid
    - open up and bypass by the power to the latch if its controlled on the near side - LCK-DIS-CLN-OPN
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
  - exit sensors - trick them - INT-UNS-NER-OPN

# dimensionalized analysis



# dimensions

- what's being attacked? ie what do you need access to, in order to use "nonstandardly"
  - LCK lock mechanism
  - KEY key broadly construed
  - MNT mounting hardware
  - INT normal use interfaces that are not exposed externally

- what kind of attack is it?
  - DST destruction
  - REM removal
  - DIS disabling - interacting with non-normal interaction parts
  - CPY copying
  - STL stealing
  - non-standard interaction with the normal interaction parts
    - SKL skilled
    - UNS unskilled

- what kind of proximity to the targetted device is required?
  - physical possession
    - PSH short
    - PLN long
  - contact
    - CSH short
    - CLN long
  - NER nearness
  - LOS line of sight
  - REC image, sound
  - INF mere information / knowledge

- what signals are there that the attack was successful?
  - OPN door opens, knobs/handles turn
  - IND indicator lights go green, indicator sound is played
  - REM mechanism is removed, falls away, etc.


# things to keep in mind

- knox boxes / other key boxes
- console / management cables
- utility tunnels / sewers, and maps thereof
- trashing / dumpstering
- wear and tear on push buttons
- special gear to move heavy tunnel lids
- linear relay tripping, momentary switches
- keyed alike systems
- drafts, light beams through dust, reveal holes and hidden access ways
