# 0x0041BC90
def func_41BC90(...)
  # 0041E339
  # xor esi,esi
  # mov dword ptr ss:[esp+3C],esi
  # lea edi,dword ptr ds:[ebx+194]
  # cmp byte ptr ds:[ebx+esi+4],0
  object_id = 0
  @object_id = object_id
  object_ptr = global->objects

  # 0041E395
  # mov eax,dword ptr ds:[edi]
  # mov ecx,dword ptr ds:[eax+70]
  # mov edx,dword ptr ds:[eax+368]
  # imul ecx,ecx,178
  # cmp dword ptr ds:[ecx+edx+7AC],191
  # jnz short 0041E3C6
  # cmp dword ptr ds:[450BD8],0
  # jnz short 0041E3C6
  # push 2
  # push esi
  # mov ecx,ebx
  # call 00403270
  object = * object_ptr
  frame_id = object->frame_id
  file = object->file
  state = file->frames[frame_id].state
  if (state == teleport_to_team_state and _450BD8 == 0)
    func_403270_teleport global, object_id, teleport_to_team
  end
  # 0041E3C6

  # 0041F5DF
  # mov eax,dword ptr ds:[ebx+edi*4+194]
  # mov ecx,dword ptr ds:[eax+70]
  # mov edx,dword ptr ds:[eax+368]
  # imul ecx,ecx,178
  # mov eax,dword ptr ds:[ecx+edx+7AC]
  # cmp eax,1F40
  # jl short 0041F675
  object = global->objects[object_id]
  frame_id = object->frame_id
  file = object->file
  state = file->frames[frame_id].state
  if state == 8000
  else
  end
end
