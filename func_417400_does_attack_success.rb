# 0x00417400
def func_417400_does_attack_success(global, attacker_id, injured_id, mode)
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

    # the condition of the loop
    # 00417F3E
    # mov eax,dword ptr ss:[esp+20]
    # mov ecx,dword ptr ss:[esp+24]
    # add eax,1
    # cmp eax,dword ptr ds:[ecx+12C]
    # mov dword ptr ss:[esp+20],eax
    # jl 00417492
    for (@bdy_id = 0; @bdy_id < @injured_frame->bdys_size; @bdy_id++)
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
        break
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
        break
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
          break
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
          break
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
          break
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
          break
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
          break
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
        break
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
        break
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
            break
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
        break
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
      bdys = @injured_frame->bdys
      bdy_x = bdys[@bdy_id].x
      bdy = &bdys[@bdy_id]
      itr_x = @itr->x
      itr_y = @itr->y
      @bdy_kind = bdy->kind
      @bdy_y = bdy->y
      @bdy_w = bdy->w
      @bdy_h = bdy->h
      if injured->facing == facing_right
        # mov ecx,dword ptr ss:[esp+48]
        # mov ecx,dword ptr ds:[esi+ecx*4+194]
        # mov eax,dword ptr ds:[ecx+7C]
        # mov ebx,dword ptr ds:[ecx+368]
        # imul eax,eax,178
        # add eax,ebx
        # mov ebx,dword ptr ds:[ecx+10]
        # sub ebx,dword ptr ds:[eax+7F4]
        # add edi,ebx
        # jmp short 004179BD
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        @frame = &file->frames[frame_id]
        injured_centerx = @frame->centerx
        bdy_left_boundary = injured->x - injured_centerx + bdy_x
      else
        # 00417988
        # mov eax,dword ptr ss:[esp+48]
        # mov ecx,dword ptr ds:[esi+eax*4+194]
        # mov eax,dword ptr ds:[ecx+7C]
        # mov ebx,dword ptr ds:[ecx+368]
        # imul eax,eax,178
        # add eax,ebx
        # mov dword ptr ss:[esp+2C],eax
        # mov eax,dword ptr ds:[eax+7F4]
        # add eax,dword ptr ds:[ecx+10]
        # sub eax,dword ptr ss:[esp+28]
        # sub eax,edi
        # mov edi,eax
        # mov eax,dword ptr ss:[esp+2C]
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        @frame = &file->frames[frame_id]
        injured_centerx = @frame->centerx
        bdy_left_boundary = injured->x + injured_centerx - @bdy_w - bdy_x
      end
      # 004179BD
      # mov ecx,dword ptr ds:[ecx+14]
      # sub ecx,dword ptr ds:[eax+7F8]
      # mov eax,dword ptr ss:[esp+44]
      # add dword ptr ss:[esp+14],ecx
      # mov ecx,dword ptr ds:[esi+eax*4+194]
      # mov eax,dword ptr ds:[ecx+7C]
      # mov ebx,dword ptr ds:[ecx+368]
      # imul eax,eax,178
      # add eax,ebx
      # mov ebx,dword ptr ds:[ecx+10]
      # cmp byte ptr ds:[ecx+80],0
      # mov ecx,dword ptr ds:[ecx+14]
      # jnz short 004179FF
      injured_centery = @frame->centery
      @bdy_top_boundary = injured->y - injured_centery + @bdy_y
      attacker = global->objects[attacker_id]
      frame_id = attacker->frame_id
      file = attacker->file
      frame = &file->frames[frame_id]
      attacker_x = attacker->x
      attacker_y = attacker->y
      if attacker->facing == facing_right
        # sub ebx,dword ptr ds:[eax+7F4]
        # add edx,ebx
        # jmp short 00417A18
        attacker_centerx = frame->centerx
        itr_left_boundary = attacker_x - attacker_centerx + itr_x
      else
        # 004179FF
        # add ebx,dword ptr ds:[eax+7F4]
        # mov dword ptr ss:[esp+2C],eax
        # mov eax,dword ptr ss:[esp+10]
        # sub ebx,dword ptr ds:[eax+C]
        # mov eax,dword ptr ss:[esp+2C]
        # sub ebx,edx
        # mov edx,ebx
        attacker_centerx = frame->centerx
        @frame = frame
        itr_left_boundary = attacker_x + attacker_centerx - @itr->w - itr_x
      end
      # 00417A18
      # sub ecx,dword ptr ds:[eax+7F8]
      # mov dword ptr ss:[esp+34],0
      # add ebp,ecx
      # mov ecx,dword ptr ss:[esp+10]
      # mov eax,dword ptr ds:[ecx+48]
      # test eax,eax
      # jnz short 00417A38
      @in_z_boundary = false
      attacker_centery = frame->centery
      itr_top_boundary = attacker_y - attacker_centery + itr_y
      itr_zwidth = @itr->zwidth
      if itr_zwidth == 0
        # mov eax,0F
        # 00417A38
        itr_zwidth = 15
      end
      # 00417A38
      # mov ecx,dword ptr ss:[esp+44]
      # mov ecx,dword ptr ds:[esi+ecx*4+194]
      # mov ebx,dword ptr ss:[esp+48]
      # mov ebx,dword ptr ds:[esi+ebx*4+194]
      # mov ecx,dword ptr ds:[ecx+18]
      # sub ecx,dword ptr ds:[ebx+18]
      # mov dword ptr ss:[esp+2C],ebx
      # cmp ecx,eax
      # jge short 00417A67
      attacker = global->objects[attacker_id]
      @injured = global->objects[injured_id]
      z_distance = attacker->z - @injured->z

      # neg eax
      # cmp ecx,eax
      # mov ebx,1
      # jg short 00417A6B
      if (z_distance < itr_zwidth and
          z_distance > - itr_zwidth)
        in_z_boundary = true
      else
        # 00417A67
        # mov ebx,dword ptr ss:[esp+34]
        in_z_boundary = @in_z_boundary
      end
      # 00417A6B
      # mov ecx,dword ptr ss:[esp+10]
      # mov eax,dword ptr ds:[ecx+10]
      # push eax
      # mov eax,dword ptr ds:[ecx+C]
      # mov ecx,dword ptr ss:[esp+18]
      # push eax
      # mov eax,dword ptr ss:[esp+30]
      # push ebp
      # push edx
      # mov edx,dword ptr ss:[esp+48]
      # push edx
      # push eax
      # push ecx
      # push edi
      # call 004171C0
      # add esp,20
      # test eax,eax
      # je 00417F3E
      is_overlap = func_4171C0_is_itr_bdy_overlap(
        bdy_left_boundary, @bdy_top_boundary, @bdy_w, @bdy_h,
        itr_left_boundary, itr_top_boundary, @itr->w, @itr->h
      )

      # test ebx,ebx
      # je 00417F3E
      if !is_overlap or !in_z_boundary
        next
      end
      # mov edx,dword ptr ss:[esp+48]
      # mov eax,dword ptr ds:[esi+edx*4+194]
      # mov ecx,dword ptr ds:[eax+70]
      # mov edx,dword ptr ds:[eax+368]
      # imul ecx,ecx,178
      # xor ebp,ebp
      # cmp dword ptr ds:[ecx+edx+7AC],0C
      # jnz short 00417AE2
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id].state
      is_attack_success = bool_initial

      # mov eax,dword ptr ss:[esp+10]
      # cmp dword ptr ds:[eax+1C],28
      # jg short 00417AE2
      itr_fall = @itr->fall

      # mov eax,dword ptr ds:[eax]
      # cmp eax,0A
      itr_kind = @itr->kind

      # je short 00417AE2
      # cmp eax,0B
      # je short 00417AE2
      # mov ebp,2
      if (injured_state == falling_state and
          itr_fall <= 40 and
          itr_kind != itr_flute and
          itr_kind != itr_float)
        is_attack_success = bool_false
      end
      # 00417AE2
      # cmp dword ptr ss:[esp+4C],1
      # mov edx,dword ptr ss:[esp+1C]
      attacker_file = @attacker_file
      # jnz 00417B82
      if mode == stage_mode
        # xor ecx,ecx
        # cmp dword ptr ds:[edx+6F8],ecx
        # je short 00417B0F
        can_rescue_criminal = false
        attacker_type = attacker_file->type

        # mov eax,dword ptr ds:[edx+6F4]
        # cmp eax,0C9
        attacker_file_id = attacker_file->id

        # je short 00417B0F
        # cmp eax,0CA
        # jnz short 00417B2A

        # 00417B0F
        # mov ebx,dword ptr ss:[esp+44]
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # cmp dword ptr ds:[eax+364],5
        # je short 00417B2E
        attacker = global->objects[attacker_id]

        # 00417B2A
        # mov ebx,dword ptr ss:[esp+44]
        if (attacker_type == character_type or
            attacker_file_id == henry_arrow1_dat or
            attacker_file_id == rudolf_weapon_dat) and
            attacker->team != stage_enemy_team
          # mov ecx,1
          # jmp short 00417B2E
          can_rescue_criminal = true
        end
        # 00417B2E
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # cmp dword ptr ds:[eax+98],0
        # jge short 00417B6F
        attacker = global->objects[attacker_id]

        # mov eax,dword ptr ds:[eax+A0]
        # cmp byte ptr ds:[eax+esi+4],1
        # jnz short 00417B6F
        holder_id = attacker->holder_id
        is_holder_exists = global->is_object_exists[holder_id]

        # mov eax,dword ptr ds:[esi+eax*4+194]
        # mov edi,dword ptr ds:[eax+368]
        # cmp dword ptr ds:[edi+6F8],0
        # jnz short 00417B6F
        holder = global->objects[holder_id]
        file = holder->file
        holder_type = file->type

        # cmp dword ptr ds:[eax+364],5
        # je short 00417B6F
        # mov ecx,1
        if (attacker->weapon_type < 0 and
            is_holder_exists and
            holder_type == character_type and
            holder->team != stage_enemy_team)
          can_rescue_criminal = true
        end
        # 00417B6F
        # cmp dword ptr ss:[esp+3C],3E8
        # jl short 00417B86
        # test ecx,ecx
        # jnz short 00417B86
        # lea ebp,dword ptr ds:[ecx+2]
        # jmp short 00417B86
        if (@bdy_kind >= 1000 and
            !can_rescue_criminal)
          is_attack_success = bool_false
        end
      else
        # 00417B82
        # mov ebx,dword ptr ss:[esp+44]
      end
      # 00417B86
      # mov eax,dword ptr ss:[esp+10]
      # cmp dword ptr ds:[eax+24],0
      # jnz 00417CB4
      itr_vrest = @itr->vrest

      # mov eax,dword ptr ds:[eax]
      # cmp eax,1
      # je 00417CB4
      itr_kind = @itr->kind

      # cmp eax,2
      # je 00417CB4
      # cmp eax,7
      # je 00417CB4

      # mov eax,dword ptr ss:[esp+48]
      # mov eax,dword ptr ds:[esi+eax*4+194]
      # mov ecx,dword ptr ds:[eax+7C]
      # mov eax,dword ptr ds:[eax+368]
      # imul ecx,ecx,178
      # cmp dword ptr ds:[ecx+eax+7AC],3EC
      # jnz short 00417BF9
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id].state

      # cmp dword ptr ds:[edx+6F8],0
      # jle 00417CB4
      attacker_type = attacker_file->type

      # mov eax,dword ptr ds:[esi+ebx*4+194]
      # cmp dword ptr ds:[eax+98],0
      # jl 00417CB4
      attacker = global->objects[attacker_id]

      # 00417BF9
      # test ebp,ebp
      # jnz 00417CB4
      if (itr_vrest == 0 and
          itr_kind != itr_catch_injured and
          itr_kind != itr_pick_up_weapon and
          itr_kind != itr_rowing_pick and
          (injured_state != on_ground_state_1 or
           (attacker_type > character_type and
            attacker->weapon_type >= 0)
          ) and
          is_attack_success == bool_initial)
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # mov ecx,dword ptr ss:[esp+2C]
        # mov ecx,dword ptr ds:[ecx+10]
        # mov edi,dword ptr ds:[eax+10]
        # sub edi,ecx
        # cmp dword ptr ds:[eax+98],ebp
        # jge short 00417C3B
        attacker = global->objects[attacker_id]
        x_distance = attacker->x - @injured->x

        # mov eax,dword ptr ds:[eax+A0]
        # cmp dword ptr ss:[esp+48],eax
        # jnz short 00417C2F
        if (attacker->weapon_type < 0 and
            attacker->holder_id == injured_id)
          # mov edi,7D0
          # jmp short 00417C41
          x_distance = 2000
        else
          # 00417C2F
          # mov edx,dword ptr ds:[esi+eax*4+194]
          # mov edi,dword ptr ds:[edx+10]
          # sub edi,ecx
          holder = global->objects[holder_id]
          x_distance = holder->x - @injured->x
        end
        # 00417C3B
        # test edi,edi
        # jge short 00417C41
        # neg edi
        if x_distance < 0
          x_distance = - x_distance
        end
        # 00417C41
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # mov eax,dword ptr ds:[eax+2E8]
        # cmp edi,eax
        # jl short 00417C6F
        attacker = global->objects[attacker_id]

        # jnz 00417F3E
        # push 2
        # push 85
        # call 00417170
        # add esp,8
        # test eax,eax
        # jnz 00417F3E
        if (x_distance > attacker->attackable_distance or
            (x_distance == attacker->attackable_distance and
            func_417170_random(2) != 0))
          next
        end
        # 00417C6F
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # mov edx,dword ptr ss:[esp+48]
        # mov dword ptr ds:[eax+2E8],edi
        # mov ecx,dword ptr ds:[esi+ebx*4+194]
        # mov dword ptr ds:[ecx+280],edx
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # mov cl,byte ptr ss:[esp+18]
        # mov byte ptr ds:[eax+2D0],cl
        # mov edx,dword ptr ds:[esi+ebx*4+194]
        # mov dword ptr ds:[edx+2E4],1
        # jmp 00417F3E
        attacker = global->objects[attacker_id]
        attacker = global->objects[attacker_id]
        attacker = global->objects[attacker_id]
        attacker = global->objects[attacker_id]
        attacker->attackable_distance = x_distance
        attacker->injured_of_attack[0] = injured_id
        attacker->itr_of_attack[0] = @itr_id
        attacker->successful_attacks = 1
        next
      end
      # 00417CB4
      # mov ecx,dword ptr ds:[esi+ebx*4+194]
      # cmp dword ptr ds:[ecx+2E4],14
      # jge 00417F3E
      # test ebp,ebp
      # jnz 00417F3E
      attacker = global->objects[attacker_id]
      if (attacker->successful_attacks >= 20 or
          is_attack_success != bool_initial)
        next
      end
      # mov eax,dword ptr ss:[esp+48]
      # mov eax,dword ptr ds:[esi+eax*4+194]
      # mov edi,dword ptr ds:[eax+7C]
      # mov eax,dword ptr ds:[eax+368]
      # imul edi,edi,178
      # cmp dword ptr ds:[edi+eax+7AC],3EC
      # jnz short 00417D21
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id].state

      # cmp dword ptr ds:[edx+6F8],ebp
      # jle short 00417D07
      attacker_type = attacker_file->type

      # cmp dword ptr ds:[ecx+98],ebp
      # jge short 00417D21

      # 00417D07
      # mov edx,dword ptr ss:[esp+10]
      # mov eax,dword ptr ds:[edx]
      # cmp eax,2
      # je short 00417D21
      itr_kind = @itr->kind

      # cmp eax,7
      # je short 00417D21
      # cmp eax,0A
      # je short 00417D21
      # mov ebp,2
      if (injured_state == on_ground_state_1 and
          (attacker_type > character_type or
           attacker->weapon_type < 0
          ) and
          itr_kind != itr_pick_up_weapon and
          itr_kind != itr_rowing_pick and
          itr_kind != itr_flute)
        is_attack_success = bool_false
      end
      # 00417D21
      # mov eax,dword ptr ss:[esp+10]
      # cmp dword ptr ds:[eax],1
      # jnz short 00417D6F
      if @itr->kind == itr_catch_injured
        # mov edi,dword ptr ds:[ecx+10]
        # mov eax,dword ptr ss:[esp+2C]
        # sub edi,dword ptr ds:[eax+10]
        # jns short 00417D38
        x_distance = attacker->x - @injured->x
        if x_distance > 0
          # neg edi
          x_distance = - x_distance
        end
        # 00417D38
        # mov eax,dword ptr ds:[eax+2EC]
        # cmp edi,eax
        # jl short 00417D5E
        # jnz short 00417D57

        # push 2
        # push 86
        # call 00417170
        # add esp,8
        # test eax,eax
        # je short 00417D5E
        if (x_distance < @injured->vulnerable_distance or
            (x_distance == @injured->vulnerable_distance and
             func_417170_random(2) == 0))
          # 00417D5E
          # mov ecx,dword ptr ss:[esp+48]
          # mov edx,dword ptr ds:[esi+ecx*4+194]
          # mov dword ptr ds:[edx+2EC],edi
          injured = global->objects[injured_id]
          injured->vulnerable_distance = x_distance
        else
          # 00417D57
          # mov ebp,2
          # jmp short 00417D6F
          is_attack_success = bool_false
        end
      end
      # 00417D6F
      # mov eax,dword ptr ss:[esp+10]
      # mov edx,dword ptr ds:[eax]
      # cmp edx,4
      # jnz short 00417D92
      itr_kind = @itr->kind

      # mov ecx,dword ptr ds:[esi+ebx*4+194]
      # cmp dword ptr ds:[ecx+320],0
      # je short 00417D92
      attacker = global->objects[attacker_id]

      # cmp ebp,2
      # je short 00417D92
      # lea ebp,dword ptr ds:[edx-3]
      if (itr_kind == itr_thrown and
          attacker->thrown_injury != 0 and
          is_attack_success != bool_false)
        is_attack_success = bool_true
      end
      # 00417D92
      # cmp edx,1
      # je short 00417DA3
      # cmp edx,2
      # je short 00417E19
      # cmp edx,7
      # je short 00417E10
      # jmp short 00417E06

      # 00417DA3
      # mov eax,dword ptr ds:[esi+ebx*4+194]
      # cmp byte ptr ds:[eax+D0],0
      # je short 00417DC6
      attacker = global->objects[attacker_id]

      # mov ecx,dword ptr ss:[esp+48]
      # mov ecx,dword ptr ds:[esi+ecx*4+194]
      # mov edi,dword ptr ds:[eax+10]
      # cmp edi,dword ptr ds:[ecx+10]
      # jl short 00417DE2
      injured = global->objects[injured_id]

      # 00417DC6
      # cmp byte ptr ds:[eax+CF],0
      # je short 00417E10

      # mov ecx,dword ptr ss:[esp+48]
      # mov ecx,dword ptr ds:[esi+ecx*4+194]
      # mov eax,dword ptr ds:[eax+10]
      # cmp eax,dword ptr ds:[ecx+10]
      # jl short 00417E10
      injured = global->objects[injured_id]

      # 00417DE2
      # mov ecx,dword ptr ss:[esp+48]
      # mov eax,dword ptr ds:[esi+ecx*4+194]
      # mov ecx,dword ptr ds:[eax+70]
      # mov eax,dword ptr ds:[eax+368]
      # imul ecx,ecx,178
      # cmp dword ptr ds:[ecx+eax+7AC],10
      # jnz short 00417E10
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id]

      # cmp ebp,2
      # je short 00417E10
      if (itr_kind == itr_catch_injured and
          ((attacker->click_right and attacker->x <  injured->x) or
           (attacker->click_left  and attacker->x >= injured->x)
          ) and
          injured_state == picked_caught_state and
          is_attack_success != bool_false)
        # mov ebp,1
        is_attack_success = bool_true
      end
      if (itr_kind != itr_catch_injured and
          itr_kind != itr_pick_up_weapon and
          itr_kind != itr_rowing_pick and
          is_attack_success != bool_false)
        # mov ebp,1
        is_attack_success = bool_true
      end
      # 00417E10
      # cmp edx,2
      # jnz 00417EB5
      if itr_kind == itr_pick_up_weapon
        # 00417E19
        # mov ecx,dword ptr ds:[esi+ebx*4+194]
        # cmp dword ptr ds:[ecx+98],0
        # jnz short 00417E70
        attacker = global->objects[attacker_id]

        # cmp byte ptr ds:[ecx+D1],0
        # je 00417EB5
        # cmp byte ptr ds:[ecx+CA],0
        # jnz short 00417E70

        # mov eax,dword ptr ss:[esp+48]
        # mov eax,dword ptr ds:[esi+eax*4+194]
        # mov edi,dword ptr ds:[eax+70]
        # mov eax,dword ptr ds:[eax+368]
        # imul edi,edi,178
        # cmp dword ptr ds:[edi+eax+7AC],3EC
        # jnz short 00417E70
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        injured_state = file->frames[frame_id]

        # cmp ebp,2
        # je short 00417E70
        if (attacker->weapon_type == null and
            attacker->click_attack and
            !attacker->holding_attack and
            injured_state == on_ground_state_1 and
            is_attack_success != bool_false)
          # mov ebp,1
          is_attack_success = bool_true
        end
        # 00417E70
        # cmp byte ptr ds:[ecx+D1],0
        # je short 00417EB5
        # cmp byte ptr ds:[ecx+CA],0
        # jnz short 00417EB5

        # mov ecx,dword ptr ss:[esp+48]
        # mov eax,dword ptr ds:[esi+ecx*4+194]
        # mov edi,dword ptr ds:[eax+70]
        # mov eax,dword ptr ds:[eax+368]
        # imul edi,edi,178
        # cmp dword ptr ds:[edi+eax+7AC],7D4
        # jnz short 00417EB9
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        injured_state = file->frames[frame_id]

        # cmp ebp,2
        # je short 00417EB9
        if (attacker->click_attack and
            !attacker->holding_attack and
            injured_state == on_ground_state_2 and
            is_attack_success != bool_false)
          # mov ebp,1
          # jmp short 00417EB9
          is_attack_success = bool_true
        end
      end
      # 00417EB5
      # mov ecx,dword ptr ss:[esp+48]

      # 00417EB9
      # cmp edx,7
      # jnz short 00417EFF

      # mov eax,dword ptr ds:[esi+ebx*4+194]
      # cmp byte ptr ds:[eax+D1],0
      # je short 00417EFF
      attacker = global->objects[attacker_id]

      # cmp byte ptr ds:[eax+CA],0
      # jnz short 00417EFF

      # mov eax,dword ptr ds:[esi+ecx*4+194]
      # mov edx,dword ptr ds:[eax+70]
      # mov eax,dword ptr ds:[eax+368]
      # imul edx,edx,178
      # cmp dword ptr ds:[edx+eax+7AC],3EC
      # jnz short 00417EFF
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id]

      # cmp ebp,2
      # jnz short 00417F04

      # 00417EFF
      # cmp ebp,1
      # jnz short 00417F3E
      if ((itr_kind == itr_rowing_pick and
           attacker->click_attack and
           !attacker->holding_attack and
           injured_state == on_ground_state_1 and
           is_attack_success != bool_false
          ) or
          is_attack_success == bool_true)
        # 00417F04
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # mov edx,dword ptr ds:[eax+2E4]
        # mov dword ptr ds:[eax+edx*4+280],ecx
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # mov ecx,dword ptr ds:[eax+2E4]
        # mov dl,byte ptr ss:[esp+18]
        # mov byte ptr ds:[ecx+eax+2D0],dl
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # add dword ptr ds:[eax+2E4],1
        attacker = global->objects[attacker_id]
        attacker = global->objects[attacker_id]
        attacker = global->objects[attacker_id]
        attacks_size = attacker->successful_attacks
        attacks_size = attacker->successful_attacks
        attacker->injured_of_attack[attacks_size] = injured_id
        attacker->itr_of_attack[attacks_size] = @itr_id
        attacker->successful_attacks += 1
      end
    end
  end
end
