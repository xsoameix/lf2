# 0x00417090
def func_416FB0(x, arg_2)
  # push esi
  # push edi
  # mov edi,dword ptr ss:[esp+C]
  # sub edi,dword ptr ds:[450BC4]
  # lea eax,dword ptr ds:[edi-C8]
  # test eax,eax
  # jge short 004170A8
  x -= perspective
  width = x - 200
  if x < 0
    # neg eax
    width = -width
  end
  # 004170A8
  # cmp eax,0C8
  # jge short 004170B6
  if width < 200
    # mov esi,64
    # jmp short 004170DC
    _? = 100

    # 004170B6
    # cmp eax,190
    # jge short 004170DA
  elsif width < 400
    # mov ecx,190
    # sub ecx,eax
    # imul ecx,ecx,64
    # mov eax,51EB851F
    # imul ecx
    # sar edx,6
    # mov esi,edx
    # shr esi,1F
    # add esi,edx
    # jmp short 004170DC
    _? = (400 - width) / 2
  else
    # 004170DA
    # xor esi,esi
    _? = 0
  end
  # 004170DC
  # lea eax,dword ptr ds:[edi-258]
  # test eax,eax
  # jge short 004170E8
  width = x - 600
  if width < 0
    # neg eax
    width = -width
  end
  # 004170E8
  # cmp eax,0C8
  # jge short 004170F6
  if width < 200
    # mov eax,64
    # jmp short 0041711C
    __? = 100

    # 004170F6
    # cmp eax,190
    # jge short 0041711A
  elsif width < 400
    # mov ecx,190
    # sub ecx,eax
    # imul ecx,ecx,64
    # mov eax,51EB851F
    # imul ecx
    # sar edx,6
    # mov eax,edx
    # shr eax,1F
    # add eax,edx
    # jmp short 0041711C
    __? = (400 - width) / 2
  else
    # 0041711A
    # xor eax,eax
    __? = 0
  end
  # 0041711C
  # mov ecx,dword ptr ss:[esp+10]
  # cmp dword ptr ds:[ecx*4+453E10],0
  # jnz short 00417140
  if _453E10[arg_2] == 0
    # mov dword ptr ds:[ecx*4+4527E8],0
    # mov dword ptr ds:[ecx*4+4554C8],0
    _4527E8[arg_2] = 0
    _4554C8[arg_2] = 0
  end
  # 00417140
  # add dword ptr ds:[ecx*4+4527E8],esi
  # add dword ptr ds:[ecx*4+4554C8],eax
  # mov dword ptr ds:[ecx*4+453E10],1
  # lea ecx,dword ptr ds:[ecx*4+4554C8]
  # pop edi
  # pop esi
  # retn
  _4527E8[arg_2] += _?
  _4554C8[arg_2] += __?
  _453E10[arg_2] = 1
  &_4554C8[arg_2]
end
