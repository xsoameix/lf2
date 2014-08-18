# 0x00403270
def func_403270_teleport(global, teleported_id, teleport_to)
  # or edx,FFFFFFFF
  @closest_object_id = -1
  case teleport_to
  when teleport_to_enemy
    @min_distance = 10000
    object_ptr = &global->objects

    # the condition of the loop
    # 0040330E
    for (object_i = 0;
         object_i < max_objects_size;
         object_i++, object_ptr++)
      # 004032A3
      object_exists = global->is_object_exists[object_i]
      object = * object_ptr
      teleported = global->objects[teleported_id]
      distance =
        abs(object->z - teleported->z) +
        abs(object->x - teleported->x)
      if (object_i != teleported_id and
          object_exists and
          object->file->type == character_type and
          object->team != teleported->team and
          object->hp > 0 and
          distance < @min_distance)
        @closest_object_id = object_i
        @min_distance = distance
      end
    end
    if @closest_object_id == -1
      # 00403327
      teleported = global->objects[teleported_id]
      teleported->y = 0
      teleported = global->objects[teleported_id]
      teleported->y_position = teleported->y.to_f
    else
      # 00403347
      teleported = global->objects[teleported_id]
      teleported->y = 0
      closest_object = global->objects[@closest_object_id]
      teleported = global->objects[teleported_id]
      teleported->z = closest_object->z + 1
      teleported = global->objects[teleported_id]
      closest_object = global->objects[@closest_object_id]
      closest_object_x = closest_object->x
      if teleported->facing == facing_right
        closest_object_x -= 120
      else
        # 0040338E
        closest_object_x += 120
      end
      # 00403482
      teleported->x = closest_object_x
      teleported = global->objects[teleported_id]
      teleported = global->objects[teleported_id]
      teleported = global->objects[teleported_id]
      teleported->x_position = teleported->x.to_f
      teleported->y_position = teleported->y.to_f
      teleported->z_position = teleported->z.to_f
    end
  when teleport_to_team
    # 00403396
  else
    return
  end
  # 004034AC
  teleported = global->objects[teleported_id]
  teleported->z_velocity = 0
  teleported = global->objects[teleported_id]
  teleported = global->objects[teleported_id]
  teleported->x_velocity = teleported->y_velocity

  # 004034CC
end
