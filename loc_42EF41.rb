# 42EF41
if cond
  a # 42EFC6
else
  b

if cond
  a # 42EFC6
else
  if cond
    b # 42EF6E
  else
    c

if cond
  a # 42EFC6
else
  if cond
    b # 42EF6E
  else
    if cond
      c # 42EFC6
    else
      d # 42EF6E

if cond or (!cond and cond)
  a # 42EFC6
else
  b # 42EF6E

if cond or (!cond and cond)
  a # 42EFC6
else
  if cond
    b # 42EF84
  else
    c

if cond or (!cond and cond)
  a # 42EFC6
else
  if cond
    b # 42EF84
  else
    if cond
      c # 42EFC6
    else
      d # 42EF84

if cond or (!cond and cond) or (!cond and cond)
  a # 42EFC6
else
  b # 42EF84

if (itr->dvx.to_f > injured->x_velocity.abs * 0.55) or
   (!(attacker->facing != facing_right) and injured->pic_x_gain > 0) or
   (!(attacker->facing != facing_left)  and injured->pic_x_gain < 0)
  a # 42EFC6
else
  b # 42EF84

if (itr->dvx.to_f > injured->x_velocity.abs * 0.55) or
   (attacker->facing == facing_right and injured->pic_x_gain > 0) or
   (attacker->facing == facing_left  and injured->pic_x_gain < 0)
  a # 42EFC6
else
  b # 42EF84
