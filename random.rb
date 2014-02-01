# 0x00417170
def random(unused, range)
  # mov esi,dword ptr ss:[esp+C]
  # test esi,esi
  # jg short 0041717D
  if range <= 0
    # xor eax,eax
    0
  else
    # 0041717D
    # mov eax,dword ptr ds:[450C34]
    # add eax,1
  end
end
