# 0x00416FB0
def func_416FB0(x, arg_2)
  # push esi
  # push edi
  # mov edi,dword ptr ss:[esp+C]
  # sub edi,dword ptr ds:[450BC4]
  # lea eax,dword ptr ds:[edi-C8]
  # test eax,eax
  # jge short 00416FC8
  x -= perspective
  width = x - 200
  if width < 0
    # neg eax
    width = -width
  end
  # 00416FC8
  # cmp eax,0C8
  # jge short 00416FD6
  if width < 200
    # mov esi,64
    # jmp short 00416FFC
    _? = 100

    # 00416FD6
    # cmp eax,190
    # jge short 00416FFA
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
    # jmp short 00416FFC
    _? = (400 - width) / 2
  else
    # 00416FFA
    # xor esi,esi
    _? = 0
  end
  # 00416FFC
  # lea eax,dword ptr ds:[edi-258]
  # test eax,eax
  # jge short 00417008
  width = x - 600
  if width < 0
    # neg eax
    width = -width
  end
  # 00417008
  # cmp eax,0C8
  # jge short 00417016
  if width < 200
    # mov eax,64
    # jmp short 0041703C
    __? = 100
    # 00417016
    # cmp eax,190
    # jge short 0041703A
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
    # jmp short 0041703C
    __? = (400 - width) / 2
  else
    # 0041703A
    # xor eax,eax
    __? = 0
  end
  # 0041703C
  # mov ecx,dword ptr ss:[esp+10]
  # cmp dword ptr ds:[ecx*4+457588],0
  # jnz short 00417060
  if _457588[arg_2] == 0
    # mov dword ptr ds:[ecx*4+457BC8],0
    # mov dword ptr ds:[ecx*4+452170],0
    _457BC8[arg_2] = 0
    _452170[arg_2] = 0
  end
  # 00417060
  # add dword ptr ds:[ecx*4+457BC8],esi
  # add dword ptr ds:[ecx*4+452170],eax
  # mov dword ptr ds:[ecx*4+457588],1
  # lea ecx,dword ptr ds:[ecx*4+452170]
  # pop edi
  # pop esi
  # retn
  _457BC8[arg_2] += _?
  _452170[arg_2] += __?
  _457588[arg_2] = 1
  &_452170[arg_2]
end
