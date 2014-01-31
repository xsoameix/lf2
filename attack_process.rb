# 0x42E100
def attack_process(attacker_id)

  # mov eax,dword ptr ds:[esi+ebx*4+194]
  # mov ecx,dword ptr ds:[eax+7C]
  # mov edx,dword ptr ds:[eax+368]
  # imul ecx,ecx,178
  # lea ecx,dword ptr ds:[ecx+edx+7A4]
  attacker = global->objects[attacker_id]
  frame_id = attacker->frame_id
  file = attacker->file
  frame = file->frames[frame_id]

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
    @injured_frame = file->frames[frame_id]

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

        # fire attack fails because injured is falling
        if kind == 0 and itr->effect == 21 and (state == 12 or state == 13)
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
            kind_ptr = &@kind
            @kind_ptr = kind_ptr
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
          kind_ptr = &@kind
          @kind_ptr = kind_ptr
        end
        # 0042E411
        # mov eax,dword ptr ds:[esi+ebx*4+194]
        # cmp dword ptr ds:[eax+320],0
        # jle short 0042E461
        attacker = global->objects[attacker_id]

        # cmp dword ptr ds:[edx],4
        # jnz short 0042E461

        # attacker is a man thrown away
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
      end
    else
    end
  end
  # 0x431AB9
end
