# 0x00417170
def func_417170_random(unused, range)
  # push esi
  # mov esi,dword ptr ss:[esp+C]
  # test esi,esi
  # jg short 0041717D
  if range <= 0
    # xor eax,eax
    return 0
  end
  # 0041717D
  # mov eax,dword ptr ds:[450C34]
  # add eax,1
  # cdq
  # mov ecx,4D2
  # idiv ecx
  # mov eax,dword ptr ds:[450BCC]
  # add eax,1
  # push edi
  # mov edi,0BB8
  # mov ecx,edx
  # cdq
  # idiv edi
  # pop edi
  # mov dword ptr ds:[450C34],ecx
  # movzx eax,byte ptr ds:[edx+44FF90]
  # add eax,ecx
  # mov dword ptr ds:[450BCC],edx
  # cdq
  # idiv esi
  # pop esi
  # mov eax,edx
  # retn
  next_i = (* _450C34 + 1) % 1234
  next_j = (* _450BCC + 1) % 3000
  * _450C34 = next_i
  * _450BCC = next_j
  (next_i + _44FF90[next_j]) % range
end
