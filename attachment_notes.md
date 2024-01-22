# Attachment Notes

Attaching one object to another can probably be done like so:

An object, treated as a tool, is used on another object. If the tool is attachable, and the other object, the patient, is attachable, and they are compatible, the tool will interact with the patient object to establish an attachment. The tool should then be no longer held.

## Needed

- Tools return information about whether to continue holding them
- Tool use includes information about the point on the patient object that is being looked at
- Tool has a designated point on it that denotes attachment (and maybe a vector pointing toward the patient object?)