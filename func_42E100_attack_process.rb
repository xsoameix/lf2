# 0x0042E100
def func_42E100_attack_process(global, attacker_id)
  # push ebp
  # mov ebp,esp
  # and esp,FFFFFFF8
  # sub esp,6C
  # push ebx
  # mov ebx,dword ptr ss:[ebp+8]
  # push esi
  # mov esi,ecx
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
  # push edi

  # mov dword ptr ss:[esp+20],ecx
  # mov dword ptr ss:[esp+24],edx
  @attacker_frame = frame
  @attack_id = attack_id

  # jle 00431ABB
  # the condition of the loop below

  # fldz
  $fpu_st0 = 0

  # 00431A9B
  # mov edx,dword ptr ss:[esp+24]
  # mov eax,dword ptr ds:[esi+ebx*4+194]
  # add edx,1
  # cmp edx,dword ptr ds:[eax+2E4]
  # mov dword ptr ss:[esp+24],edx
  # jl 0042E146
  for (; @attack_id < attacker->succuessful_attacks; @attack_id++)
    # 0042E146
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
    if itr_id > itrs_size
      break
    end

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
    if injured->vrest_of_objects[attacker_id] > 0
      next
    end
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
      break
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
    if (cpoint_kind == caught_kind and
        cpoint_catcher_id == injured_id and
        hurtable == false)
      next
    end
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
      break
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
    holder_id = attacker->holder_id
    holder = global->objects[holder_id]
    @holder_id = holder_id

    # attacker is a weapon being held
    if (itr->kind == 5 and
        attacker->weapon_type < 0 and
        holder->weapon_id == attacker_id)
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
    weapon_id = injured->weapon_id
    weapon = global->objects[weapon_id]

    # cmp dword ptr ds:[eax+98],-2
    # jnz 0042E549

    # injured is holding a heavy weapon
    if (injured->weapon_type == heavy_weapon_type and
        itr->kind == 0 and
        weapon->holder_id == injured and
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
      weapon_id = injured->weapon_id
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
      frame_id = func_417170_random frames_range

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
      weapon_id = injured->weapon_id
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
    @_? = 0

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

    # attacker is a john's force field
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

      # injured is a character
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

      # check if knight can defend attack

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

      # check if louis can defend attack

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

      # check if julian can defend attack

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

      # check if injured can defend attack

      # 0042E80A
      # mov edx,dword ptr ss:[esp+C]
      # mov ecx,dword ptr ss:[esp+10]
      itr = @itr
      bdefend = @bdefend

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

      # injured can be attacked when these conditions hold:
      if (bdefend == 100 or
          state == broken_defend_state or
          state == injured_state_1 or
          state == falling_state or
          state == ice_state or
          state == lying_state or
          state == injured_state_2 or
          state == fire_state or
          (
            !(
              # knight can defend attack when these conditions hold:
              injured_file_id == knight_dat and
              injured->bdefend <= 15 and
              effect_type != 2 and
              effect_type != 3 and
              effect != 2 and
              effect != 3 and
              attacker_file_id != john_biscuit_dat and
              attacker_file_id != henry_arrow2_dat
            ) and
            !(
              # louis can defend attack when these conditions hold:
              injured_file_id == louis_dat and
              injured->bdefend < 1 and
              effect_type != 2 and
              effect_type != 3 and
              effect != 2 and
              effect != 3 and
              attacker_file_id != john_biscuit_dat and
              attacker_file_id != henry_arrow2_dat and
              (injured->frame_id < 20 or
               file->frames[frame_id].state == dash_state or
               file->frames[frame_id].state == jump_state or
               file->frames[frame_id].state == defend_state)
            ) and
            !(
              # julian can defend attack when these conditions hold:
              @injured_file_id == julian_dat and
              injured->bdefend <= 15 and
              attacker_file_id != john_biscuit_dat and
              attacker_file_id != henry_arrow2_dat
            ) and
            !(
              # injured can defend attack when these conditions hold:
              injured_frame->state == defend_state and
              bdefend <= 60 and
              (
                attacker_facing != injured->facing or
                itr->dvx < 0 or
                attacker_file_id == <_dat or
                attacker_file_id == jan_chase_dat or
                attacker_file_id == firzen_chasef_dat or
                attacker_file_id == firzen_chasei_dat
              ) and
              injured->hp > 0)))
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
        if file->id == criminal_dat
          # 00431AC4
          # mov ecx,dword ptr ds:[eax+70]
          # fstp st
          # mov edx,dword ptr ds:[eax+368]
          # add ecx,6
          # imul ecx,ecx,178
          # cmp dword ptr ds:[ecx+edx],0
          # jle short 00431ABB
          frame_id = injured->frame_id
          file = injured->file

          # mov eax,dword ptr ds:[esi+edi*4+194]
          # mov ecx,dword ptr ds:[eax+70]
          # mov edx,dword ptr ds:[eax+368]
          # imul ecx,ecx,178
          # mov eax,dword ptr ds:[ecx+edx+8D8]
          # cmp dword ptr ds:[eax],3E8
          # jle short 00431ABB
          injured = global->objects[injured_id]
          frame_id = injured->frame_id
          file = injured->file
          bdys = file->frames[frame_id].bdys

          if (file->frames[frame_id].bdys_size <= 0 or
              bdys[0].kind <= 1000)
            break
          end

          # mov ecx,dword ptr ds:[esi+edi*4+194]
          # mov dword ptr ds:[ecx+364],1
          # mov eax,dword ptr ds:[esi+edi*4+194]
          # mov edx,dword ptr ds:[eax+70]
          # mov ecx,dword ptr ds:[eax+368]
          # imul edx,edx,178
          # mov edx,dword ptr ds:[ecx+edx+8D8]
          # mov ecx,dword ptr ds:[edx]
          # sub ecx,3E8
          # mov dword ptr ds:[eax+70],ecx
          # mov edx,dword ptr ds:[esi+ebx*4+194]
          # mov dword ptr ds:[edx+B4],3
          # mov eax,dword ptr ds:[esi+edi*4+194]
          # pop edi
          # pop esi
          # mov dword ptr ds:[eax+B4],-3
          # pop ebx
          # mov esp,ebp
          # pop ebp
          # retn 4
          injured = global->objects[injured_id]
          injured->team = 1
          injured = global->objects[injured_id]
          frame_id = injured->frame_id
          file = injured->file
          bdys = file->frames[frame_id].bdys
          kind = bdys[0].kind
          injured->frame_id = kind - 1000
          attacker = global->objects[attacker_id]
          attacker->shaking = -3
          return
        end
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

          # injured wears the armor
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

          # attacter's kills + 1
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

          # attacker's total attack is increasing
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

        # set the injured's fall

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

        # weapons and drinks are destroyed by bdefend 100
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
          injured->drink_hp -= injury
          if itr->bdefend == 100
            # mov eax,dword ptr ds:[esi+edi*4+194]
            # mov dword ptr ds:[eax+31C],-1
            injured = global->objects[injured_id]
            injured->drink_hp = -1
          end
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

        # increase injured's fall
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

        # set weapons' and some states' fall to 80
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

        # adjust injured's fall and set injured's frame
        if (fall > 60 and
            not file->type == attack_type)
          # mov dword ptr ds:[eax+B0],50
          # jmp 0042EC6D
          injured->fall = 80

          # 0042EB43
          # cmp ecx,28
          # jle short 0042EB98

          # jle short 0042EB98
          # mov edx,dword ptr ds:[eax+368]
          # cmp dword ptr ds:[edx+6F8],3
          # je short 0042EB98
          file = injured->file
        elsif (fall > 40 and
               not file->type == attack_type)
          # mov eax,dword ptr ds:[esi+edi*4+194]
          # mov dword ptr ds:[eax+70],0E2
          # mov ecx,dword ptr ds:[esi+edi*4+194]
          # mov dword ptr ds:[ecx+B0],3C
          # mov edx,dword ptr ds:[esi+edi*4+194]
          # cmp dword ptr ds:[edx+14],0
          # jge 0042EC6D
          injured = global->objects[injured_id]
          injured->frame_id == back_injured_frame
          injured = global->objects[injured_id]
          injured->fall == 60
          injured = global->objects[injured_id]

          # injured is in the sky, so set its fall to 80
          if injured->y < 0
            # mov eax,edx
            # mov dword ptr ds:[eax+B0],50
            # jmp 0042EC6D
            injured->fall = 80
          end
          # 0042EB98
          # cmp ecx,14
          # jle short 0042EC01

          # mov edx,dword ptr ds:[eax+368]
          # cmp dword ptr ds:[edx+6F8],3
          # je short 0042EC01
          file = injured->file
        elsif (fall > 20 and
               not file->type == attack_type)
          # mov dl,byte ptr ds:[eax+80]
          # mov ecx,dword ptr ds:[esi+ebx*4+194]
          # xor eax,eax
          # cmp dl,byte ptr ds:[ecx+80]
          # mov ecx,dword ptr ds:[esi+edi*4+194]
          # sete al
          # lea eax,dword ptr ds:[eax+eax+DE]
          # mov dword ptr ds:[ecx+70],eax
          # mov edx,dword ptr ds:[esi+edi*4+194]
          # mov dword ptr ds:[edx+B0],28
          # mov eax,dword ptr ds:[esi+edi*4+194]
          # cmp dword ptr ds:[eax+14],0
          # jge short 0042EC6D
          facing = injured->facing
          attacker = global->objects[attacker_id]
          injured = global->objects[injured_id]
          injured->frame_id = (facing == attacker->facing ?
                               back_injured_frame :
                               front_injured_frame)
          injured = global->objects[injured_id]
          injured->fall = 40
          injured = global->objects[injured_id]

          # injured is in the sky, so set its fall to 80
          if injured->y < 0
            # mov ecx,eax
            # mov dword ptr ds:[ecx+B0],50
            # jmp short 0042EC6D
            injured->fall = 80
          end

          # 0042EC01
          # test ecx,ecx
          # jle short 0042EC6D

          # mov edx,dword ptr ds:[eax+368]
          # cmp dword ptr ds:[edx+6F8],3
          # je short 0042EC6D
          file = injured->file
        elsif (fall > 0 and
               not file->type == attack_type)
          # mov eax,dword ptr ds:[esi+edi*4+194]
          # mov dword ptr ds:[eax+70],0DC
          # mov ecx,dword ptr ds:[esi+edi*4+194]
          # mov dword ptr ds:[ecx+B0],14
          # mov edx,dword ptr ds:[esi+edi*4+194]
          # cmp dword ptr ds:[edx+14],0
          # jge short 0042EC6D
          injured = global->objects[injured_id]
          injured->frame_id = slightly_injured_frame
          injured = global->objects[injured_id]
          injured->fall = 20
          injured = global->objects[injured_id]

          # injured is in the sky, so set its frame to injured frame
          if injured->y < 0
            # mov ecx,dword ptr ds:[esi+ebx*4+194]
            # mov eax,edx
            # mov dl,byte ptr ds:[eax+80]
            # xor eax,eax
            # cmp dl,byte ptr ds:[ecx+80]
            # sete al
            # lea eax,dword ptr ds:[eax+eax+DE]
            # mov ecx,eax
            # mov eax,dword ptr ds:[esi+edi*4+194]
            # mov dword ptr ds:[eax+70],ecx
            attacker = global->objects[attacker_id]
            facing = injured->facing
            offset = facing == attacker->facing ? 1 : 0
            injured = global->objects[injured_id]
            injured->frame_id = (facing == attacker->facing ?
                                 back_injured_frame :
                                 front_injured_frame)
          end
        end
        # 0042EC6D
        # mov ecx,dword ptr ds:[esi+ebx*4+194]
        # mov eax,dword ptr ds:[ecx+368]
        # cmp dword ptr ds:[eax+6F8],3
        # jnz short 0042EC9F
        attacker = global->objects[attacker_id]
        file = attacker->file

        # mov eax,dword ptr ds:[eax+AC]
        # cmp eax,-1
        # jle short 0042EC9F
        _? = file->_?
        if (file->type == attack_type and
            _? > -1)
          # mov edx,dword ptr ds:[ecx+10]
          # fstp st
          # push eax
          # push edx
          # call 00416FB0
          # fldz
          # add esp,8
          func_416FB0 attacker->x, _?
        end
        # 0042EC9F
        # mov eax,dword ptr ds:[esi+edi*4+194]
        # mov edx,dword ptr ds:[eax+368]
        # mov ecx,dword ptr ds:[edx+6F8]
        # test ecx,ecx
        # jnz 0042ED48
        injured = global->objects[injured_id]
        file = injured->file
        type = file->type
        if type == character_type
          # mov ecx,dword ptr ss:[esp+C]
          # cmp dword ptr ds:[ecx+2C],0
          # jnz short 0042ECF4
          itr = @itr
          if itr->effect == 0
            # mov ecx,dword ptr ds:[eax+B0]
            # fstp st
            # cmp ecx,50
            # jnz short 0042ECD9
            fall = injured->fall
            args = Array.new 2
            if fall == 80
              # mov edx,dword ptr ds:[eax+10]
              # push 2
              # push edx
              # jmp short 0042ECEA
              args = [injured->x, 2]
            else
              # 0042ECD9
              # cmp ecx,3C
              # push 0
              # jnz short 0042ECE6
              args[1] = 0
              if fall == 60
                # mov eax,dword ptr ds:[eax+10]
                # push eax
                # jmp short 0042ECEA
                args[0] = injured->x
              else
                # 0042ECE6
                # mov ecx,dword ptr ds:[eax+10]
                # push ecx
                args[0] = injured->x
              end
            end
            # 0042ECEA
            # call 00417090
            # fldz
            # add esp,8
            func_417090 args
          end
          # 0042ECF4
          # mov edx,dword ptr ss:[esp+C]
          # cmp dword ptr ds:[edx+2C],1
          # jnz short 0042ED77
          itr = @itr
          if itr->effect == 1
            # mov eax,dword ptr ds:[esi+edi*4+194]
            # fstp st
            # mov ecx,dword ptr ds:[eax+B0]
            # cmp ecx,50
            # mov eax,dword ptr ds:[eax+10]
            # mov dword ptr ss:[esp+1C],1
            # jnz short 0042ED3C
            injured = global->objects[injured_id]
            fall = injured->fall
            x = injured->x
            @_? = 1
            arg = nil
            if fall == 80
              # push 0C
              # push eax
              # call 00417090
              # push 2
              func_417090 x, 12
              arg = 2
            else
              # 0042ED3C
              # push 0B
              # push eax
              # call 00417090
              # push 0
              # jmp short 0042ED27
              func_417090 x, 11
              arg = 0
            end
            # 0042ED27
            # mov ecx,dword ptr ds:[esi+edi*4+194]
            # mov edx,dword ptr ds:[ecx+10]
            # push edx
            # call 00417090
            # add esp,10
            # jmp short 0042ED75
            injured = global->objects[injured_id]
            func_417090 injured->x, arg

            # 0042ED75
            # fldz
          end
        else
          # 0042ED48
          # jle short 0042ED77

          # cmp dword ptr ds:[edx+A4],-1
          # jle short 0042ED77
          if (type > character_type and
              file->_? > -1)
            # mov eax,dword ptr ds:[esi+edi*4+194]
            # fstp st
            # mov ecx,dword ptr ds:[eax+368]
            # mov edx,dword ptr ds:[ecx+A4]
            # mov eax,dword ptr ds:[eax+10]
            # push edx
            # push eax
            # call 00416FB0
            # add esp,8
            injured = global->objects[injured_id]
            file = injured->file
            _? = file->_?
            func_416FB0 injured->x, _?

            # 0042ED75
            # fldz
          end
        end
        # set the injured's pic_x_gain

        # 0042ED77
        # mov ecx,dword ptr ds:[esi+edi*4+194]
        # cmp dword ptr ds:[ecx+B0],50
        # jnz 0042EE22

        # fld qword ptr ds:[449048]
        # fcom qword ptr ds:[ecx+40]
        # fstsw ax
        # test ah,41
        # jnz 0042EE20
        injured = global->objects[injured_id]

        # fld qword ptr ds:[448308]
        # fcomp qword ptr ds:[ecx+40]
        # fstsw ax
        # test ah,5
        # jpe short 0042EE20

        # mov ecx,dword ptr ss:[esp+C]
        # cmp dword ptr ds:[ecx+14],0
        # jnz short 0042EE20
        itr = @itr
        if (injured->fall != 80 and
            # 0042EE20
            # fstp st
            injured->x_velocity < 5.0 and
            injured->x_velocity > -5.0 and
            itr->dvx != 0)
          # mov eax,dword ptr ds:[esi+ebx*4+194]
          # mov edx,dword ptr ds:[eax+70]
          # mov ecx,dword ptr ds:[eax+368]
          # imul edx,edx,178
          # cmp dword ptr ds:[edx+ecx+7AC],7D0
          # jnz short 0042EDF4
          attacker = global->objects[attacker_id]
          frame_id = attacker->frame_id
          file = attacker->file
          if file->frames[frame_id].state == in_the_sky_state_2
            # mov edx,dword ptr ds:[eax+10]
            # mov eax,dword ptr ds:[esi+edi*4+194]
            # fadd qword ptr ds:[eax+28]
            # cmp edx,dword ptr ds:[eax+10]
            # fstp qword ptr ds:[eax+28]
            # jmp 0042F0A9
            x = attacker->x
            injured = global->objects[injured_id]
            injured->pic_x_gain += 5.0
            x == injured->pic_x_gain - 5.0
          else
            # 0042EDF4
            # movsx eax,byte ptr ds:[eax+80]
            # mov ecx,dword ptr ds:[esi+edi*4+194]
            # add eax,eax
            # mov edx,1
            # sub edx,eax
            # mov dword ptr ss:[esp+18],edx
            # fild dword ptr ss:[esp+18]
            # fmulp st(1),st
            # fadd qword ptr ds:[ecx+28]
            # fstp qword ptr ds:[ecx+28]
            # jmp 0042F0A9
            facing = attacker->facing
            injured = global->objects[injured_id]
            injured->pic_x_gain += (1 - facing * 2).to_f * 5.0
          end
        elsif (
          # 0042EE22
          # mov ecx,dword ptr ds:[esi+ebx*4+194]
          # mov eax,dword ptr ds:[ecx+70]
          # mov edx,dword ptr ds:[ecx+368]
          # imul eax,eax,178
          # cmp dword ptr ds:[eax+edx+7AC],7D0
          # jnz short 0042EE78
          attacker = global->objects[attacker_id]
          frame_id = attacker->frame_id
          file = attacker->file
          file->frames[frame_id].state == in_the_sky_state_2
        )
          # mov ecx,dword ptr ds:[ecx+10]
          # mov eax,dword ptr ds:[esi+edi*4+194]
          # cmp ecx,dword ptr ds:[eax+10]
          # jge short 0042EE66
          injured = global->objects[injured_id]
          if attacker->x < injured->x
            # mov edx,dword ptr ss:[esp+C]
            # fild dword ptr ds:[edx+14]

            # 0042EE5B
            # fadd qword ptr ds:[eax+28]
            # fstp qword ptr ds:[eax+28]
            # jmp 0042F0A9
            itr = @itr
            injured->pic_x_gain += itr->dvx.to_f
          else
            # 0042EE66
            # mov ecx,dword ptr ss:[esp+C]
            # fild dword ptr ds:[ecx+14]
            # fsubr qword ptr ds:[eax+28]
            # fstp qword ptr ds:[eax+28]
            # jmp 0042F0A9
            itr = @itr
            injured->pic_x_gain -= itr->dvx.to_f
          end
        elsif (
          # 0042EE78
          # mov edx,dword ptr ds:[esi+edi*4+194]
          # mov eax,dword ptr ds:[edx+368]
          # mov eax,dword ptr ds:[eax+6F8]
          # cmp eax,4
          # je 0042EF18
          injured = global->objects[injured_id]
          file = injured->file
          type = file->type

          # cmp eax,6
          # je short 0042EF18
          (not type == throw_weapon_type and
           not type == drink_type)
        )
          # mov edx,dword ptr ss:[esp+C]
          # mov eax,dword ptr ds:[edx+2C]
          # cmp eax,16
          # je short 0042EEF0
          itr = @itr
          effect = itr->effect

          # cmp eax,17
          # je short 0042EEF0
          if (effect == 22 or effect == 23)
            # 0042EEF0
            # mov eax,dword ptr ds:[esi+edi*4+194]
            # fild dword ptr ds:[edx+14]
            # mov eax,dword ptr ds:[eax+10]
            # cmp eax,dword ptr ds:[ecx+10]
            # mov eax,dword ptr ds:[esi+edi*4+194]
            # jle 0042EE5B
            injured = global->objects[injured_id]
            injured = global->objects[injured_id]
            if injured->x <= attacker->x
              # 0042EE5B
              # fadd qword ptr ds:[eax+28]
              # fstp qword ptr ds:[eax+28]
              # jmp 0042F0A9
              itr = @itr
              injured->pic_x_gain += itr->dvx.to_f
            else
              # fsubr qword ptr ds:[eax+28]
              # fstp qword ptr ds:[eax+28]
              # jmp 0042F0A9
              injured->pic_x_gain -= itr->dvx.to_f
            end
          else
            # cmp byte ptr ds:[ecx+80],0
            # jnz short 0042EEC3
            if attacker->facing == facing_right
              # fild dword ptr ds:[edx+14]
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # fadd qword ptr ds:[eax+28]
              # fstp qword ptr ds:[eax+28]
              injured = global->objects[injured_id]
              injured->pic_x_gain += itr->dvx.to_f
            end
            # 0042EEC3
            # mov ecx,dword ptr ds:[esi+ebx*4+194]
            # cmp byte ptr ds:[ecx+80],1
            # jnz 0042F0A9
            attacker = global->objects[attacker_id]
            if attacker->facing == facing_left
              # mov edx,dword ptr ss:[esp+C]
              # fild dword ptr ds:[edx+14]
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # fsubr qword ptr ds:[eax+28]
              # fstp qword ptr ds:[eax+28]
              # jmp 0042F0A9
              itr = @itr
              injured = global->objects[injured_id]
              injured->pic_x_gain -= itr->dvx.to_f
            end
          end
        else
          # 0042EF18
          # mov eax,dword ptr ds:[esi+edi*4+194]
          # fld qword ptr ds:[eax+40]
          # fld qword ptr ds:[449AF8]
          # fmul st(1),st
          # fxch st(2)
          # fcom qword ptr ds:[eax+40]
          # fstsw ax
          # test ah,41
          # jnz short 0042EF41

          # illustration of stack:
          # [0]
          # [0 v 0.55]
          # [0 (v * 0.55) 0.55]
          # [0.55 (v * 0.55) 0]
          injured = global->objects[injured_id]
          if injured->x_velocity < 0
            # fstp st(1)
            # fld qword ptr ds:[edx+40]
            # fmul st,st(2)
            # fchs
            # fxch st(1)

            # illustration of stack:
            # [0.55 0]
            # [0.55 0 v]
            # [0.55 0 (v * 0.55)]
            # [0.55 0 -(v * 0.55)]
            # [0.55 -(v * 0.55) 0]
          end
          # 0042EF41
          # mov edx,dword ptr ss:[esp+C]
          # fild dword ptr ds:[edx+14]
          # fcom st(2)
          # fstsw ax
          # fstp st(2)
          # test ah,41
          # je short 0042EFC6

          # illustration of stack:
          # [0.55 |v * 0.55| 0]
          # [0.55 |v * 0.55| 0 dvx]
          # [0.55 dvx 0]
          itr = @itr

          # mov dl,byte ptr ds:[ecx+80]
          # test dl,dl
          # jnz short 0042EF6E

          # mov eax,dword ptr ds:[esi+edi*4+194]
          # fcom qword ptr ds:[eax+28]
          # fstsw ax
          # test ah,5
          # jpo short 0042EFC6
          injured = global->objects[injured_id]

          # 0042EF6E
          # cmp dl,1
          # jnz short 0042EF84

          # mov eax,dword ptr ds:[esi+edi*4+194]
          # fcom qword ptr ds:[eax+28]
          # fstsw ax
          # test ah,41
          # je short 0042EFC6
          injured = global->objects[injured_id]
          if (itr->dvx.to_f > injured->x_velocity.abs * 0.55 or
              attacker->facing == facing_right and injured->pic_x_gain > 0 or
              attacker->facing == facing_left  and injured->pic_x_gain < 0)
            # 0042EFC6
            # cmp byte ptr ds:[ecx+80],0
            # fstp st(2)
            # jnz short 0042EFE0

            # illustration of stack:
            # [0.55 dvx 0]
            # [0 dvx]
            if attacker->facing == facing_right
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # fadd qword ptr ds:[eax+28]
              # fstp qword ptr ds:[eax+28]
              # jmp short 0042EFE2

              # illustration of stack:
              # [0 dvx]
              # [0]
              injured = global->objects[injured_id]
              injured->pic_x_gain += itr->dvx.to_f
            else
              # 0042EFE0
              # fstp st

              # illustration of stack:
              # [0 dvx]
              # [0]
            end
            # 0042EFE2
            # mov eax,dword ptr ds:[esi+ebx*4+194]
            # cmp byte ptr ds:[eax+80],1
            # jnz short 0042F00A
            attacker = global->objects[attacker_id]
            if attacker->facing == facing_left
              # mov ecx,dword ptr ss:[esp+C]
              # fild dword ptr ds:[ecx+14]
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # fsubr qword ptr ds:[eax+28]
              # fstp qword ptr ds:[eax+28]
              # jmp short 0042F00A
              itr = @itr
              injured = global->objects[injured_id]
              injured->pic_x_gain -= itr->dvx.to_f
            end
          else
            # 0042EF84
            # cmp dl,1
            # fstp st(1)
            # jnz short 0042EF9C

            # illustration of stack:
            # [0.55 dvx 0]
            # [0.55 0]

            # mov eax,dword ptr ds:[esi+edi*4+194]
            # fcom qword ptr ds:[eax+40]
            # fstsw ax
            # test ah,5
            # jpo short 0042EFB1

            # 0042EF9C
            # test dl,dl
            # jnz short 0042F008

            # mov eax,dword ptr ds:[esi+edi*4+194]
            # fcom qword ptr ds:[eax+40]
            # fstsw ax
            # test ah,41
            # jnz short 0042F008
            if (attacker->facing == facing_left  and injured->x_velocity > 0 or
                attacker->facing == facing_right and injured->x_velocity < 0)
              # 0042EFB1
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # fld qword ptr ds:[eax+40]
              # fmulp st(2),st
              # fxch st(1)
              # fchs
              # fstp qword ptr ds:[eax+28]
              # jmp short 0042F00A

              # illustration of stack:
              # [0.55 0]
              # [0.55 0 v]
              # [(v * 0.55) 0]
              # [0 (v * 0.55)]
              # [0 -(v * 0.55)]
              # [0]
              injured = global->objects[injured_id]
              injured->pic_x_gain = - injured->x_velocity * 0.55
            else
              # 0042F008
              # fstp st(1)

              # illustration of stack:
              # [0.55 0]
              # [0]
            end
          end
          # 0042F00A
          # mov eax,dword ptr ds:[esi+ebx*4+194]
          # mov edx,dword ptr ds:[eax+368]
          # cmp dword ptr ds:[edx+6F4],64
          # jnz 0042F0A9
          attacker = global->objects[attacker_id]
          file = attacker->file

          # cmp dword ptr ds:[eax+98],0
          # jge short 0042F0A9

          # attacker is a stick and being held
          if (file->id == stick_dat and
              attacker->weapon_type < 0)

            # mov eax,dword ptr ds:[esi+edi*4+194]
            # fstp st
            # fld qword ptr ds:[eax+28]
            # push 0D
            # fmul qword ptr ds:[449278]
            # fstp qword ptr ds:[eax+28]
            # mov eax,dword ptr ds:[esi+edi*4+194]
            # mov ecx,dword ptr ds:[eax+10]
            # push ecx
            # call 00417090
            # fldz
            # mov ecx,dword ptr ds:[esi+edi*4+194]
            # fcom qword ptr ds:[ecx+28]
            # add esp,8
            # fstsw ax
            # test ah,5
            # jpe short 0042F081
            injured = global->objects[injured_id]
            args = Array.new 2
            args[1] = 13
            injured->pic_x_gain *= 2.5
            injured = global->objects[injured_id]
            args[0] = injured->x
            func_417090 args
            injured = global->objects[injured_id]

            # fld qword ptr ds:[447A00]
            # fcom qword ptr ds:[ecx+28]
            # fstsw ax
            # test ah,41
            # jnz short 0042F07F
            if (injured->pic_x_gain > 0 and
                injured->pic_x_gain < 10.0)
              # fstp qword ptr ds:[ecx+28]
              # jmp short 0042F081
              injured->pic_x_gain = 10.0
            else
              # 0042F07F
              # fstp st
            end

            # 0042F081
            # mov ecx,dword ptr ds:[esi+edi*4+194]
            # fcom qword ptr ds:[ecx+28]
            # fstsw ax
            # test ah,41
            # jnz short 0042F0A9
            injured = global->objects[injured_id]

            # fld qword ptr ds:[4482F8]
            # fcom qword ptr ds:[ecx+28]
            # fstsw ax
            # test ah,5
            # jpe short 0042F0A7

            if (injured->pic_x_gain < 0 and
                injured->pic_x_gain > -10.0)
              # fstp qword ptr ds:[ecx+28]
              # jmp short 0042F0A9
              injured->pic_x_gain = -10.0
            else
              # 0042F0A7
              # fstp st
            end
          end
        end

        # if attacker is flying, goto hitting_frame (10)

        # 0042F0A9
        # mov edx,dword ptr ds:[esi+ebx*4+194]
        # mov eax,dword ptr ds:[edx+70]
        # mov ecx,dword ptr ds:[edx+368]
        # imul eax,eax,178
        # cmp dword ptr ds:[eax+ecx+7AC],0BB8
        # jnz 0042F183
        attacker = global->objects[attacker_id]
        frame_id = attacker->frame_id
        attacker_file = attacker->file

        # mov eax,dword ptr ds:[esi+edi*4+194]
        # mov eax,dword ptr ds:[eax+368]
        injured = global->objects[injured_id]
        injured_file = injured->file

        # cmp dword ptr ds:[eax+6F8],0
        # je short 0042F141
        # cmp dword ptr ds:[ecx+6F4],0D1
        # jnz short 0042F141
        # mov eax,dword ptr ds:[eax+6F4]
        injured_file_id = injured_file->id

        # cmp eax,0C8
        # je 0042F183
        # cmp eax,0CB
        # je short 0042F183
        # cmp eax,0CD
        # je short 0042F183
        # cmp eax,0CE
        # je short 0042F183
        # cmp eax,0CF
        # je short 0042F183
        # cmp eax,0D7
        # je short 0042F183
        # cmp eax,0D8
        # je short 0042F183
        # cmp eax,0D1
        # jnz short 0042F141
        # mov eax,dword ptr ds:[esi+edi*4+194]
        injured = global->objects[injured_id]

        # cmp dword ptr ds:[eax+70],28
        # je short 0042F183

        if (attacker_file->frames[frame_id].state == flying_state and
            # flying object attack character
            (injured_file->type == character_type or
             # flying object(not freeze bal) attack the one not being character
             attacker_file->id != freeze_ball_dat or
             # flying freeze ball attack the one not being these objects
             (injured_file_id != john_ball_dat and
              injured_file_id != deep_ball_dat and
              injured_file_id != dennis_ball_dat and
              injured_file_id != woody_ball_dat and
              injured_file_id != davis_ball_dat and
              injured_file_id != dennis_chase_dat and
              injured_file_id != jack_ball_dat and
              (injured_file_id != freeze_ball_dat or
               # flying freeze ball attack the freeze ball not being rebounding
               injured->frame_id != rebounding_frame))))
          # 0042F141
          # mov dword ptr ds:[edx+70],0A
          # mov ecx,dword ptr ds:[esi+ebx*4+194]
          # mov dword ptr ds:[ecx+88],0
          # mov edx,dword ptr ds:[esi+ebx*4+194]
          # fst qword ptr ds:[edx+40]
          # mov eax,dword ptr ds:[esi+ebx*4+194]
          # mov ecx,dword ptr ds:[eax+70]
          # mov edx,dword ptr ds:[eax+368]
          # imul ecx,ecx,178
          # fild dword ptr ds:[ecx+edx+7BC]
          # fstp qword ptr ds:[eax+50]
          attacker->frame_id = hitting_frame
          attacker = global->objects[attacker_id]
          attacker->wait_counter = 0
          attacker = global->objects[attacker_id]
          attacker->x_velocity = 0
          attacker = global->objects[attacker_id]
          frame_id = attacker->frame_id
          file = attacker->file
          attacker->z_velocity = file->frames[frame_id].dvy
        end
        # 0042F183
        # mov eax,dword ptr ds:[esi+edi*4+194]
        # cmp dword ptr ds:[eax+B0],50
        # jnz 0042F2A7
        injured = global->objects[injured_id]
        if injured->fall == 80
          # mov edx,dword ptr ss:[esp+C]
          # mov ecx,dword ptr ds:[edx+18]
          # test ecx,ecx
          # mov eax,dword ptr ds:[eax+368]
          # mov eax,dword ptr ds:[eax+6F8]
          # mov dword ptr ss:[esp+18],ecx
          # je short 0042F1FB
          itr = @itr
          dvy = itr->dvy
          file = injured->file
          type = file->type
          @dvy = dvy
          if dvy == 0
            # 0042F1FB
            # cmp eax,2
            # je short 0042F205
            # cmp eax,3
            # jnz short 0042F20B

            # 0042F205
            # cmp dword ptr ds:[edx+1C],28
            # jle short 0042F21E
            if ((type != heavy_weapon_type and
                 type != attack_type) or
                 itr->fall > 40)
              # 0042F20B
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # fld qword ptr ds:[eax+30]
              # fsub qword ptr ds:[447A50]
              # fstp qword ptr ds:[eax+30]
              injured = global->objects[injured_id]
              injured->y_accl -= 7.0
            end
          else
            # cmp eax,2
            # je short 0042F1BC
            # cmp eax,3
            # jnz short 0042F1C2

            # 0042F1BC
            # cmp dword ptr ds:[edx+1C],28
            # jle short 0042F1D3
            if ((type != heavy_weapon_type and
                 type != attack_type) or
                 itr->fall > 40)
              # 0042F1C2
              # fild dword ptr ss:[esp+18]
              # mov eax,dword ptr ds:[esi+edi*4+194]
              # fadd qword ptr ds:[eax+30]
              # fstp qword ptr ds:[eax+30]
              injured = global->objects[injured_id]
              injured->y_accl += @dvy
            end
            # 0042F1D3
            # mov eax,dword ptr ds:[esi+edi*4+194]
            # fild dword ptr ds:[eax+14]
            # fadd qword ptr ds:[eax+30]
            # call __ftol2_sse
            # test eax,eax
            # jle short __fto12_sse
            injured = global->objects[injured_id]
            if __ftol2_sse(injured->y + injured->y_accl) > 0
              # mov ecx,dword ptr ds:[esi+edi*4+194]
              # fld qword ptr ds:[448338]
              # fstp qword ptr ds:[ecx+30]
              # jmp short 0042F21E
              injured = global->objects[injured_id]
              injured->y_accl = 12.0
            end
          end
          # 0042F21E
          # mov ecx,dword ptr ds:[esi+edi*4+194]
          # mov dl,byte ptr ds:[ecx+80]
          # test dl,dl
          # jnz short 0042F239
          injured = global->objects[injured_id]

          # fcom qword ptr ds:[ecx+28]
          # fstsw ax
          # test ah,1
          # je short 0042F248

          # 0042F239
          # cmp dl,1
          # jnz short 0042F251

          # fcom qword ptr ds:[ecx+28]
          # fstsw ax
          # test ah,41
          # jpe short 0042F251
          if ((injured->facing == facing_right and injured->pic_x_gain <= 0) or
              (injured->facing == facing_left and injured->pic_x_gain >= 0))
            # 0042F248
            # mov dword ptr ds:[ecx+70],0B4
            # jmp short 0042F258
            injured->frame_id = falling_back_frame
          else
            # 0042F251
            # mov dword ptr ds:[ecx+70],0BA
            injured->frame_id = falling_front_frame
          end
          # 0042F258
          # mov eax,dword ptr ds:[esi+edi*4+194]
          injured = global->objects[injured_id]

          # cmp dword ptr ds:[eax+98],0
          # jle short 0042F2A7

          # mov ecx,dword ptr ds:[eax+9C]
          # mov edx,dword ptr ds:[esi+ecx*4+194]
          weapon_id = injured->weapon_id
          weapon = global->objects[weapon_id]

          # cmp edi,dword ptr ds:[edx+A0]
          # jnz short 0042F2A7
          if (injured->weapon_type > 0 and
              injured_id == weapon->holder_id)
            # mov ecx,dword ptr ds:[eax+9C]
            # mov edx,dword ptr ds:[esi+ebx*4+194]
            # mov byte ptr ds:[ecx+edx+F0],2D
            # mov eax,dword ptr ds:[esi+edi*4+194]
            # mov ecx,dword ptr ds:[eax+9C]
            # mov byte ptr ds:[ecx+eax+F0],1E
            weapon_id = injured->weapon_id
            attacker = global->objects[attacker_id]
            attacker->vrest_of_objects[weapon_id] = 45
            injured = global->objects[injured_id]
            weapon_id = injured->weapon_id
            injured->vrest_of_objects[weapon_id] = 30
          end
        end
        # 0042F2A7
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # cmp dword ptr ds:[eax+B4],0
        # jl short 0042F2C1
        attacker = global->objects[attacker_id]
        if attacker->shaking >= 0
          # mov dword ptr ds:[eax+B4],3
          attacker->shaking = 3
        end
        # 0042F2C1
        # mov edx,dword ptr ds:[esi+edi*4+194]
        # mov ecx,dword ptr ss:[esp+C]
        # mov dword ptr ds:[edx+B4],-3
        # mov eax,dword ptr ds:[ecx+20]
        # cmp eax,4
        # jge short 0042F2F7
        # cmp dword ptr ds:[ecx+24],0
        # jnz short 0042F2F7
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # mov dword ptr ds:[eax+EC],4
        # jmp short 0042F304
        injured = global->objects[injured_id]
        injured->shaking = -3
        itr = @itr
        if (itr->arest < 4 and
            itr->vrest == 0)
          attacker = global->objects[attacker_id]
          attacker->arest = 4
        else
          # 0042F2F7
          # mov edx,dword ptr ds:[esi+ebx*4+194]
          # mov dword ptr ds:[edx+EC],eax
          attacker = global->objects[attacker_id]
          attacker->arest = itr->arest
        end
        # 0042F304
        # cmp dword ptr ds:[ecx+24],0
        # jle short 0042F31B
        if itr->vrest > 0
          # mov eax,dword ptr ds:[esi+edi*4+194]
          # mov cl,byte ptr ds:[ecx+24]
          # mov byte ptr ds:[eax+ebx+F0],cl
          injured = global->objects[injured_id]
          injured->vrest_of_objects[attacker_id] = itr->vrest
        end
        # 0042F31B
        # mov eax,dword ptr ds:[esi+edi*4+194]
        # mov edx,dword ptr ds:[eax+7C]
        # mov eax,dword ptr ds:[eax+368]
        # imul edx,edx,178
        # cmp dword ptr ds:[edx+eax+82C],2
        # jnz 0042F3CA
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        cpoint_kind = file->frames[frame_id].cpoint_kind

        # mov ecx,dword ptr ds:[esi+edi*4+194]
        # mov edx,dword ptr ds:[ecx+90]
        # mov eax,dword ptr ds:[esi+edx*4+194]
        # cmp dword ptr ds:[eax+8C],edi
        # jnz short 0042F3CA
        injured = global->objects[injured_id]
        cpoint_timer_id = injured->cpoint_timer
        cpoint_timer = global->objects[cpoint_timer_id]
        cpoint_catcher_id = cpoint_timer->cpoint_catcher

        # cmp dword ptr ds:[ecx+B0],50
        # je short 0042F3CA

        # mov eax,ecx
        # mov edx,dword ptr ds:[eax+7C]
        # mov eax,dword ptr ds:[eax+368]
        # imul edx,edx,178
        # cmp dword ptr ds:[edx+eax+838],0
        # je short 0042F3CA
        frame_id = injured->frame_id
        file = injured->file
        front_hurt_act = file->frames[frame_id].front_hurt_act
        if (cpoint_kind == caught_kind and
            cpoint_catcher_id == injured and
            injured->fall != 80 and
            front_hurt_act != 0)
          # mov al,byte ptr ds:[ecx+80]
          # mov edx,dword ptr ds:[esi+ebx*4+194]
          # cmp al,byte ptr ds:[edx+80]
          # mov eax,ecx
          # je short 0042F3B1
          attacker = global->objects[attacker_id]
          if injured->facing != attacker->facing
            # mov ecx,dword ptr ds:[eax+7C]
            # mov edx,dword ptr ds:[eax+368]
            # imul ecx,ecx,178
            # mov ecx,dword ptr ds:[ecx+edx+838]
            # mov dword ptr ds:[eax+70],ecx
            # jmp short 0042F3CA
            frame_id = injured->frame_id
            file = injured->file
            front_hurt_act = file->frames[frame_id].front_hurt_act
            injured->frame_id = front_hurt_act
          else
            # 0042F3B1
            # mov edx,dword ptr ds:[eax+7C]
            # mov ecx,dword ptr ds:[eax+368]
            # imul edx,edx,178
            # mov edx,dword ptr ds:[edx+ecx+83C]
            # mov dword ptr ds:[eax+70],edx
            frame_id = injured->frame_id
            file = injured->file
            back_hurt_act = file->frames[frame_id].back_hurt_act
            injured->frame_id = back_hurt_act
          end
        end
        # 0042F3CA
        # mov eax,dword ptr ds:[esi+edi*4+194]
        # cmp dword ptr ds:[eax+B0],50
        # jnz short 0042F3E4
        injured = global->objects[injured_id]
        if injured->fall == 80
          # mov dword ptr ds:[eax+B0],0
          injured->fall = 0
        end
        # 0042F3E4
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # cmp dword ptr ds:[eax+98],0
        # jge short 0042F40D
        attacker = global->objects[attacker_id]
        if attacker->weapon_type < 0
          # mov ecx,dword ptr ds:[eax+A0]
          # mov edx,dword ptr ds:[esi+ecx*4+194]
          # mov eax,dword ptr ds:[eax+B4]
          # mov dword ptr ds:[edx+B4],eax
          holder_id = attacker->holder_id
          holder = global->objects[holder_id]
          holder->shaking = attacker->shaking
        end
        # 0042F40D
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # mov ecx,dword ptr ds:[eax+70]
        # mov edx,dword ptr ds:[eax+368]
        # imul ecx,ecx,178
        # cmp dword ptr ds:[ecx+edx+7AC],3EA
        # jnz short 0042F4AD
        attacker = global->objects[attacker_id]
        frame_id = attacker->frame_id
        file = attacker->file
        state = file->frames[frame_id].state
        if state == throwing_state
          # push 10
          # fstp st
          # push 0EE
          # call 00417170
          # mov ecx,dword ptr ds:[esi+ebx*4+194]
          # mov dword ptr ds:[ecx+70],eax
          # mov edx,dword ptr ds:[esi+edi*4+194]
          # fld qword ptr ds:[edx+28]
          # mov eax,dword ptr ds:[esi+ebx*4+194]
          # fmul qword ptr ds:[448310]
          # add esp,8
          # fchs
          # fstp qword ptr ds:[eax+40]
          # mov ecx,dword ptr ds:[esi+ebx*4+194]
          # fld qword ptr ds:[449058]
          # fstp qword ptr ds:[ecx+48]
          # mov eax,dword ptr ds:[esi+ebx*4+194]
          # mov edx,dword ptr ds:[eax+368]
          # cmp dword ptr ds:[edx+6F8],4
          # jnz short 0042F4AB
          attacker = global->objects[attacker_id]
          attacker->frame_id = func_417170_random 16
          injured = global->objects[injured_id]
          attacker = global->objects[attacker_id]
          attacker->x_velocity = - injured->pic_x_gain * 0.5
          attacker = global->objects[attacker_id]
          attacker->y_velocity = - 4.0
          attacker = global->objects[attacker_id]

          # mov ecx,dword ptr ds:[esi+edi*4+194]
          # mov edx,dword ptr ds:[ecx+368]
          # cmp dword ptr ds:[edx+6F8],4
          # jnz short 0042F4AB
          injured = global->objects[injured_id]
          if (attacker->file->type == throw_weapon_type and
              injured->file->type == throw_weapon_type)
            # fld qword ptr ds:[ecx+28]
            # fchs
            # fstp qword ptr ds:[eax+28]
            attacker->pic_x_gain = - injured->pic_x_gain
          end
          # 0042F4AB
          # fldz
        end
        # 0042F4AD
        # mov eax,dword ptr ds:[esi+edi*4+194]
        # mov ecx,dword ptr ds:[eax+368]
        # cmp dword ptr ds:[ecx+6F8],1
        # jnz short 0042F501
        injured = global->objects[injured_id]
        file = injured->file
        if file->type == lignt_weapon_type
          # push 10
          # fstp st
          # push 0EF
          # mov byte ptr ds:[eax+EB],1
          # call 00417170
          # fldz
          # mov edx,dword ptr ds:[esi+edi*4+194]
          # mov dword ptr ds:[edx+70],eax
          # mov eax,dword ptr ds:[esi+ebx*4+194]
          # mov ecx,dword ptr ds:[esi+edi*4+194]
          # mov edx,dword ptr ds:[eax+364]
          # add esp,8
          # mov dword ptr ds:[ecx+364],edx
          injured->? = 1
          injured = global->objects[injured_id]
          injured->frame_id = func_417170_random 16
          attacker = global->objects[attacker_id]
          injured = global->objects[injured_id]
          injured->team = attacker->team
        end
        # 0042F501
        # mov eax,dword ptr ds:[esi+edi*4+194]
        # mov ecx,dword ptr ds:[eax+368]
        # mov eax,dword ptr ds:[ecx+6F8]
        # cmp eax,4
        # je short 0042F51E
        injured = global->objects[injured_id]
        file = injured->file

        # cmp eax,6
        # jnz short 0042F572
        if (file->type == throw_weapon_type or
            file->type == drink_type)
          # mov edx,dword ptr ds:[esi+ebx*4+194]
          # fstp st
          # mov byte ptr ds:[edx+edi+F0],1E
          # mov eax,dword ptr ds:[esi+edi*4+194]
          # push 10
          # push 0F0
          # mov byte ptr ds:[eax+EB],1
          # call 00417170
          # fldz
          # mov ecx,dword ptr ds:[esi+edi*4+194]
          # mov dword ptr ds:[ecx+70],eax
          # mov edx,dword ptr ds:[esi+ebx*4+194]
          # mov eax,dword ptr ds:[esi+edi*4+194]
          # mov ecx,dword ptr ds:[edx+364]
          # add esp,8
          # mov dword ptr ds:[eax+364],ecx
          attacker = global->objects[attacker_id]
          attacker->vrest_of_objects[injured_id] = 30
          attacker->? = 1
          injured = global->objects[injured_id]
          injured->frame_id = func_417170_random 16
          attacker = global->objects[attacker_id]
          injured = global->objects[injured_id]
          injured->team = attacker->team
        end
        # 0042F572
        # mov eax,dword ptr ds:[esi+edi*4+194]
        # mov edx,dword ptr ds:[eax+368]
        # mov ecx,2
        # cmp dword ptr ds:[edx+6F8],ecx
        # jnz 0042F688
        injured = global->objects[injured_id]
        file = injured->file
        if file->type == heavy_weapon_type
          # mov byte ptr ds:[eax+EB],1
          # mov eax,dword ptr ds:[esi+ebx*4+194]
          # cmp dword ptr ds:[eax+98],-2
          # jnz short 0042F5E5
          injured->? = 1
          attacker = global->objects[attacker_id]
          if attacker->weapon_type == - heavy_weapon_type
            # mov ecx,dword ptr ss:[esp+C]
            # cmp dword ptr ds:[ecx+1C],28
            # jg short 0042F5CE
            # cmp dword ptr ds:[ecx+2C],4
            # je short 0042F5CE
            itr = @itr
            if (itr->fall > 40 or
                itr->effect == 4)
              # 0042F5CE
              # mov eax,dword ptr ds:[eax+A0]
              # mov edx,dword ptr ds:[esi+eax*4+194]
              # mov byte ptr ds:[edx+edi+F0],13
              # jmp short 0042F615
              holder_id = attacker->holder_id
              holder = global->objects[holder_id]
              holder->vrest_of_objects[injured_id] = 19
            else
              # mov eax,dword ptr ds:[eax+A0]
              # mov edx,dword ptr ds:[esi+eax*4+194]
              # mov byte ptr ds:[edx+edi+F0],3
              # jmp short 0042F615
              holder_id = attacker->holder_id
              holder = global->objects[holder_id]
              holder->vrest_of_objects[injured_id] = 3
            end
          elsif (
            # 0042F5E5
            # mov edx,dword ptr ds:[eax+368]
            # cmp dword ptr ds:[edx+6F8],ecx
            # mov ecx,dword ptr ss:[esp+C]
            # je short 0042F615
            itr = @itr
            file = attacker->file
            file->type != heavy_weapon_type
          )
            # cmp dword ptr ds:[ecx+1C],28
            # jg short 0042F60D
            # cmp dword ptr ds:[ecx+2C],4
            # je short 0042F60D
            if (itr->fall > 40 or
                itr->effect == 4)
              # 0042F60D
              # mov byte ptr ds:[eax+edi+F0],13
              attacker->vrest_of_objects[injured_id] = 19
            else
              # mov byte ptr ds:[eax+edi+F0],3
              # jmp short 0042F615
              attacker->vrest_of_objects[injured_id] = 3
            end
          end
          # 0042F615
          # mov eax,dword ptr ds:[esi+ebx*4+194]
          # mov edx,dword ptr ds:[esi+edi*4+194]
          # mov al,byte ptr ds:[eax+80]
          # mov byte ptr ds:[edx+80],al
          # cmp dword ptr ds:[ecx+1C],28
          # jg short 0042F651
          attacker = global->objects[attacker_id]
          injured = global->objects[injured_id]
          injured->facing = attacker->facing

          # mov eax,dword ptr ds:[esi+edi*4+194]
          injured = global->objects[injured_id]

          # cmp dword ptr ds:[eax+14],0
          # jl short 0042F651
          # cmp dword ptr ds:[ecx+2C],4
          # je short 0042F651
          if (itr->fall > 40 or
              injured->y < 0 or
              itr->effect == 4)
            # 0042F651
            # push 6
            # fstp st
            # push 0F1
            # call 00417170
            # fldz
            # mov ecx,dword ptr ds:[esi+edi*4+194]
            # add esp,8
            # mov dword ptr ds:[ecx+70],eax
            injured = global->objects[injured_id]
            injured->frame_id = func_417170_random 6
          else
            # mov dword ptr ds:[eax+70],14
            # jmp short 0042F66E
            injured->frame_id = 20
          end
          # 0042F66E
          # mov edx,dword ptr ds:[esi+ebx*4+194]
          # mov eax,dword ptr ds:[esi+edi*4+194]
          # mov ecx,dword ptr ds:[edx+364]
          # mov dword ptr ds:[eax+364],ecx
          attacker = global->objects[attacker_id]
          injured = global->objects[injured_id]
          injured->team = attacker->team
        end
        # 0042F688
        # mov edx,dword ptr ds:[esi+ebx*4+194]
        # mov eax,dword ptr ds:[edx+368]
        # cmp dword ptr ds:[eax+6F4],0C9
        # jnz short 0042F6BC
        attacker = global->objects[attacker_id]

        # mov ecx,dword ptr ds:[esi+edi*4+194]
        # mov edx,dword ptr ds:[ecx+368]
        # cmp dword ptr ds:[edx+6F8],0
        # jnz short 0042F6BC
        injured = global->objects[injured_id]
        if (attacker->file->id == henry_arrow1_dat and
            injured->file->type == character_type)
          # mov byte ptr ds:[ebx+esi+4],0
          global->is_object_exists[attacker] = false
        end
        # 0042F6BC
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # mov ecx,dword ptr ds:[eax+368]
        # cmp dword ptr ds:[ecx+6F4],0D6
        # jnz short 0042F6F5
        attacker = global->objects[attacker_id]

        # mov edx,dword ptr ds:[esi+edi*4+194]
        # mov ecx,dword ptr ds:[edx+368]
        # cmp dword ptr ds:[ecx+6F8],0
        # jnz short 0042F6F5
        injured = global->objects[injured_id]
        if (attacker->file->id == john_biscuit_dat and
            injured->file->type == character_type)
          # mov dword ptr ds:[eax+2FC],0
          attacker->hp = 0
        end
        # 0042F6F5
        # mov edx,dword ptr ds:[esi+edi*4+194]
        # mov eax,dword ptr ds:[edx+368]
        # cmp dword ptr ds:[eax+6F8],3
        # jnz 0042FCAA
      else
        # 0042FDF2
      end
    else
      # 0043056E
    end
  end
end
