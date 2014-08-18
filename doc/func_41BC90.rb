# 0x0041BC90
def func_41BC90(...)
  # 0041E339
  object_id = 0
  @object_id = object_id
  object_ptr = &global->objects

  # 0041E395
  object = * object_ptr
  frame_id = object->frame_id
  file = object->file
  state = file->frames[frame_id].state
  if (state == teleport_to_team_state and _450BD8 == 0)
    func_403270_teleport object_id, teleport_to_team
  end
  # 0041E3C6

  # 0041F5DF
  object = global->objects[object_id]
  frame_id = object->frame_id
  file = object->file
  state = file->frames[frame_id].state
  if state == 8000
  else
  end
end
