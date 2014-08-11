struct frame
  int    state                 # 0x8
  double dvy                   # 0x18
  int    cpoint_kind           # 0x88
  int    hurtable              # 0xB4
  int    attaking              # 0xE8
  int    itrs_size             # 0x128
  int    bdys_size             # 0x12C
  int    *itrs                 # 0x130
  int    *bdys                 # 0x134
