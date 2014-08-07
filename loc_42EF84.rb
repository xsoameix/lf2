# 42EF84
if cond
  a # 42EF9C
else
  b

if cond
  a # 42EF9C
else
  if cond
    b # 42EFB1
  else
    c # 42EF9C

if cond or !cond
  a # 42EF9C
else
  b # 42EFB1

# 42EF9C
if cond
  a # 42F008
else
  b

if cond
  a # 42F008
else
  if cond
    b # 42F008
  else
    c # 42EFB1

if cond or cond
  a # 42F008
else
  c # 42EFB1

# 42EF84
if cond or !cond
  if cond or cond
    a # 42F008
  else
    c # 42EFB1
else
  b # 42EFB1

if (cond or !cond) and (cond or cond)
  a # 42F008
else
  b # 42EFB1

if (attacker->facing != facing_left  or injured->x_velocity <= itr->dvx) and
   (attacker->facing != facing_right or injured->x_velocity >= itr->dvx)
  a # 42F008
else
  b # 42EFB1

if (attacker->facing == facing_left  and injured->x_velocity > itr->dvx) or
   (attacker->facing == facing_right and injured->x_velocity < itr->dvx)
  a # 42EFB1
else
  b # 42F008
