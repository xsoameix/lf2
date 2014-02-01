# 0x0042E100
def attack_process(attacker_id)

  # mov eax,dword ptr ds:[esi+ebx*4+194]
  # mov ecx,dword ptr ds:[eax+7C]
  # mov edx,dword ptr ds:[eax+368]
  # imul ecx,ecx,178
  # lea ecx,dword ptr ds:[ecx+edx+7A4]
  attacker = global->objects[attacker_id]
  frame_id = attacker->frame_id
  file = attacker->file
  frame = &file->frames[frame_id]

  # xor edx,edx
  attack_id = 0

  # cmp dword ptr ds:[eax+2E4],edx
  # jle 00431ABB
  if attacker->succuessful_attacks <= attack_id
    return
  end

  # fldz
  $fpu_st0 = 0

  # mov dword ptr ss:[esp+20],ecx
  # mov dword ptr ss:[esp+24],edx
  @attacker_frame = frame
  @attack_id = attack_id

  # mov eax,dword ptr ds:[esi+ebx*4+194]
  attacker = global->objects[attacker_id]

  # mov edi,dword ptr ss:[esp+20]
  attacker_frame = @attacker_frame

  # movsx ecx,byte ptr ds:[eax+edx+2D0]
  itr_id = attacker->itr_of_attack[attack_id]

  # mov edi,dword ptr ds:[edi+128]
  itrs_size = attacker_frame->itrs_size

  # sub edi,1
  itrs_size -= 1

  # mov dword ptr ss:[esp+1C],ecx
  @itr_id = itr_id

  # cmp ecx,edi
  # jg 00431AB9
  if itr_id <= itrs_size # 0x42E168

    # mov edi,dword ptr ds:[eax+edx*4+280]
    # mov eax,dword ptr ds:[esi+edi*4+194]
    # mov edx,dword ptr ds:[eax+7C]
    # mov ecx,dword ptr ds:[eax+368]
    # imul edx,edx,178
    # cmp byte ptr ds:[eax+ebx+F0],0
    # lea edx,dword ptr ds:[edx+ecx+7A4]
    # mov dword ptr ss:[esp+18],edx
    # jg 00431A9B
    injured_id = attacker->injured_of_attack[attack_id]
    injured = global->objects[injured_id]
    frame_id = injured->frame_id
    file = injured->file
    @injured_frame = &file->frames[frame_id]

    # injured's vrest <= 0
    if injured->vrest_of_objects[attacker_id] <= 0
      # mov eax,dword ptr ds:[esi+ebx*4+194]
      # cmp byte ptr ds:[eax+EB],0
      # je short 0042E1CE
      attacker = global->objects[attacker_id]

      # mov eax,dword ptr ds:[esi+edi*4+194]
      # mov ecx,dword ptr ds:[eax+368]
      # cmp dword ptr ds:[ecx+6F8],0
      # je 00431AB9
      injured = global->objects[injured_id]
      file = injured->file

      # injured is a weapon, attack, criminal or drink
      if attacker->? == 0 or not file->type == character_type
        return
      end
      # mov eax,dword ptr ds:[esi+edi*4+194]
      # mov edx,dword ptr ds:[eax+7C]
      # mov eax,dword ptr ds:[eax+368]
      # imul edx,edx,178
      # cmp dword ptr ds:[edx+eax+82C],2
      # jnz short 0042E234
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      cpoint_kind = file->frames[frame_id].cpoint_kind

      # mov ecx,dword ptr ds:[esi+edi*4+194]
      # mov edx,dword ptr ds:[ecx+90]
      # mov eax,dword ptr ds:[esi+edx*4+194]
      # cmp dword ptr ds:[eax+8C],edi
      # jnz short 0042E234
      injured = global->objects[injured_id]
      cpoint_timer_id = injured->cpoint_timer
      cpoint_timer = global->objects[cpoint_timer_id]
      cpoint_catcher_id = cpoint_timer->cpoint_catcher

      # mov edx,dword ptr ds:[ecx+90]
      # mov eax,dword ptr ds:[esi+edx*4+194]
      # mov ecx,dword ptr ds:[eax+7C]
      # mov edx,dword ptr ds:[eax+368]
      # imul ecx,ecx,178
      # cmp dword ptr ds:[ecx+edx+858],0
      # je 00431A9B
      cpoint_timer_id = injured->cpoint_timer
      cpoint_timer = global->objects[cpoint_timer_id]
      frame_id = cpoint_timer->frame_id
      file = cpoint_timer->file
      hurtable = file->frames[frame_id].hurtable

      # injured is caught, but is not hurtable
      if cpoint_kind == 2 and cpoint_catcher_id == injured_id and not hurtable == 0
        jump :label_431A9B
      else
        # mov edx,dword ptr ss:[esp+1C]
        # mov eax,dword ptr ss:[esp+20]
        # lea edx,dword ptr ds:[edx+edx*4]
        # shl edx,4
        # add edx,dword ptr ds:[eax+130]
        # cmp dword ptr ds:[edx],0
        # mov dword ptr ss:[esp+C],edx
        # jnz short 0042E29F
        itr_id = @itr_id
        attacker_frame = @attacker_frame
        itr = &attacker_frame->itrs[itr_id]
        kind = itr->kind
        @itr = itr

        # cmp dword ptr ds:[edx+2C],15
        # jnz short 0042E29F

        # mov eax,dword ptr ds:[esi+edi*4+194]
        # mov ecx,dword ptr ds:[eax+70]
        # mov eax,dword ptr ds:[eax+368]
        # imul ecx,ecx,178
        # cmp dword ptr ds:[ecx+eax+7AC],12
        # je 00431AB9
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        state = file->frames[frame_id].state

        # mov eax,dword ptr ds:[esi+edi*4+194]
        # mov ecx,dword ptr ds:[eax+70]
        # mov eax,dword ptr ds:[eax+368]
        # imul ecx,ecx,178
        # cmp dword ptr ds:[ecx+eax+7AC],13
        # je 00431AB9
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        state = file->frames[frame_id].state

        # injured is burning
        if kind == 0 and itr->effect == 21 and (state == fire_state or state == burn_run_state)
          return
        end
        # 0042E29F
        # cmp dword ptr ds:[edx],5
        # jnz 0042E37E

        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # cmp dword ptr ds:[eax+98],0
        # jge 0042E37E
        attacker = global->objects[attacker_id]

        # mov eax,dword ptr ds:[eax+A0]
        # mov ecx,dword ptr ds:[esi+eax*4+194]
        # cmp dword ptr ds:[ecx+9C],ebx
        # mov dword ptr ss:[esp+1C],eax
        # jnz 0042E37E
        holder_id = attacker->holder
        holder = global->objects[holder_id]
        @holder_id = holder_id

        # attacker is a weapon being held
        if (itr->kind == 5 and
            attacker->weapon_type < 0 and
            holder->weapon == attacker_id)
          # mov eax,ecx
          # mov ecx,dword ptr ds:[eax+7C]
          # mov eax,dword ptr ds:[eax+368]
          # imul ecx,ecx,178
          # mov ecx,dword ptr ds:[ecx+eax+88C]
          # test ecx,ecx
          # jle 0042E411
          frame_id = holder->frame_id
          file = holder->file
          attaking = file->frames[frame_id].attaking

          # cmp dword ptr ss:[esp+1C],edi
          # je 0042E411

          # attack is valid
          if attaking > 0 and not @holder_id == injured_id
            # mov eax,dword ptr ds:[edx]
            # mov dword ptr ss:[esp+28],eax
            # mov eax,dword ptr ds:[edx+4]
            # mov dword ptr ss:[esp+2C],eax
            # mov eax,dword ptr ds:[edx+8]
            # mov dword ptr ss:[esp+30],eax
            # mov eax,dword ptr ds:[edx+C]
            # mov edx,dword ptr ds:[edx+10]
            # mov dword ptr ss:[esp+38],edx
            @kind = itr->kind
            @x    = itr->x
            @y    = itr->y
            w     = itr->w
            @h    = itr->h

            # lea edx,dword ptr ds:[ecx+ecx*4]
            # mov ecx,dword ptr ds:[esi+ebx*4+194]
            # mov ecx,dword ptr ds:[ecx+368]
            # shl edx,4
            # mov dword ptr ss:[esp+34],eax
            # mov eax,5
            # lea ecx,dword ptr ds:[ecx+edx+C8]
            attacker = global->objects[attacker_id]
            file = attacker->file
            @w = w
            times = 5
            attacking_itr = &file->attaking_itrs[attaking]
            begin
              # mov edx,dword ptr ds:[ecx-4]
              # mov dword ptr ss:[esp+eax*4+28],edx
              # mov edx,dword ptr ds:[ecx]
              # mov dword ptr ss:[esp+eax*4+2C],edx
              # mov edx,dword ptr ds:[ecx+4]
              # mov dword ptr ss:[esp+eax*4+30],edx
              # mov edx,dword ptr ds:[ecx+8]
              # mov dword ptr ss:[esp+eax*4+34],edx
              # mov edx,dword ptr ds:[ecx+C]
              # mov dword ptr ss:[esp+eax*4+38],edx
              # add eax,5
              # add ecx,14
              # cmp eax,14
              # jl short 0042E344
              @remaining_attrs[times - 5]     = *(attacking_itr - 4)
              @remaining_attrs[times - 5 + 1] = *(attacking_itr)
              @remaining_attrs[times - 5 + 2] = *(attacking_itr + 4)
              @remaining_attrs[times - 5 + 3] = *(attacking_itr + 8)
              @remaining_attrs[times - 5 + 4] = *(attacking_itr + 12)
              attacking_itr += 20
              times += 5
            end while times < 20
            # mov dword ptr ss:[esp+28],0
            # jmp 0042E409
            @kind = 0

            # 0042E409
            # lea edx,dword ptr ss:[esp+28]
            # mov dword ptr ss:[esp+C],edx
            itr = &@kind
            @itr = itr
          end
        else
          # mov eax,dword ptr ds:[edx]
          # mov ecx,dword ptr ds:[edx+4]
          # mov dword ptr ss:[esp+28],eax
          # mov eax,dword ptr ds:[edx+8]
          # mov dword ptr ss:[esp+2C],ecx
          # mov ecx,dword ptr ds:[edx+C]
          # mov dword ptr ss:[esp+30],eax
          # mov eax,dword ptr ds:[edx+10]
          # mov dword ptr ss:[esp+34],ecx
          # mov ecx,dword ptr ds:[edx+14]
          # mov dword ptr ss:[esp+38],eax
          # mov eax,dword ptr ds:[edx+18]
          # mov dword ptr ss:[esp+3C],ecx
          # mov ecx,dword ptr ds:[edx+1C]
          # mov dword ptr ss:[esp+40],eax
          # mov eax,dword ptr ds:[edx+20]
          # mov dword ptr ss:[esp+44],ecx
          # mov ecx,dword ptr ds:[edx+24]
          # mov dword ptr ss:[esp+48],eax
          # mov eax,dword ptr ds:[edx+28]
          # mov dword ptr ss:[esp+4C],ecx
          # mov ecx,dword ptr ds:[edx+2C]
          # mov dword ptr ss:[esp+50],eax
          # mov eax,dword ptr ds:[edx+30]
          # mov dword ptr ss:[esp+54],ecx
          # mov ecx,dword ptr ds:[edx+34]
          # mov dword ptr ss:[esp+58],eax
          # mov eax,dword ptr ds:[edx+38]
          # mov dword ptr ss:[esp+5C],ecx
          # mov ecx,dword ptr ds:[edx+3C]
          # mov dword ptr ss:[esp+60],eax
          # mov eax,dword ptr ds:[edx+40]
          # mov dword ptr ss:[esp+64],ecx
          # mov ecx,dword ptr ds:[edx+44]
          # mov dword ptr ss:[esp+68],eax
          # mov eax,dword ptr ds:[edx+48]
          # mov dword ptr ss:[esp+6C],ecx
          # mov ecx,dword ptr ds:[edx+4C]
          # mov dword ptr ss:[esp+70],eax
          # mov dword ptr ss:[esp+74],ecx
          @kind           = itr->kind
          @x              = itr->x
          @y              = itr->y
          @w              = itr->w
          @h              = itr->h
          @dvx            = itr->dvx
          @dvy            = itr->dvy
          @fall           = itr->fall
          @arest          = itr->arest
          @vrest          = itr->vrest
          @respond        = itr->respond
          @effect         = itr->effect
          @catching_act_1 = itr->catching_act_1
          @catching_act_2 = itr->catching_act_2
          @caught_act_1   = itr->caught_act_1
          @caught_act_2   = itr->caught_act_2
          @bdefend        = itr->bdefend
          @injury         = itr->injury
          @zwidth         = itr->zwidth
          @?              = itr->?

          # 0042E409
          # lea edx,dword ptr ss:[esp+28]
          # mov dword ptr ss:[esp+C],edx
          itr = &@kind
          @itr = itr
        end
        # 0042E411
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # cmp dword ptr ds:[eax+320],0
        # jle short 0042E461
        attacker = global->objects[attacker_id]

        # cmp dword ptr ds:[edx],4
        # jnz short 0042E461

        # attacker is a man being thrown away
        if attacker->thrown_injury > 0 and itr->kind == 4
          # mov dword ptr ds:[edx],0
          # mov ecx,dword ptr ds:[esi+ebx*4+194]
          # fcom qword ptr ds:[ecx+40]
          # fstsw ax
          # test ah,5
          # jpe short 0042E446
          itr->kind = 0
          attacker = global->objects[attacker_id]

          # cmp byte ptr ds:[ecx+80],1
          # je short 0042E459

          # adjust the direction
          if (attacker->x_velocity > 0 and
              attacker->facing == facing_left)
            # 0042E459
            # mov eax,dword ptr ds:[edx+14]
            # neg eax
            # mov dword ptr ds:[edx+14],eax
            itr->dvx = -itr->dvx
          end
          # 0042E446
          # fcom qword ptr ds:[ecx+40]
          # fstsw ax
          # test ah,41
          # jnz short 0042E461

          # cmp byte ptr ds:[ecx+80],0
          # jnz short 0042E461

          # adjust the direction
          if (attacker->x_velocity < 0 and
              attacker->facing == facing_right)
            # 0042E459
            # mov eax,dword ptr ds:[edx+14]
            # neg eax
            # mov dword ptr ds:[edx+14],eax
            itr->dvx = -itr->dvx
          end
        end
        # 0042E461
        # mov eax,dword ptr ds:[esi+edi*4+194]
        # cmp dword ptr ds:[eax+98],2
        # jnz 0042E549
        injured = global->objects[injured_id]

        # cmp dword ptr ds:[edx],0
        # jnz 0042E549

        # mov ecx,dword ptr ds:[eax+9C]
        # mov eax,dword ptr ds:[esi+ecx*4+194]
        # cmp dword ptr ds:[eax+A0],edi
        # jnz 0042E549
        weapon_id = injured->weapon
        weapon = global->objects[weapon_id]

        # cmp dword ptr ds:[eax+98],-2
        # jnz 0042E549

        # injured is holding a heavy weapon
        if (injured->weapon_type == heavy_weapon_type and
            itr->kind == 0 and
            weapon->holder == injured and
            weapon->weapon_type == - heavy_weapon_type)
          # mov edx,dword ptr ds:[esi+edi*4+194]
          # fstp st
          # mov eax,dword ptr ds:[edx+9C]
          # mov ecx,dword ptr ds:[esi+ebx*4+194]
          # mov byte ptr ds:[eax+ecx+F0],2D
          # mov edx,dword ptr ds:[esi+edi*4+194]
          # xor eax,eax
          # mov dword ptr ds:[edx+98],eax
          # mov ecx,dword ptr ds:[esi+edi*4+194]
          # mov edx,dword ptr ds:[ecx+9C]
          # mov byte ptr ds:[edx+ecx+F0],1E
          # mov ecx,dword ptr ds:[esi+edi*4+194]
          # mov edx,dword ptr ds:[ecx+9C]
          # mov ecx,dword ptr ds:[esi+edx*4+194]
          # push 6
          # push 0EC
          # mov dword ptr ds:[ecx+98],eax
          # call 00417170
          injured = global->objects[injured_id]
          weapon_id = injured->weapon
          attacker = global->objects[attacker_id]
          attacker->vrest_of_objects[weapon_id] = 45
          injured = global->objects[injured_id]
          injured->weapon_type = false
          injured = global->objects[injured_id]
          weapon_id = injured->weapon
          injured->vrest_of_objects[weapon_id] = 30
          injured = global->objects[injured_id]
          weapon_id = injured->weapon
          weapon = global->objects[weapon_id]
          weapon->weapon_type = false
          frames_range = 6
          frame_id = random 236, frames_range

          # fld qword ptr ds:[448910]
          # mov edx,dword ptr ds:[esi+edi*4+194]
          # mov ecx,dword ptr ds:[edx+9C]
          # mov edx,dword ptr ds:[esi+ecx*4+194]
          # mov dword ptr ds:[edx+70],eax
          # mov eax,dword ptr ds:[esi+edi*4+194]
          # mov ecx,dword ptr ds:[eax+9C]
          # mov edx,dword ptr ds:[esi+ecx*4+194]
          # fstp qword ptr ds:[edx+48]
          # mov edx,dword ptr ss:[esp+14]
          # fldz
          # add esp,8
          injured = global->objects[injured_id]
          weapon_id = injured->weapon
          weapon = global->objects[weapon_id]
          injured->frame_id = frame_id
          injured = global->objects[injured_id]
          weapon_id = injured->weapon
          weapon = global->objects[weapon_id]
          weapon->y_velocity = -1.0
          itr = @itr
        end
        # 0042E549
        # mov eax,dword ptr ds:[esi+edi*4+194]
        # mov ecx,dword ptr ds:[eax+368]
        # cmp dword ptr ds:[ecx+6F8],2
        # jnz short 0042E57B
        injured = global->objects[injured_id]
        file = injured->file

        # injured is a heavy weapon
        if file->type == heavy_weapon_type
          # mov ecx,dword ptr ss:[esp+C]
          # mov eax,dword ptr ds:[ecx+14]
          # cdq
          # sub eax,edx
          # sar eax,1
          # mov dword ptr ds:[ecx+14],eax
          # mov eax,dword ptr ds:[ecx+18]
          # cdq
          # sub eax,edx
          # sar eax,1
          # mov dword ptr ds:[ecx+18],eax
          # mov edx,ecx
          itr = @itr
          itr->dvx = itr->dvx / 2
          itr->dvy = itr->dvy / 2
        end

        # 0042E57B
        # cmp dword ptr ds:[edx],9
        # mov dword ptr ss:[esp+1C],0
        # jnz 0042E60E

        # mov eax,dword ptr ds:[esi+edi*4+194]
        # mov ecx,dword ptr ds:[eax+368]
        # cmp dword ptr ds:[ecx+6F8],0
        # je short 0042E5E1
        injured = global->objects[injured_id]
        file = injured->file

        # mov ecx,dword ptr ds:[eax+70]
        # mov eax,dword ptr ds:[eax+368]
        # imul ecx,ecx,178
        # cmp dword ptr ds:[ecx+eax+7AC],3EA
        # je short 0042E5E1
        frame_id = injured->frame_id
        file = injured->file

        # mov eax,dword ptr ds:[esi+edi*4+194]
        # mov ecx,dword ptr ds:[eax+70]
        # mov eax,dword ptr ds:[eax+368]
        # imul ecx,ecx,178
        # cmp dword ptr ds:[ecx+eax+7AC],7D0
        # jnz short 0042E60E
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file

        # injured is a john's force field
        if (itr->kind == 9 and
            (file->type == character_type or
             file->frames[frame_id].state == throwing_state or
             file->frames[frame_id].state == in_the_sky_state_2))
          # 0042E5E1
          # mov dword ptr ds:[edx],0
          # mov ecx,dword ptr ds:[esi+edi*4+194]
          # mov eax,dword ptr ds:[ecx+368]
          # cmp dword ptr ds:[eax+6F8],0
          # jnz short 0042E61C
          itr->kind = 0
          injured = global->objects[injured_id]
          file = injured->file
          if file->type == character_type
            # mov ecx,dword ptr ds:[esi+ebx*4+194]
            # mov dword ptr ds:[ecx+2FC],0
            attacker = global->objects[attacker_id]
            attacker->hp = 0

            # mov edx,dword ptr ss:[esp+C]
            itr = @itr
          end
        end

        # 0042E60E
        # mov edx,dword ptr ds:[edx]
        # test edx,edx
        # jnz 0043056E

        # normal attack
        if itr->kind == 0
          # mov edx,dword ptr ss:[esp+C]
          itr = @itr

          # 0042E61C
          # mov ecx,dword ptr ds:[edx+40]
          # cmp ecx,64
          # mov dword ptr ss:[esp+10],ecx
          # je 0042E812
          bdefend = itr->bdefend
          @bdefend = bdefend

          # mov eax,dword ptr ss:[esp+18]
          # mov eax,dword ptr ds:[eax+8]
          # cmp eax,8
          # je 0042E812
          # cmp eax,0B
          # je 0042E812
          # cmp eax,0C
          # je 0042E812
          # cmp eax,0D
          # je 0042E812
          # cmp eax,0E
          # je 0042E812
          # cmp eax,10
          # je 0042E812
          # cmp eax,12
          # je 0042E812
          injured_frame = @injured_frame
          state = injured_frame->state

          # injured is knight, louis or julian
          if (not bdefend == 100 and
              not state == broken_defend_state and
              not state == injured_state_1 and
              not state == falling_state and
              not state == ice_state and
              not state == lying_state and
              not state == injured_state_2 and
              not state == fire_state)
            # mov eax,dword ptr ds:[esi+edi*4+194]
            # mov ecx,dword ptr ds:[eax+368]
            # mov ecx,dword ptr ds:[ecx+6F4]
            # cmp ecx,25
            # mov dword ptr ss:[esp+14],ecx
            # jnz short 0042E6EC
            injured = global->objects[injured_id]
            file = injured->file
            injured_file_id = file->id
            @injured_file_id = injured_file_id

            # cmp dword ptr ds:[eax+B8],0F
            # jg short 0042E6EC

            # mov edx,dword ptr ss:[esp+C]
            # mov ecx,dword ptr ds:[edx+2C]
            # mov eax,66666667
            # imul ecx
            # sar edx,2
            # mov eax,edx
            # shr eax,1F
            # add eax,edx
            itr = @itr
            effect = itr->effect
            effect_type = effect / 10

            # cmp eax,2
            # je short 0042E6E8
            # cmp eax,3
            # je short 0042E6E8
            # cmp ecx,2
            # je short 0042E6E8
            # cmp ecx,3
            # je short 0042E6E8

            # mov eax,dword ptr ds:[esi+ebx*4+194]
            # mov eax,dword ptr ds:[eax+368]
            # mov eax,dword ptr ds:[eax+6F4]
            # cmp eax,0D6
            # je short 0042E6E8
            attacker = global->objects[attacker_id]
            file = attacker->file
            attacker_file_id = file->id

            # cmp eax,0D0
            # jnz 0042FDF2

            # injured is knight
            if (injured_file_id == knight_dat and
                injured->bdefend <= 15 and
                not effect_type == 2 and
                not effect_type == 3 and
                not effect == 2 and
                not effect == 3 and
                not attacker_file_id == john_biscuit_dat and
                not attacker_file_id == henry_arrow2_dat)
              # 0042FDF2
            end
            # 0042E6E8
            # mov ecx,dword ptr ss:[esp+14]
            injured_file_id = @injured_file_id

            # 0042E6EC
            # cmp ecx,6
            # jnz 0042E7CE

            # mov eax,dword ptr ds:[esi+edi*4+194]
            # cmp dword ptr ds:[eax+B8],1
            # jg 0042E7CE
            injured = global->objects[injured_id]

            # mov ecx,dword ptr ss:[esp+C]
            # mov ecx,dword ptr ds:[ecx+2C]
            # mov eax,66666667
            # imul ecx
            # sar edx,2
            # mov eax,edx
            # shr eax,1F
            # add eax,edx
            itr = @itr
            effect = itr->effect
            effect_type = effect / 10

            # cmp eax,2
            # je 0042E7CE
            # cmp eax,3
            # je 0042E7CE
            # cmp ecx,2
            # je 0042E7CE
            # cmp ecx,3
            # je 0042E7CE

            # mov eax,dword ptr ds:[esi+ebx*4+194]
            # mov edx,dword ptr ds:[eax+368]
            # mov eax,dword ptr ds:[edx+6F4]
            attacker = global->objects[attacker_id]
            file = attacker->file
            attacker_file_id = file->id

            # cmp eax,0D6
            # je short 0042E7CE
            # cmp eax,0D0
            # je short 0042E7CE

            # mov eax,dword ptr ds:[esi+edi*4+194]
            # cmp dword ptr ds:[eax+70],14
            # jl 0042FDF2
            injured = global->objects[injured_id]

            # mov ecx,dword ptr ds:[eax+70]
            # mov edx,dword ptr ds:[eax+368]
            # imul ecx,ecx,178
            # cmp dword ptr ds:[ecx+edx+7AC],5
            # je 0042FDF2
            frame_id = injured->frame_id
            file = injured->file

            # mov ecx,dword ptr ds:[eax+70]
            # mov edx,dword ptr ds:[eax+368]
            # imul ecx,ecx,178
            # cmp dword ptr ds:[ecx+edx+7AC],4
            # je 0042FDF2
            frame_id = injured->frame_id
            file = injured->file

            # mov ecx,dword ptr ds:[eax+70]
            # mov edx,dword ptr ds:[eax+368]
            # imul ecx,ecx,178
            # cmp dword ptr ds:[ecx+edx+7AC],7
            # je 0042FDF2
            frame_id = injured->frame_id
            file = injured->file

            # injured is louis
            if (injured_file_id == louis_dat and
                injured->bdefend < 1 and
                not effect_type == 2 and
                not effect_type == 3 and
                not effect == 2 and
                not effect == 3 and
                not attacker_file_id == john_biscuit_dat and
                not attacker_file_id == henry_arrow2_dat and
                injured->frame_id < 20 and
                file->frames[frame_id].state == dash_state and
                file->frames[frame_id].state == jump_state and
                file->frames[frame_id].state == defend_state)
              # 0042FDF2
            end
            # 0042E7CE
            # cmp dword ptr ss:[esp+14],34
            # jnz short 0042E80A

            # mov eax,dword ptr ds:[esi+edi*4+194]
            # cmp dword ptr ds:[eax+B8],0F
            # jg short 0042E80A
            injured = global->objects[injured_id]

            # mov eax,dword ptr ds:[esi+ebx*4+194]
            # mov eax,dword ptr ds:[eax+368]
            # mov eax,dword ptr ds:[eax+6F4]
            # cmp eax,0D6
            # je short 0042E80A
            attacker = global->objects[attacker_id]
            file = attacker->file
            attacker_file_id = file->id

            # cmp eax,0D0
            # jnz 0042FDF2

            # injured is julian
            if (@injured_file_id == julian_dat and
                injured->bdefend <= 15 and
                not attacker_file_id == john_biscuit_dat and
                not attacker_file_id == henry_arrow2_dat)
              # 0042FDF2
            end
            # 0042E80A
            # mov edx,dword ptr ss:[esp+C]
            # mov ecx,dword ptr ss:[esp+10]
            itr = @itr
            bdefend = @bdefend
          end
          # 0042E812
          # mov eax,dword ptr ss:[esp+18]
          # cmp dword ptr ds:[eax+8],7
          # jnz short 0042E87D

          # cmp ecx,3C
          # jg short 0042E87D
          injured_frame = @injured_frame

          # mov eax,dword ptr ds:[esi+ebx*4+194]
          # mov al,byte ptr ds:[eax+80]
          # mov ecx,dword ptr ds:[esi+edi*4+194]
          # cmp al,byte ptr ds:[ecx+80]
          # jnz short 0042E870
          attacker = global->objects[attacker_id]
          attacker_facing = attacker->facing
          injured = global->objects[injured_id]

          # cmp dword ptr ds:[edx+14],0
          # jl short 0042E870

          # mov eax,dword ptr ds:[esi+ebx*4+194]
          # mov edx,dword ptr ds:[eax+368]
          # mov eax,dword ptr ds:[edx+6F4]
          # cmp eax,7C
          # je short 0042E870
          # cmp eax,0DC
          # je short 0042E870
          # cmp eax,0DD
          # je short 0042E870
          attacker = global->objects[attacker_id]
          file = attacker->file
          attacker_file_id = file->id

          # cmp eax,0DE
          # jnz short 0042E87D

          # 0042E870
          # cmp dword ptr ds:[ecx+2FC],0
          # jg 0042FDF2

          # can't break injured's defense
          if (injured_frame->state == defend_state and
              bdefend <= 60 and
              (
                not attacker_facing == injured->facing or
                not itr->dvx >= 0 or
                attacker_file_id == <_dat or
                attacker_file_id == jan_chase_dat or
                attacker_file_id == firzen_chasef_dat or
                attacker_file_id == firzen_chasei_dat
              ) and
              injured->hp > 0)
            # 0042FDF2
          end
          # 0042E87D
          # mov eax,dword ptr ds:[esi+edi*4+194]
          # mov dword ptr ds:[eax+B8],2D
          # mov ecx,dword ptr ds:[esi+edi*4+194]
          # mov edx,dword ptr ds:[ecx+368]
          # cmp dword ptr ds:[edx+6F4],12C
          # mov eax,ecx
          # je 00431AC4
          injured = global->objects[injured_id]
          injured->bdefend = 45
          injured = global->objects[injured_id]
          file = injured->file
          if not file->id == criminal_dat
            # mov ecx,dword ptr ds:[eax+368]
            # mov ecx,dword ptr ds:[ecx+6F8]
            # cmp ecx,6
            # mov dword ptr ss:[esp+10],ecx
            # je 0042E9F3
            file = injured->file
            type = file->type
            @injured_type = type
            if not type == drink_type
              # mov eax,dword ptr ds:[eax+340]
              # test eax,eax
              # mov edx,dword ptr ss:[esp+C]
              # mov ecx,dword ptr ds:[edx+44]
              # mov dword ptr ss:[esp+14],eax
              # jle short 0042E8E7
              armor = injured->armor_multiplier
              itr = @itr
              injury = itr->injury
              @armor = armor
              if armor > 0
                # mov eax,ecx
                # imul eax,eax,64
                # cdq
                # idiv dword ptr ss:[esp+14]
                # mov ecx,eax
                injury = injury * 100 / @armor
              end
              # 0042E8E7
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # mov edx,dword ptr ds:[eax+2FC]
              # test edx,edx
              # jle short 0042E955
              injured = global->objects[injured_id]
              hp = injured->hp

              # cmp ecx,edx
              # jl short 0042E955

              # cmp dword ptr ss:[esp+10],0
              # jnz short 0042E955

              if (hp > 0 and
                  injury >= hp and
                  @injured_type == character_type)
                # cmp dword ptr ds:[eax+2F4],-1
                # jnz short 0042E955

                # mov eax,dword ptr ds:[esi+ebx*4+194]
                # mov edx,dword ptr ds:[eax+354]
                # mov eax,dword ptr ds:[esi+edx*4+194]
                # mov edx,1
                # add dword ptr ds:[eax+358],edx
                # mov eax,dword ptr ds:[esi+edi*4+194]
                # mov eax,dword ptr ds:[eax+344]
                # test eax,eax
                # jle short 0042E955
                attacker = global->objects[attacker_id]
                owner_id = attacker->owner
                owner = global->objects[owner_id]
                owner->kills += 1
                injured = global->objects[injured_id]
                _? = injured->_?

                # cmp eax,3
                # jge short 0042E955
                if (injured->clone == not_clone and
                    _? > 0 and
                    _? < 3)
                  # mov eax,dword ptr ds:[esi+edi*4+194]
                  # mov eax,dword ptr ds:[eax+344]
                  # add dword ptr ds:[eax*4+451B60],edx
                  injured = global->objects[injured_id]
                  _? = injured->_?
                  451B60[_?] += 1
                end
              end
              # 0042E955
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # sub dword ptr ds:[eax+2FC],ecx
              # mov eax,55555555
              # imul ecx
              # sub edx,ecx
              # sar edx,1
              # mov eax,edx
              # shr eax,1F
              # add eax,edx
              # mov edx,eax
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # add dword ptr ds:[eax+300],edx
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # add dword ptr ds:[eax+34C],ecx
              # mov edx,dword ptr ds:[esi+edi*4+194]
              # mov eax,dword ptr ds:[edx+368]
              # cmp dword ptr ds:[eax+6F8],0
              # jnz short 0042E9C9
              injured = global->objects[injured_id]
              injured->hp -= injury
              injured = global->objects[injured_id]
              injured->dark_hp += injury / 6
              injured = global->objects[injured_id]
              injured->hp_lost += injury
              injured = global->objects[injured_id]
              file = injured->file

              # cmp dword ptr ds:[edx+2F4],-1
              # jnz short 0042E9C9
              if (file->type == character_type and
                  injured->clone == not_clone)
                # mov eax,dword ptr ds:[esi+ebx*4+194]
                # mov edx,dword ptr ds:[eax+354]
                # mov eax,dword ptr ds:[esi+edx*4+194]
                # add dword ptr ds:[eax+348],ecx
                attacker = global->objects[attacker_id]
                owner_id = attacker->owner
                owner = global->objects[owner_id]
                owner->total_attack += injury
              end
              # 0042E9C9
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # mov eax,dword ptr ds:[eax+344]
              # test eax,eax
              # jle short 0042E9F3
              injured = global->objects[injured_id]
              _? = injured->_?

              # cmp eax,3
              # jge short 0042E9F3
              if _? > 0 and _? < 3
                # mov edx,dword ptr ds:[esi+edi*4+194]
                # mov eax,dword ptr ds:[edx+344]
                # add dword ptr ds:[eax*4+451B68],ecx
                injured = global->objects[injured_id]
                _? = injured->_?
                451B68[_?] += injury
              end
            end
            # 0042E9F3
            # mov eax,dword ptr ds:[esi+edi*4+194]
            # cmp dword ptr ds:[eax+2FC],0
            # mov ecx,dword ptr ss:[esp+C]
            # jle short 0042EA0D
            injured = global->objects[injured_id]
            itr = @itr

            # cmp dword ptr ds:[ecx+2C],4
            # jnz short 0042EA17
            if (injured->hp <= 0 or
                itr->effect == 4)
              # 0042EA0D
              # mov dword ptr ds:[eax+B0],50
              injured->fall = 80
            end
            # 0042EA17
            # mov eax,dword ptr ds:[esi+edi*4+194]
            # mov edx,dword ptr ds:[eax+368]
            # mov eax,dword ptr ds:[edx+6F8]
            # cmp eax,1
            # je short 0042EA3E
            # cmp eax,2
            # je short 0042EA3E
            # cmp eax,4
            # je short 0042EA3E
            injured = global->objects[injured_id]
            file = injured->file
            type = file->type

            # cmp eax,6
            # jnz short 0042EA65
            if (type == lignt_weapon_type or
                type == heavy_weapon_type or
                type == throw_weapon_type or
                type == drink_type)
              # 0042EA3E
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # mov edx,dword ptr ds:[ecx+44]
              # sub dword ptr ds:[eax+31C],edx
              # cmp dword ptr ds:[ecx+40],64
              # jnz short 0042EA65
              injured = global->objects[injured_id]
              injury = itr->injury
              injured->bottle_hp -= injury
              if itr->bdefend == 100
                # mov eax,dword ptr ds:[esi+edi*4+194]
                # mov dword ptr ds:[eax+31C],-1
                injured = global->objects[injured_id]
                injured->bottle_hp = -1
              end
              # 0042EA65
              # mov edx,dword ptr ds:[esi+edi*4+194]
              # mov eax,dword ptr ds:[edx+368]
              # cmp dword ptr ds:[eax+6F8],2
              # jnz short 0042EA81
              injured = global->objects[injured_id]
              file = injured->file

              # cmp dword ptr ds:[ecx+1C],28
              # jle short 0042EA8C
              if (not file->type == heavy_weapon_type or
                  itr->fall > 40)
                # 0042EA81
                # mov eax,dword ptr ds:[esi+edi*4+194]
                # add dword ptr ds:[eax+20],1
                injured = global->objects[injured_id]
                injured->attacks += 1
              end
              # 0042EA8C
              # mov ecx,dword ptr ds:[ecx+1C]
              # test ecx,ecx
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # jnz short 0042EAA3
              fall = itr->fall
              injured = global->objects[injured_id]

              # add dword ptr ds:[eax+B0],14
              # jmp short 0042EAA9

              # 0042EAA3
              # add dword ptr ds:[eax+B0],ecx
              injured->fall += (fall == 0) ? 20 : fall

              # 0042EAA9
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # mov ecx,dword ptr ds:[eax+78]
              # mov edx,dword ptr ds:[eax+368]
              # imul ecx,ecx,178
              # cmp dword ptr ds:[ecx+edx+7AC],0D
              # je short 0042EB02
              injured = global->objects[injured_id]
              frame_id = injured->frame_id
              file = injured->file

              # mov ecx,dword ptr ds:[eax+7C]
              # mov edx,dword ptr ds:[eax+368]
              # imul ecx,ecx,178
              # cmp dword ptr ds:[ecx+edx+7AC],0C
              # je short 0042EB02
              frame_id = injured->frame_id
              file = injured->file

              # mov ecx,dword ptr ds:[eax+368]
              # mov eax,dword ptr ds:[ecx+6F8]
              # cmp eax,1
              # je short 0042EB02
              file = injured->file
              type = file->type

              # cmp eax,4
              # je short 0042EB02
              # cmp eax,6
              # je short 0042EB02
              # cmp eax,2
              # jnz short 0042EB13
              if (file->frames[frame_id].state == ice_state or
                  file->frames[frame_id].state == falling_state or
                  type == lignt_weapon_type or
                  type == throw_weapon_type or
                  type == drink_type or
                  type == heavy_weapon_type)
                # 0042EB02
                # mov edx,dword ptr ds:[esi+edi*4+194]
                # mov dword ptr ds:[edx+B0],50
                injured = global->objects[injured_id]
                injured->fall = 80
              end
              # 0042EB13
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # mov ecx,dword ptr ds:[eax+B0]
              # cmp ecx,3C
              # jle short 0042EB43
              injured = global->objects[injured_id]
              fall = injured->fall

              # mov edx,dword ptr ds:[eax+368]
              # cmp dword ptr ds:[edx+6F8],3
              # je short 0042EB43
              file = injured->file
              if (fall > 60 and
                  not file-type == attack_type)
                # mov dword ptr ds:[eax+B0],50
                # jmp 0042EC6D
                injured->fall = 80
              else
                # 0042EB43
                # cmp ecx,28
                # jle short 0042EB98

                # jle short 0042EB98
                # mov edx,dword ptr ds:[eax+368]
                # cmp dword ptr ds:[edx+6F8],3
                # je short 0042EB98
                file = injured->file
                if (fall > 40 and
                    not file->type == attack_type)
                  # mov eax,dword ptr ds:[esi+edi*4+194]
                  # mov dword ptr ds:[eax+70],0E2
                  # mov ecx,dword ptr ds:[esi+edi*4+194]
                  # mov dword ptr ds:[ecx+B0],3C
                  # mov edx,dword ptr ds:[esi+edi*4+194]
                  # cmp dword ptr ds:[edx+14],0
                  # jge 0042EC6D
                  injured = global->objects[injured_id]
                  injured->frame_id == front_injured_frame
                  injured = global->objects[injured_id]
                  injured->fall == 60
                  injured = global->objects[injured_id]
                  if injured->attacks < 0
                    # mov eax,edx
                    # mov dword ptr ds:[eax+B0],50
                    # jmp 0042EC6D
                    injured->fall = 80
                  end
                  # 0042EC6D
                else
                  # 0042EB98
                  # cmp ecx,14
                  # jle short 0042EC01
                  if fall > 20
                  else
                    # 0042EC01
                  end
                end
              end
            end
          else
            # 00431AC4
          end
        else
          # 0043056E
        end
      end
    else
    end
  end
  # 0x431AB9
end
