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
      if attacker->? == 0 or not file->id == template_dat
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
          if kind == 0 and itr->effect == 15
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
            if state == 12 or state == 13 # injured is falling
              return
            else
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
                if attaking > 0 and not @holder_id == injured_id
                  # mov eax,dword ptr ds:[edx]
                else
                end
              else
              end
            end
          else
          end
        end
      else
        return
      end
    else
    end
  end
  # 0x431AB9
end
