# 0x00403270
def func_403270_teleport(global, teleported_id, teleport_to)
  # or edx,FFFFFFFF
  @closest_object_id = -1
  @farthest_object_id = -1
  case teleport_to
  when teleport_to_enemy
    @min_distance = 10000
    @object_ptr = &global->objects

    # the condition of the loop
    # 0040330E
    for (object_id = 0;
         object_id < max_objects_size;
         object_id++, @object_ptr++)
      # 004032A3
      object_exists = global->is_object_exists[object_id]
      object = * @object_ptr
      teleported = global->objects[teleported_id]
      distance =
        abs(object->z - teleported->z) +
        abs(object->x - teleported->x)
      if (object_id != teleported_id and
          object_exists and
          object->file->type == character_type and
          object->team != teleported->team and
          object->hp > 0 and
          distance < @min_distance)
        @closest_object_id = object_id
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

      # confront to enemy
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
    @max_distance = -1
    @object_ptr = &global->objects

    # the condition of the loop
    # 0040341E
    for (object_id = 0;
         object_id < max_objects_size;
         object_id++, @object_ptr++)
      # 004033B3
      object_exists = global->is_object_exists[object_id]
      object = * @object_ptr
      teleported = global->objects[teleported_id]
      distance =
        abs(object->z - teleported->z) +
        abs(object->x - teleported->x)
      if (object_id != teleported_id and
          object_exists and
          object->file->type == character_type and
          object->team == teleported->team and
          object->hp > 0 and
          distance > @max_distance)
        @farthest_object_id = object_id
      end
    end
    if @farthest_object_id == -1
      # 00403327
      teleported = global->objects[teleported_id]
      teleported->y = 0
      teleported = global->objects[teleported_id]
      teleported->y_position = teleported->y.to_f
    else
      teleported = global->objects[teleported_id]
      teleported->y = 0
      farthest_object = global->objects[@farthest_object_id]
      teleported = global->objects[teleported_id]
      teleported->z = farthest_object->z + 1
      teleported = global->objects[teleported_id]
      farthest_object = global->objects[@farthest_object_id]
      farthest_object_x = farthest_object->x

      # confront to team
      if teleported->facing == facing_right
        farthest_object_x -= 60
      else
        # 0040347F
        farthest_object_x += 60
      end
      # 00403482
      teleported->x = farthest_object_x
      teleported = global->objects[teleported_id]
      teleported = global->objects[teleported_id]
      teleported = global->objects[teleported_id]
      teleported->x = teleported->x_position
      teleported->y = teleported->y_position
      teleported->z = teleported->z_position
    end
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
