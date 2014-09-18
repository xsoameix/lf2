struct object
  int    move_counter          # 0x0
  int    invincible_time       # 0x8
  int    x                     # 0x10
  int    y                     # 0x14
  int    z                     # 0x18
  int    attacks               # 0x20
  double pic_x_gain            # 0x28
  double y_accl                # 0x30
  double z_accl                # 0x38
  double x_velocity            # 0x40
  double y_velocity            # 0x48
  double z_velocity            # 0x50
  double x_position            # 0x58
  double y_position            # 0x60
  double z_position            # 0x68
  int    frame_id              # 0x70
  int    frame_id              # 0x74
  int    frame_id              # 0x78
  int    frame_id              # 0x7C
  byte   facing                # 0x80
  int    wait_counter          # 0x88
  int    cpoint_catcher        # 0x8C
  int    cpoint_timer          # 0x90
  int    weapon_type           # 0x98
  int    weapon_id             # 0x9C
  int    holder_id             # 0xA0
  int    fall                  # 0xB0
  int    shaking               # 0xB4
  int    bdefend               # 0xB8
  byte   holding_attack        # 0xCA
  byte   click_left            # 0xCF
  byte   click_right           # 0xD0
  byte   click_attack          # 0xD1
  byte   _unknownEB            # 0xEB
  int    arest                 # 0xEC
  byte   vrest_of_objects[400] # 0xF0
  int    injured_of_attack[20] # 0x280
  byte   itr_of_attack[20]     # 0x2D0
  int    successful_attacks    # 0x2E4
  int    attackable_distance   # 0x2E8
  int    vulnerable_distance   # 0x2EC
  int    clone                 # 0x2F4
  int    hp                    # 0x2FC
  int    dark_hp               # 0x300
  int    drink_hp              # 0x31C
  int    thrown_injury         # 0x320
  int    armor_multiplier      # 0x340
  int    _unknown344           # 0x344
  int    total_attack          # 0x348
  int    hp_lost               # 0x34C
  int    owner_id              # 0x354
  int    kills                 # 0x358
  int    team                  # 0x364
  file   *file                 # 0x368
