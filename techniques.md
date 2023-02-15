# kinds of techniques

- physical
  - locks
    - bumping - LCK-UNS-CSH
    - pick - LCK-SKL
    - rake - LCK-UNS-CSH
    - comb/overlifting - LCK-HNS-CSH
    - shim - LCK-DIS-CSH
    - american bypass tool - LCK-DIS-CSH
    - magnets
    - spinning magnet
    - 175 bypass
    - "master" pick
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
  - walls - destroy
  - fences - destroy, climb
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
