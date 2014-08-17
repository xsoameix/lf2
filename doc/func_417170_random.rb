# 0x00417170
def random(unused, range)
  if range <= 0
    return 0
  end
  # 0041717D
  next_i = (* _450C34 + 1) % 1234
  next_j = (* _450BCC + 1) % 3000
  * _450C34 = next_i
  * _450BCC = next_j
  (next_i + _44FF90[next_j]) % range
end
