# 0x00403270
def func_403270_teleport(global, teleported_id, teleport_to)
  # sub esp,8
  # mov eax,dword ptr ss:[esp+10]
  # push ebx
  # push ebp
  # or edx,FFFFFFFF
  # cmp eax,1
  # push esi
  # push edi
  # mov dword ptr ss:[esp+10],edx
  # jnz 00403396
  @closest_object_id = -1
  @farthest_object_id = -1
  case teleport_to
  when teleport_to_enemy
    # mov edx,dword ptr ss:[esp+1C]
    # lea eax,dword ptr ds:[ecx+194]
    # mov dword ptr ss:[esp+14],2710
    # xor ebx,ebx
    # mov dword ptr ss:[esp+20],eax
    @min_distance = 10000
    @object_ptr = &global->objects

    # the condition of the loop
    # 0040330E
    # add dword ptr ss:[esp+20],4
    # add ebx,1
    # cmp ebx,190
    # jl short 004032A3
    for (object_id = 0;
         object_id < max_objects_size;
         object_id++, @object_ptr++)
      # 004032A3
      # cmp ebx,edx
      # je short 0040330E
      # cmp byte ptr ds:[ebx+ecx+4],0
      # je short 0040330E
      object_exists = global->is_object_exists[object_id]

      # mov eax,dword ptr ss:[esp+20]
      # mov edi,dword ptr ds:[eax]
      # mov eax,dword ptr ds:[edi+368]
      # cmp dword ptr ds:[eax+6F8],0
      # jnz short 0040330E
      object = * @object_ptr

      # mov ebp,dword ptr ds:[ecx+edx*4+194]
      # mov eax,dword ptr ds:[edi+364]
      # cmp eax,dword ptr ss:[ebp+364]
      # je short 0040330E
      # cmp dword ptr ds:[edi+2FC],0
      # jle short 0040330E
      teleported = global->objects[teleported_id]

      # mov eax,dword ptr ds:[edi+18]
      # sub eax,dword ptr ss:[ebp+18]
      # push eax
      # call 004034E0
      # mov esi,eax
      # mov eax,dword ptr ds:[edi+10]
      # sub eax,dword ptr ss:[ebp+10]
      # push eax
      # call 004034E0
      # add esi,eax
      # add esp,8
      # cmp esi,dword ptr ss:[esp+14]
      # jge short 0040330E
      distance =
        abs(object->z - teleported->z) +
        abs(object->x - teleported->x)
      if (object_id != teleported_id and
          object_exists and
          object->file->type == character_type and
          object->team != teleported->team and
          object->hp > 0 and
          distance < @min_distance)
        # mov dword ptr ss:[esp+10],ebx
        # mov dword ptr ss:[esp+14],esi
        @closest_object_id = object_id
        @min_distance = distance
      end
    end
    # mov eax,dword ptr ss:[esp+10]
    # cmp eax,-1
    # jnz short 00403347
    if @closest_object_id == -1
      # 00403327
      # mov eax,dword ptr ds:[ecx+edx*4+194]
      # mov dword ptr ds:[eax+14],0
      # mov eax,dword ptr ds:[ecx+edx*4+194]
      # fild dword ptr ds:[eax+14]
      # fstp qword ptr ds:[eax+60]
      # jmp 004034AC
      teleported = global->objects[teleported_id]
      teleported->y = 0
      teleported = global->objects[teleported_id]
      teleported->y_position = teleported->y.to_f
    else
      # 00403347
      # mov esi,dword ptr ds:[ecx+edx*4+194]
      # mov dword ptr ds:[esi+14],0
      # mov esi,dword ptr ds:[ecx+eax*4+194]
      # mov esi,dword ptr ds:[esi+18]
      # mov edi,dword ptr ds:[ecx+edx*4+194]
      # add esi,1
      # mov dword ptr ds:[edi+18],esi
      # mov esi,dword ptr ds:[ecx+edx*4+194]
      # cmp byte ptr ds:[esi+80],0
      # mov eax,dword ptr ds:[ecx+eax*4+194]
      # mov eax,dword ptr ds:[eax+10]
      # jnz short 0040338E
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
        # sub eax,78
        # jmp 00403482
        closest_object_x -= 120
      else
        # 0040338E
        # add eax,78
        # jmp 00403482
        closest_object_x += 120
      end
      # 00403482
      # mov dword ptr ds:[esi+10],eax
      # mov eax,dword ptr ds:[ecx+edx*4+194]
      # fild dword ptr ds:[eax+10]
      # fstp qword ptr ds:[eax+58]
      # mov eax,dword ptr ds:[ecx+edx*4+194]
      # fild dword ptr ds:[eax+14]
      # fstp qword ptr ds:[eax+60]
      # mov eax,dword ptr ds:[ecx+edx*4+194]
      # fild dword ptr ds:[eax+18]
      # fstp qword ptr ds:[eax+68]
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
    # cmp eax,2
    # jnz 004034CC

    # mov dword ptr ss:[esp+14],edx
    # lea edx,dword ptr ds:[ecx+194]
    # mov dword ptr ss:[esp+20],edx
    # mov edx,dword ptr ss:[esp+1C]
    # xor ebx,ebx
    @max_distance = -1
    @object_ptr = &global->objects

    # the condition of the loop
    # 0040341E
    # add dword ptr ss:[esp+20],4
    # add ebx,1
    # cmp ebx,190
    # jl short 004033B3
    for (object_id = 0;
         object_id < max_objects_size;
         object_id++, @object_ptr++)
      # 004033B3
      # cmp ebx,edx
      # je short 0040341E

      # cmp byte ptr ds:[ebx+ecx+4],0
      # je short 0040341E
      object_exists = global->is_object_exists[object_id]

      # mov eax,dword ptr ss:[esp+20]
      # mov edi,dword ptr ds:[eax]
      # mov eax,dword ptr ds:[edi+368]
      # cmp dword ptr ds:[eax+6F8],0
      # jnz short 0040341E
      object = * @object_ptr

      # mov ebp,dword ptr ds:[ecx+edx*4+194]
      # mov eax,dword ptr ds:[edi+364]
      # cmp eax,dword ptr ss:[ebp+364]
      # jnz short 0040341E
      teleported = global->objects[teleported_id]

      # cmp dword ptr ds:[edi+2FC],0
      # jle short 0040341E

      # mov eax,dword ptr ds:[edi+18]
      # sub eax,dword ptr ss:[ebp+18]
      # push eax
      # call 004034E0
      # mov esi,eax
      # mov eax,dword ptr ds:[edi+10]
      # sub eax,dword ptr ss:[ebp+10]
      # push eax
      # call 004034E0
      # add esi,eax
      # add esp,8
      # cmp esi,dword ptr ss:[esp+14]
      # jle short 0040341E
      distance =
        abs(object->z - teleported->z) +
        abs(object->x - teleported->x)
      if (object_id != teleported_id and
          object_exists and
          object->file->type == character_type and
          object->team == teleported->team and
          object->hp > 0 and
          distance > @max_distance)
        # mov dword ptr ss:[esp+10],ebx
        # mov dword ptr ss:[esp+14],esi
        @farthest_object_id = object_id
      end
    end
    # mov eax,dword ptr ss:[esp+10]
    # cmp eax,-1
    # je 00403327
    if @farthest_object_id == -1
      # 00403327
      # mov eax,dword ptr ds:[ecx+edx*4+194]
      # mov dword ptr ds:[eax+14],0
      # mov eax,dword ptr ds:[ecx+edx*4+194]
      # fild dword ptr ds:[eax+14]
      # fstp qword ptr ds:[eax+60]
      # jmp 004034AC
      teleported = global->objects[teleported_id]
      teleported->y = 0
      teleported = global->objects[teleported_id]
      teleported->y_position = teleported->y.to_f
    else
      # mov esi,dword ptr ds:[ecx+edx*4+194]
      # mov dword ptr ds:[esi+14],0
      # mov esi,dword ptr ds:[ecx+eax*4+194]
      # mov esi,dword ptr ds:[esi+18]
      # mov edi,dword ptr ds:[ecx+edx*4+194]
      # add esi,1
      # mov dword ptr ds:[edi+18],esi
      # mov esi,dword ptr ds:[ecx+edx*4+194]
      # cmp byte ptr ds:[esi+80],0
      # mov eax,dword ptr ds:[ecx+eax*4+194]
      # mov eax,dword ptr ds:[eax+10]
      # jnz short 0040347F
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
        # sub eax,3C
        # jmp short 00403482
        farthest_object_x -= 60
      else
        # 0040347F
        # add eax,3C
        farthest_object_x += 60
      end
      # 00403482
      # mov dword ptr ds:[esi+10],eax
      # mov eax,dword ptr ds:[ecx+edx*4+194]
      # fild dword ptr ds:[eax+10]
      # fstp qword ptr ds:[eax+58]
      # mov eax,dword ptr ds:[ecx+edx*4+194]
      # fild dword ptr ds:[eax+14]
      # fstp qword ptr ds:[eax+60]
      # mov eax,dword ptr ds:[ecx+edx*4+194]
      # fild dword ptr ds:[eax+18]
      # fstp qword ptr ds:[eax+68]
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
  # mov eax,dword ptr ds:[ecx+edx*4+194]
  # fldz
  # fst qword ptr ds:[eax+50]
  # mov eax,dword ptr ds:[ecx+edx*4+194]
  # fst qword ptr ds:[eax+48]
  # mov ecx,dword ptr ds:[ecx+edx*4+194]
  # fstp qword ptr ds:[ecx+40]
  teleported = global->objects[teleported_id]
  teleported->z_velocity = 0
  teleported = global->objects[teleported_id]
  teleported = global->objects[teleported_id]
  teleported->x_velocity = teleported->y_velocity

  # 004034CC
  # pop edi
  # pop esi
  # pop ebp
  # pop ebx
  # add esp,8
  # retn 8
end
