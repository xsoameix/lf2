struct object
  int    frame_id              # 0x7C
  int    cpoint_catcher        # 0x8C
  int    cpoint_timer          # 0x90
  int    weapon_type           # 0x98
  int    weapon                # 0x9C
  int    holder                # 0xA0
  byte   ?                     # 0xEB
  byte   vrest_of_objects[400] # 0xF0
  int    injured_of_attack[20] # 0x280
  byte   itr_of_attack[20]     # 0x2D0
  int    successful_attacks    # 0x2E4
  frame  *frames               # 0x368