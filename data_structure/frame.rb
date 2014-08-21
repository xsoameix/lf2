struct frame
  int    present               # 0x0
  int    state                 # 0x8
  double dvy                   # 0x18
  int    centerx               # 0x50
  int    centery               # 0x54
  int    cpoint_kind           # 0x88
  case cpoint_kind
  when catching_kind
    int    injury              # 0x94
  when caught_kind
    int    front_hurt_act      # 0x94
    int    back_hurt_act       # 0x98
  end
  int    hurtable              # 0xB4
  int    attaking              # 0xE8
  int    itrs_size             # 0x128
  int    bdys_size             # 0x12C
  int    *itrs                 # 0x130
  int    *bdys                 # 0x134
