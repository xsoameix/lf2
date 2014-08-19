# 0x00417400
def func_417400_does_attack_success(global, attacker_id, injured_id)
  # sub esp,30
  # mov eax,dword ptr ss:[esp+34]
  # push esi
  # mov esi,ecx
  # mov eax,dword ptr ds:[esi+eax*4+194]
  # mov ecx,dword ptr ds:[eax+7C]
  # mov edx,dword ptr ds:[eax+368]
  # imul ecx,ecx,178
  # mov eax,dword ptr ss:[esp+3C]
  # mov eax,dword ptr ds:[esi+eax*4+194]
  # lea ecx,dword ptr ds:[ecx+edx+7A4]
  # mov edx,dword ptr ds:[eax+7C]
  # mov eax,dword ptr ds:[eax+368]
  # imul edx,edx,178
  # lea edx,dword ptr ds:[edx+eax+7A4]
  # xor eax,eax
  # cmp dword ptr ds:[ecx+128],eax
  # mov dword ptr ss:[esp+24],ecx
  # mov dword ptr ss:[esp+18],edx
  # mov dword ptr ss:[esp+C],eax
  # jle 00417F77
  attacker = global->objects[attacker_id]
  frame_id = attacker->frame_id
  file = attacker->file
  @attacker_frame = &file->frames[frame_id]
  injured = global->objects[injured_id]
  frame_id = injured->frame_id
  file = injured->file
  @injured_frame = &file->frames[frame_id]

  # push ebx
  # push ebp
  # push edi

  # the condition of the loop
  # 00417F59
  # mov eax,dword ptr ss:[esp+18]
  # mov edx,dword ptr ss:[esp+30]
  # add eax,1
  # cmp eax,dword ptr ds:[edx+128]
  # mov dword ptr ss:[esp+18],eax
  # jl 00417465

  # pop edi
  # pop ebp
  # pop ebx
  for (@itr_id = 0; @itr_id < @attacker_frame->itrs_size; @itr_id++)
    # 00417465
    # mov ecx,dword ptr ss:[esp+30]
    # mov edx,dword ptr ss:[esp+24]
    # lea eax,dword ptr ds:[eax+eax*4]
    # shl eax,4
    # add eax,dword ptr ds:[ecx+130]
    # cmp dword ptr ds:[edx+12C],0
    # mov dword ptr ss:[esp+10],eax
    # mov dword ptr ss:[esp+20],0
    # jle 00417F59
    @itr = &@attacker_frame->itrs[@itr_id]
    @_var20 = 0
    if @injured_frame->bdys_size <= 0
      next
    end
    # 00417492
    # mov eax,dword ptr ss:[esp+44]
    # mov eax,dword ptr ds:[esi+eax*4+194]
    # mov eax,dword ptr ds:[eax+368]
    # mov dword ptr ss:[esp+1C],eax
    # mov eax,dword ptr ds:[eax+6F4]
    # cmp eax,0C8
    # mov dword ptr ss:[esp+28],eax
    # je short 004174E2
    attacker = global->objects[attacker_id]
    @attacker_file = attacker->file
    @attacker_file_id = @attacker_file->id

    # cmp eax,0CB
    # je short 004174E2
    # cmp eax,0CD
    # je short 004174E2
    # cmp eax,0CE
    # je short 004174E2
    # cmp eax,0CF
    # je short 004174E2
    # cmp eax,0D7
    # je short 004174E2
    # cmp eax,0D8
    # jnz short 0041750C

    # 004174E2
    # mov edi,dword ptr ss:[esp+48]
    # mov ecx,dword ptr ds:[esi+edi*4+194]
    # mov edx,dword ptr ds:[ecx+368]
    # cmp dword ptr ds:[edx+6F4],0D1
    # jnz short 00417510
    injured = global->objects[injured_id]
    file = injured->file
    injured_file_id = file->id

    # mov eax,dword ptr ss:[esp+10]
    # cmp dword ptr ds:[eax],9
    # jnz 00417F59

    # freeze ball can't be attack by the other balls.
    if ((@attacker_file_id == john_ball_dat or
         @attacker_file_id == deep_ball_dat or
         @attacker_file_id == dennis_ball_dat or
         @attacker_file_id == woody_ball_dat or
         @attacker_file_id == davis_ball_dat or
         @attacker_file_id == dennis_chase_dat or
         @attacker_file_id == jack_ball_dat
        ) and
        injured_file_id == freeze_ball_dat and
        # forcefield is in john_ball.dat, but it can attack freeze ball.
        @itr->kind != itr_forcefield)
      next
    end
    # 0041750C
    # mov edi,dword ptr ss:[esp+48]

    # 00417510
    # mov ecx,dword ptr ss:[esp+10]
    # mov edx,dword ptr ds:[ecx]
    # cmp edx,3
    # mov dword ptr ss:[esp+14],edx
    # jnz short 0041753D
    @itr_kind = @itr->kind

    # mov eax,dword ptr ds:[esi+edi*4+194]
    # mov ecx,dword ptr ds:[eax+368]
    # cmp dword ptr ds:[ecx+6F8],0
    # jnz 00417F59
    injured = global->objects[injured_id]
    file = injured->file
    injured_type = file->type

    # mov edi,dword ptr ss:[esp+48]

    # can only catch character
    if (@itr_kind == itr_catch and
        injured_file != character_type)
      next
    end
    # 0041753D
    # test edx,edx
    # jnz 004176AC
    if @itr_kind == itr_normal_attack
      # mov eax,dword ptr ss:[esp+10]
      # mov ecx,dword ptr ds:[eax+2C]
      # cmp ecx,4
      # jnz short 0041756E
      effect = @itr->effect

      # mov eax,dword ptr ds:[esi+edi*4+194]
      # mov eax,dword ptr ds:[eax+368]
      # cmp dword ptr ds:[eax+6F8],edx
      # je 00417F59
      injured = global->objects[injured_id]
      file = injured->file
      injured_type = file->type

      # mov edi,dword ptr ss:[esp+48]

      # shrafe attack flying attacks, weapons except for character
      if (effect == shrafe_effect and
          injured_type == character_type)
        next
      end
      # 0041756E
      # cmp ecx,14
      # jnz short 004175E1

      # mov eax,dword ptr ds:[esi+edi*4+194]
      # mov eax,dword ptr ds:[eax+368]
      # cmp dword ptr ds:[eax+6F8],0
      # jnz 00417F59
      injured = global->objects[injured_id]
      file = injured->file
      injured_type = file->type

      # mov eax,dword ptr ss:[esp+48]
      # mov eax,dword ptr ds:[esi+eax*4+194]
      # mov edi,dword ptr ds:[eax+78]
      # mov eax,dword ptr ds:[eax+368]
      # imul edi,edi,178
      # cmp dword ptr ds:[edi+eax+7AC],12
      # je 00417F59
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id].state

      # mov eax,dword ptr ss:[esp+48]
      # mov eax,dword ptr ds:[esi+eax*4+194]
      # mov edi,dword ptr ds:[eax+78]
      # mov eax,dword ptr ds:[eax+368]
      # imul edi,edi,178
      # cmp dword ptr ds:[edi+eax+7AC],13
      # je 00417F59
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id].state

      # mov edi,dword ptr ss:[esp+48]
      if (effect == fire_effect and
          (injured_type != character_type or
           injured_state == fire_state or
           injured_state == burn_run_state))
        next
      end
      # 004175E1
      # cmp ecx,15
      # jnz short 00417636

      # mov eax,dword ptr ds:[esi+edi*4+194]
      # mov edi,dword ptr ds:[eax+78]
      # mov eax,dword ptr ds:[eax+368]
      # imul edi,edi,178
      # cmp dword ptr ds:[edi+eax+7AC],12
      # je 00417F59
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id].state

      # mov eax,dword ptr ss:[esp+48]
      # mov eax,dword ptr ds:[esi+eax*4+194]
      # mov edi,dword ptr ds:[eax+78]
      # mov eax,dword ptr ds:[eax+368]
      # imul edi,edi,178
      # cmp dword ptr ds:[edi+eax+7AC],13
      # je 00417F59
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id].state

      # mov edi,dword ptr ss:[esp+48]
      if (effect == burn_effect and
          (injured_state == fire_state or
           injured_state == burn_run_state))
        next
      end
      # 00417636
      # cmp ecx,1E
      # jnz short 0041765B

      # mov eax,dword ptr ds:[esi+edi*4+194]
      # mov eax,dword ptr ds:[eax+70]
      # cmp eax,0C8
      # jl short 0041765B
      injured = global->objects[injured_id]
      injured_frame_id = injured->frame_id

      # cmp eax,0CA
      # jle 00417F59

      # mov edi,dword ptr ss:[esp+48]

      # freeze column can't attack the one is freezed.
      if (effect == column_effect and
          injured_frame_id >= freeze_frame_start and
          injured_frame_id <= freeze_frame_end)
        next
      end
      # 0041765B
      # cmp ecx,2
      # jnz short 004176AC

      # mov ecx,dword ptr ss:[esp+44]
      # mov eax,dword ptr ds:[esi+ecx*4+194]
      # mov ecx,dword ptr ds:[eax+78]
      # mov eax,dword ptr ds:[eax+368]
      # imul ecx,ecx,178
      # cmp dword ptr ds:[ecx+eax+7AC],13
      # jnz short 004176AC
      attacker = global->objects[attacker_id]
      frame_id = attacker->frame_id
      file = attacker->file
      attacker_state = file->frames[frame_id].state

      # mov eax,dword ptr ds:[esi+edi*4+194]
      # mov ecx,dword ptr ds:[eax+78]
      # mov eax,dword ptr ds:[eax+368]
      # imul ecx,ecx,178
      # cmp dword ptr ds:[ecx+eax+7AC],12
      # je 00417F59
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id]

      # mov edi,dword ptr ss:[esp+48]

      # burn run skill can't attack the one is burning.
      if (effect == fire_effect and
          attacker_state == burn_run_state and
          injured_state == fire_state)
        next
      end
    end
    # 004176AC
    # cmp edx,8
    # jnz short 004176CF

    # mov ecx,dword ptr ds:[esi+edi*4+194]
    # mov eax,dword ptr ds:[ecx+368]
    # cmp dword ptr ds:[eax+6F8],0
    # jnz 00417F59
    injured = global->objects[injured_id]
    file = injured->file
    injured_type = file->type

    # mov edi,dword ptr ss:[esp+48]
    if (@itr_kind == itr_heal and
        injured_type != character_type)
      next
    end
    # 004176CB
    # mov ebx,dword ptr ds:[esi+edi*4+194]
    # cmp dword ptr ds:[ebx+8],0
    # je short 004176EE
    injured = global->objects[injured_id]

    # cmp edx,8
    # je short 004176EE
    # cmp edx,0E
    # jnz 00417F59

    # mov edi,dword ptr ss:[esp+48]

    # only healball, stone, and box can attack the one is invincible
    if (injured->invincible_time != 0 and
        @itr_kind != itr_heal and
        @itr_kind != itr_stop)
      next
    end
    # 004176EE
    # cmp edx,4
    # jl short 00417724
    # cmp edx,6
    # je short 00417724
    # cmp edx,9
    # jnz short 0041770C
    # mov ecx,dword ptr ds:[ebx+368]
    # cmp dword ptr ds:[ecx+6F8],0
    # je short 00417724
    file = injured->file
    injured_type = file->type

    # 0041770C
    # cmp edx,0A
    # je short 00417724
    # cmp edx,0B
    # je short 00417724
    # cmp edx,0F
    # je short 00417724
    # cmp edx,10
    # jnz 00417866

    # thrown team can attack the one on same team.
    # character can pick again the light weapon picked before when rowing.
    # healball can attack the one on same team.
    # stone and box can stop character from moving.
    if (@itr_kind < itr_thrown or
        @itr_kind == itr_super_punch or
        (@itr_kind == itr_forcefield and injured_type == character_type) or
        @itr_kind == itr_flute or
        @itr_kind == itr_float or
        @itr_kind == itr_fly or
        @itr_kind == itr_freeze)
      # 00417724
      # mov eax,dword ptr ds:[esi+edi*4+194]
      # mov ecx,dword ptr ds:[eax+70]
      # mov eax,dword ptr ds:[eax+368]
      # imul ecx,ecx,178
      # cmp dword ptr ds:[ecx+eax+7AC],0D
      # je 00417866
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id].state

      # mov eax,dword ptr ds:[esi+edi*4+194]
      # mov ecx,dword ptr ds:[eax+70]
      # mov eax,dword ptr ds:[eax+368]
      # imul ecx,ecx,178
      # cmp dword ptr ds:[ecx+eax+7AC],0A
      # je 00417866
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id].state

      # mov ecx,dword ptr ds:[ebx+368]
      # cmp dword ptr ds:[ecx+6F4],0D4
      # jnz short 004177B9
      file = injured->file
      injured_file_id = file->id

      # cmp dword ptr ss:[esp+28],0D4
      # jnz 00417866

      # mov eax,dword ptr ds:[ebx+70]
      # cdq
      # mov ebp,0A
      # idiv ebp
      # cmp edx,5
      # jnz short 004177B5

      # mov edx,dword ptr ss:[esp+44]
      # mov eax,dword ptr ds:[esi+edx*4+194]
      # mov eax,dword ptr ds:[eax+70]
      # cdq
      # idiv ebp
      # test edx,edx
      # je 00417862
      attacker = global->objects[attacker_id]

      # 004177B5
      # mov edx,dword ptr ss:[esp+14]

      # attacker can attack freezed character on same team.
      # attacker can attack picked caught character on same team.
      # attacker can attack freeze column on same team.
      # freeze column can't attack another one in same time.
      if (injured_state != ice_state and
          injured_state != picked_caught_state and
          (injured_file_id != freeze_column_dat or
           (@attacker_file_id == freeze_column_dat and
            (injured->frame_id % 10 != 5 or
             attacker->frame_id % 10 != 0))))
        # 004177B9
        # mov eax,dword ptr ss:[esp+44]
        # mov ebp,dword ptr ds:[esi+eax*4+194]
        # mov eax,dword ptr ss:[ebp+364]
        # cmp eax,dword ptr ds:[ebx+364]
        # jnz 00417866
        attacker = global->objects[attacker_id]

        # test eax,eax
        # je 00417866
        # cmp edx,8
        # je 00417866

        # mov edx,dword ptr ss:[esp+44]
        # mov eax,dword ptr ds:[esi+edx*4+194]
        # mov edx,dword ptr ds:[eax+70]
        # mov eax,dword ptr ds:[eax+368]
        # imul edx,edx,178
        # cmp dword ptr ds:[edx+eax+7AC],12
        # jnz short 0041781C
        attacker = global->objects[attacker_id]
        frame_id = attacker->frame_id
        file = attacker->file
        attacker_state = file->frames[frame_id]

        # mov edx,dword ptr ss:[esp+10]
        # mov eax,dword ptr ds:[edx+2C]
        # cmp eax,15
        # je short 0041781C
        effect = @itr->effect

        # cmp eax,16
        # jnz short 00417862

        # 0041781C
        # mov eax,dword ptr ss:[esp+1C]
        # cmp dword ptr ds:[eax+6F8],0
        # jnz short 00417840
        attacker_type = @attacker_file->type

        # cmp dword ptr ds:[ecx+6F8],3
        # jnz short 00417840
        injured_type = file->type

        # mov dl,byte ptr ss:[ebp+80]
        # cmp dl,byte ptr ds:[ebx+80]
        # jnz short 00417862

        # 00417840
        # mov eax,dword ptr ds:[ecx+6F8]
        # cmp eax,1
        # je short 00417862
        injured_type = file->type
        # cmp eax,2
        # je short 00417862
        # cmp eax,4
        # je short 00417862
        # cmp eax,6
        # jnz 00417F59
        # mov edi,dword ptr ss:[esp+48]

        # 00417862
        # mov edx,dword ptr ss:[esp+14]

        # attacker can't attack the one on same team.
        if (attacker->team == injured->team and
            attacker->team != no_team and
            @itr_kind != itr_heal and
            # burning object can attack the one on same team except
            # flame and firen explosion.
            (attacker_state != fire_state or
             effect == flame_effect or
             effect == firen_explosion_effect
            ) and
            # weapons and balls and drinks can attack the balls in
            # opposite directions.
            (attacker_type != character_type or
             injured_type != attack_type or
             attacker->facing == injured->facing
            ) and
            # attacker can attack weapons and drinks on same team.
            injured_type != lignt_weapon_type and
            injured_type != heavy_weapon_type and
            injured_type != throw_weapon_type and
            injured_type != drink_type)
          next
        end
      end
    end
    # 00417866
    # cmp edx,5
    # jnz 00417919

    # mov eax,dword ptr ss:[esp+44]
    # mov ebp,dword ptr ds:[esi+eax*4+194]
    # mov ecx,dword ptr ss:[ebp+A0]
    # mov edx,dword ptr ds:[esi+ecx*4+194]
    # mov eax,dword ptr ds:[edx+364]
    # cmp eax,dword ptr ds:[ebx+364]
    # jnz 00417919
    attacker = global->objects[attacker_id]
    holder_id = attacker->holder_id
    holder = global->objects[holder_id]

    # test eax,eax
    # je short 00417919

    # mov eax,dword ptr ds:[esi+edi*4+194]
    # mov ecx,dword ptr ds:[eax+70]
    # mov edx,dword ptr ds:[eax+368]
    # imul ecx,ecx,178
    # cmp dword ptr ds:[ecx+edx+7AC],0D
    # je short 00417919
    injured = global->objects[injured_id]
    frame_id = injured->frame_id
    file = injured->file
    injured_state = file->frames[frame_id].state

    # mov ecx,dword ptr ds:[ebx+368]
    # mov eax,dword ptr ds:[ecx+6F8]
    # cmp eax,1
    # je short 00417919
    file = injured->file
    injured_type = file->type

    # cmp eax,2
    # je short 00417919
    # cmp eax,4
    # je short 00417919
    # cmp eax,6
    # je short 00417919
    # cmp dword ptr ds:[ecx+6F4],0D4
    # jnz 00417F59
    injured_file_id = file->id

    # cmp dword ptr ss:[esp+28],0D4
    # jnz short 00417919

    # mov eax,dword ptr ds:[ebx+70]
    # cdq
    # mov ecx,0A
    # idiv ecx
    # cmp edx,5
    # jnz 00417F59

    # mov eax,dword ptr ss:[ebp+70]
    # cdq
    # idiv ecx
    # test edx,edx
    # jnz 00417F59

    if (@itr_kind == itr_strength_list and
        # character can't use weapon to attack the one on same team.
        holder->team == injured->team and
        holder->team != no_team and
        # character can use weapon to attack freezed character on same team.
        injured_state != ice_state and
        # character can use weapon to attack weapons and drinks on same team.
        injured_type != lignt_weapon_type and
        injured_type != heavy_weapon_type and
        injured_type != throw_weapon_type and
        injured_type != drink_type and
        # character can use weapon to attack freeze column on same team.
        # character can't use freeze column to attack another one in same time.
        (injured_file_id != freeze_column_dat or
         (@attacker_file_id == freeze_column_dat and
          (injured->frame_id % 10 != 5 or
           holder->frame_id % 10 != 0))))
      next
    end
    # 00417919
    # cmp byte ptr ds:[ebx+80],0
    # mov eax,dword ptr ss:[esp+20]
    # lea edx,dword ptr ds:[eax+eax*4]
    # mov eax,dword ptr ss:[esp+24]
    # mov ecx,dword ptr ds:[eax+134]
    # mov edi,dword ptr ds:[ecx+edx*8+4]
    # lea eax,dword ptr ds:[ecx+edx*8]
    # mov ecx,dword ptr ss:[esp+10]
    # mov edx,dword ptr ds:[ecx+4]
    # mov ebp,dword ptr ds:[ecx+8]
    # mov ecx,dword ptr ds:[eax]
    # mov dword ptr ss:[esp+3C],ecx
    # mov ecx,dword ptr ds:[eax+8]
    # mov dword ptr ss:[esp+14],ecx
    # mov ecx,dword ptr ds:[eax+C]
    # mov eax,dword ptr ds:[eax+10]
    # mov dword ptr ss:[esp+28],ecx
    # mov dword ptr ss:[esp+38],eax
    # jnz short 00417988
  end
end
