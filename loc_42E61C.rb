# 42E61C
if cond
  a # 42E812
else
  b

if cond
  a # 42E812
else
  if cond
    b # 42E6EC
  else
    if cond
      c # 42FDF2
    else
      d # 42E6EC

if cond
  a # 42E812
else
  if cond or !cond
    b # 42E6EC
  else
    c # 42FDF2

if cond
  a # 42E812
else
  if cond or !cond
    if cond
      b # 42E7CE
    else
      c # 42FDF2
  else
    c # 42FDF2

if cond
  a # 42E812
else
  if (cond or !cond) and cond
    if cond
      b # 42FDF2
    else
      c # 42E812
  else
    d # 42FDF2

if cond
  a # 42E812
else
  if (cond or !cond) and cond and !cond
    c # 42E812
  else
    d # 42FDF2

if cond or ((cond or !cond) and cond and !cond)
  a # 42E812
else
  d # 42FDF2

if cond or ((cond or !cond) and cond and !cond)
  if !cond
    a # 431AC4
  else
    b
else
  d # 42FDF2

if cond or ((cond or !cond) and cond and !cond)
  if !cond
    return
  end
  b
else
  d # 42FDF2
