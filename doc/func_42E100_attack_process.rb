# 0x0042E100
def func_42E100_attack_process(global, attacker_id)
  attacker = global->objects[attacker_id]
  frame_id = attacker->frame_id
  file = attacker->file
  frame = &file->frames[frame_id]
  attack_id = 0
  @attacker_frame = frame
  @attack_id = attack_id
  # the condition of the loop below
  $fpu_st0 = 0

  # 00431A9B

  # attack loop
  for (; @attack_id < attacker->succuessful_attacks; @attack_id++)
    # 0042E146
    attacker = global->objects[attacker_id]
    attacker_frame = @attacker_frame
    itr_id = attacker->itr_of_attack[attack_id]
    itrs_size = attacker_frame->itrs_size
    itrs_size -= 1
    @itr_id = itr_id
    if itr_id > itrs_size
      break
    end
    injured_id = attacker->injured_of_attack[attack_id]
    injured = global->objects[injured_id]
    frame_id = injured->frame_id
    file = injured->file
    @injured_frame = &file->frames[frame_id]

    # injured's vrest <= 0
    if injured->vrest_of_objects[attacker_id] > 0
      next
    end
    attacker = global->objects[attacker_id]
    injured = global->objects[injured_id]
    file = injured->file

    # injured is a weapon, attack, criminal or drink
    if attacker->_unknownEB == 0 or not file->type == character_type
      break
    end
    injured = global->objects[injured_id]
    frame_id = injured->frame_id
    file = injured->file
    cpoint_kind = file->frames[frame_id].cpoint_kind
    injured = global->objects[injured_id]
    cpoint_timer_id = injured->cpoint_timer
    cpoint_timer = global->objects[cpoint_timer_id]
    cpoint_catcher_id = cpoint_timer->cpoint_catcher
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
    itr_id = @itr_id
    attacker_frame = @attacker_frame
    itr = &attacker_frame->itrs[itr_id]
    kind = itr->kind
    @itr = itr
    injured = global->objects[injured_id]
    frame_id = injured->frame_id
    file = injured->file
    state = file->frames[frame_id].state
    injured = global->objects[injured_id]
    frame_id = injured->frame_id
    file = injured->file
    state = file->frames[frame_id].state

    # injured is burning
    if (kind == itr_normal_attack and
        itr->effect == flame_effect and
        (state == fire_state or
         state == burn_run_state))
      break
    end
    # 0042E29F
    attacker = global->objects[attacker_id]
    holder_id = attacker->holder_id
    holder = global->objects[holder_id]
    @holder_id = holder_id

    # attacker is a weapon being held
    if (itr->kind == itr_strength_list and
        attacker->weapon_type < 0 and
        holder->weapon_id == attacker_id)
      frame_id = holder->frame_id
      file = holder->file
      attaking = file->frames[frame_id].attaking

      # attack is valid
      if attaking > 0 and not @holder_id == injured_id
        @kind = itr->kind
        @x    = itr->x
        @y    = itr->y
        w     = itr->w
        @h    = itr->h
        attacker = global->objects[attacker_id]
        file = attacker->file
        @w = w
        times = 5
        attacking_itr = &file->attaking_itrs[attaking]
        begin
          @remaining_attrs[times - 5]     = *(attacking_itr - 4)
          @remaining_attrs[times - 5 + 1] = *(attacking_itr)
          @remaining_attrs[times - 5 + 2] = *(attacking_itr + 4)
          @remaining_attrs[times - 5 + 3] = *(attacking_itr + 8)
          @remaining_attrs[times - 5 + 4] = *(attacking_itr + 12)
          attacking_itr += 20
          times += 5
        end while times < 20
        @kind = 0

        # 0042E409
        itr = &@kind
        @itr = itr
      end
    else
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
      @_unknown4C     = itr->_unknown4C

      # 0042E409
      itr = &@kind
      @itr = itr
    end
    # 0042E411
    attacker = global->objects[attacker_id]

    # attacker is a man being thrown away
    if attacker->thrown_injury > 0 and itr->kind == itr_thrown
      itr->kind = itr_normal_attack
      attacker = global->objects[attacker_id]

      # adjust the direction
      if (attacker->x_velocity > 0 and
          attacker->facing == facing_left)
        # 0042E459
        itr->dvx = -itr->dvx
      end
      # 0042E446

      # adjust the direction
      if (attacker->x_velocity < 0 and
          attacker->facing == facing_right)
        # 0042E459
        itr->dvx = -itr->dvx
      end
    end
    # 0042E461
    injured = global->objects[injured_id]
    weapon_id = injured->weapon_id
    weapon = global->objects[weapon_id]

    # injured is holding a heavy weapon
    if (injured->weapon_type == heavy_weapon_type and
        itr->kind == itr_normal_attack and
        weapon->holder_id == injured and
        weapon->weapon_type == - heavy_weapon_type)
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
    injured = global->objects[injured_id]
    file = injured->file

    # injured is a heavy weapon
    if file->type == heavy_weapon_type
      itr = @itr
      itr->dvx = itr->dvx / 2
      itr->dvy = itr->dvy / 2
    end

    # 0042E57B
    @_? = 0
    injured = global->objects[injured_id]
    file = injured->file
    frame_id = injured->frame_id
    file = injured->file
    injured = global->objects[injured_id]
    frame_id = injured->frame_id
    file = injured->file

    # attacker is a john's force field
    if (itr->kind == itr_forcefield and
        (file->type == character_type or
         file->frames[frame_id].state == throwing_state or
         file->frames[frame_id].state == in_the_sky_state_2))
      # 0042E5E1
      itr->kind = itr_normal_attack
      injured = global->objects[injured_id]
      file = injured->file

      # injured is a character
      if file->type == character_type
        attacker = global->objects[attacker_id]
        attacker->hp = 0
        itr = @itr
      end
    end

    # 0042E60E

    # normal attack
    if itr->kind == itr_normal_attack
      itr = @itr

      # 0042E61C
      bdefend = itr->bdefend
      @bdefend = bdefend
      injured_frame = @injured_frame
      state = injured_frame->state

      # check if knight can defend attack
      injured = global->objects[injured_id]
      file = injured->file
      injured_file_id = file->id
      @injured_file_id = injured_file_id
      itr = @itr
      effect = itr->effect
      effect_type = effect / 10
      attacker = global->objects[attacker_id]
      file = attacker->file
      attacker_file_id = file->id

      # check if louis can defend attack

      # 0042E6E8
      injured_file_id = @injured_file_id

      # 0042E6EC
      injured = global->objects[injured_id]
      itr = @itr
      effect = itr->effect
      effect_type = effect / 10
      attacker = global->objects[attacker_id]
      file = attacker->file
      attacker_file_id = file->id
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      frame_id = injured->frame_id
      file = injured->file
      frame_id = injured->frame_id
      file = injured->file

      # check if julian can defend attack

      # 0042E7CE
      injured = global->objects[injured_id]
      attacker = global->objects[attacker_id]
      file = attacker->file
      attacker_file_id = file->id

      # check if injured can defend attack

      # 0042E80A
      itr = @itr
      bdefend = @bdefend

      # 0042E812
      injured_frame = @injured_frame
      attacker = global->objects[attacker_id]
      attacker_facing = attacker->facing
      injured = global->objects[injured_id]
      attacker = global->objects[attacker_id]
      file = attacker->file
      attacker_file_id = file->id

      # 0042E870

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
              effect_type != fire_type_effect and
              effect_type != freeze_type_effect and
              effect != fire_effect and
              effect != freeze_effect and
              attacker_file_id != john_biscuit_dat and
              attacker_file_id != henry_arrow2_dat
            ) and
            !(
              # louis can defend attack when these conditions hold:
              injured_file_id == louis_dat and
              injured->bdefend < 1 and
              effect_type != fire_type_effect and
              effect_type != freeze_type_effect and
              effect != fire_effect and
              effect != freeze_effect and
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
                attacker_file_id == boomerang_dat or
                attacker_file_id == jan_chase_dat or
                attacker_file_id == firzen_chasef_dat or
                attacker_file_id == firzen_chasei_dat
              ) and
              injured->hp > 0)))
        # 0042E87D
        injured = global->objects[injured_id]
        injured->bdefend = 45
        injured = global->objects[injured_id]
        file = injured->file
        if file->id == criminal_dat
          # 00431AC4
          frame_id = injured->frame_id
          file = injured->file
          injured = global->objects[injured_id]
          frame_id = injured->frame_id
          file = injured->file
          bdys = file->frames[frame_id].bdys

          if (file->frames[frame_id].bdys_size <= 0 or
              bdys[0].kind <= 1000)
            break
          end
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
        file = injured->file
        type = file->type
        @injured_type = type
        if not type == drink_type
          armor = injured->armor_multiplier
          itr = @itr
          injury = itr->injury
          @armor = armor

          # injured wears the armor
          if armor > 0
            injury = injury * 100 / @armor
          end
          # 0042E8E7
          injured = global->objects[injured_id]
          hp = injured->hp

          # attacter's kills + 1
          if (hp > 0 and
              injury >= hp and
              @injured_type == character_type)
            attacker = global->objects[attacker_id]
            owner_id = attacker->owner
            owner = global->objects[owner_id]
            owner->kills += 1
            injured = global->objects[injured_id]
            _unknown344 = injured->_unknown344
            if (injured->clone == not_clone and
                _unknown344 > 0 and
                _unknown344 < 3)
              injured = global->objects[injured_id]
              _unknown344 = injured->_unknown344
              451B60[_unknown344] += 1
            end
          end
          # 0042E955
          injured = global->objects[injured_id]
          injured->hp -= injury
          injured = global->objects[injured_id]
          injured->dark_hp += injury / 6
          injured = global->objects[injured_id]
          injured->hp_lost += injury
          injured = global->objects[injured_id]
          file = injured->file

          # attacker's total attack is increasing
          if (file->type == character_type and
              injured->clone == not_clone)
            attacker = global->objects[attacker_id]
            owner_id = attacker->owner
            owner = global->objects[owner_id]
            owner->total_attack += injury
          end
          # 0042E9C9
          injured = global->objects[injured_id]
          _unknown344 = injured->_unknown344
          if _unknown344 > 0 and _unknown344 < 3
            injured = global->objects[injured_id]
            _unknown344 = injured->_unknown344
            451B68[_unknown344] += injury
          end
        end

        # set the injured's fall

        # 0042E9F3
        injured = global->objects[injured_id]
        itr = @itr
        if (injured->hp <= 0 or
            itr->effect == shrafe_effect)
          # 0042EA0D
          injured->fall = 80
        end
        # 0042EA17
        injured = global->objects[injured_id]
        file = injured->file
        type = file->type

        # weapons and drinks are destroyed by bdefend 100
        if (type == lignt_weapon_type or
            type == heavy_weapon_type or
            type == throw_weapon_type or
            type == drink_type)
          # 0042EA3E
          injured = global->objects[injured_id]
          injury = itr->injury
          injured->drink_hp -= injury
          if itr->bdefend == 100
            injured = global->objects[injured_id]
            injured->drink_hp = -1
          end
        end
        # 0042EA65
        injured = global->objects[injured_id]
        file = injured->file
        if (not file->type == heavy_weapon_type or
            itr->fall > 40)
          # 0042EA81
          injured = global->objects[injured_id]
          injured->attacks += 1
        end
        # 0042EA8C
        fall = itr->fall
        injured = global->objects[injured_id]

        # 0042EAA3

        # increase injured's fall
        injured->fall += (fall == 0) ? 20 : fall

        # 0042EAA9
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        frame_id = injured->frame_id
        file = injured->file
        file = injured->file
        type = file->type

        # set weapons' and some states' fall to 80
        if (file->frames[frame_id].state == ice_state or
            file->frames[frame_id].state == falling_state or
            type == lignt_weapon_type or
            type == throw_weapon_type or
            type == drink_type or
            type == heavy_weapon_type)
          # 0042EB02
          injured = global->objects[injured_id]
          injured->fall = 80
        end
        # 0042EB13
        injured = global->objects[injured_id]
        fall = injured->fall
        file = injured->file

        # adjust injured's fall and set injured's frame
        if (fall > 60 and
            not file->type == attack_type)
          injured->fall = 80

          # 0042EB43
          file = injured->file
        elsif (fall > 40 and
               not file->type == attack_type)
          injured = global->objects[injured_id]
          injured->frame_id == back_injured_frame
          injured = global->objects[injured_id]
          injured->fall == 60
          injured = global->objects[injured_id]

          # injured is in the sky, so set its fall to 80
          if injured->y < 0
            injured->fall = 80
          end
          # 0042EB98
          file = injured->file
        elsif (fall > 20 and
               not file->type == attack_type)
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
            injured->fall = 80
          end

          # 0042EC01
          file = injured->file
        elsif (fall > 0 and
               not file->type == attack_type)
          injured = global->objects[injured_id]
          injured->frame_id = slightly_injured_frame
          injured = global->objects[injured_id]
          injured->fall = 20
          injured = global->objects[injured_id]

          # injured is in the sky, so set its frame to injured frame
          if injured->y < 0
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
        attacker = global->objects[attacker_id]
        file = attacker->file
        _unknownAC = file->_unknownAC
        if (file->type == attack_type and
            _unknownAC > -1)
          func_416FB0 attacker->x, _unknownAC
        end
        # 0042EC9F
        injured = global->objects[injured_id]
        file = injured->file
        type = file->type
        if type == character_type
          itr = @itr
          if itr->effect == punch_effect
            fall = injured->fall
            args = Array.new 2
            if fall == 80
              args = [injured->x, 2]
            else
              # 0042ECD9
              args[1] = 0
              if fall == 60
                args[0] = injured->x
              else
                # 0042ECE6
                args[0] = injured->x
              end
            end
            # 0042ECEA
            func_417090 args
          end
          # 0042ECF4
          itr = @itr
          if itr->effect == bleed_effect
            injured = global->objects[injured_id]
            fall = injured->fall
            x = injured->x
            @_? = 1
            arg = nil
            if fall == 80
              func_417090 x, 12
              arg = 2
            else
              # 0042ED3C
              func_417090 x, 11
              arg = 0
            end
            # 0042ED27
            injured = global->objects[injured_id]
            func_417090 injured->x, arg

            # 0042ED75
          end
        else
          # 0042ED48
          if (type > character_type and
              file->_unknownA4 > -1)
            injured = global->objects[injured_id]
            file = injured->file
            _unknownA4 = file->_unknownA4
            func_416FB0 injured->x, _unknownA4

            # 0042ED75
          end
        end
        # set the injured's pic_x_gain

        # 0042ED77
        injured = global->objects[injured_id]
        itr = @itr
        if (injured->fall != 80 and
            # 0042EE20
            injured->x_velocity < 5.0 and
            injured->x_velocity > -5.0 and
            itr->dvx != 0)
          attacker = global->objects[attacker_id]
          frame_id = attacker->frame_id
          file = attacker->file
          if file->frames[frame_id].state == in_the_sky_state_2
            x = attacker->x
            injured = global->objects[injured_id]
            injured->pic_x_gain += 5.0
            x == injured->pic_x_gain - 5.0
          else
            # 0042EDF4
            facing = attacker->facing
            injured = global->objects[injured_id]
            injured->pic_x_gain += (1 - facing * 2).to_f * 5.0
          end
        elsif (
          # 0042EE22
          attacker = global->objects[attacker_id]
          frame_id = attacker->frame_id
          file = attacker->file
          file->frames[frame_id].state == in_the_sky_state_2
        )
          injured = global->objects[injured_id]
          if attacker->x < injured->x

            # 0042EE5B
            itr = @itr
            injured->pic_x_gain += itr->dvx.to_f
          else
            # 0042EE66
            itr = @itr
            injured->pic_x_gain -= itr->dvx.to_f
          end
        elsif (
          # 0042EE78
          injured = global->objects[injured_id]
          file = injured->file
          type = file->type
          (not type == throw_weapon_type and
           not type == drink_type)
        )
          itr = @itr
          effect = itr->effect
          if (effect == firen_explosion_effect or
              effect == julian_explosion_effect)
            # 0042EEF0
            injured = global->objects[injured_id]
            injured = global->objects[injured_id]
            if injured->x <= attacker->x
              # 0042EE5B
              itr = @itr
              injured->pic_x_gain += itr->dvx.to_f
            else
              injured->pic_x_gain -= itr->dvx.to_f
            end
          else
            if attacker->facing == facing_right
              injured = global->objects[injured_id]
              injured->pic_x_gain += itr->dvx.to_f
            end
            # 0042EEC3
            attacker = global->objects[attacker_id]
            if attacker->facing == facing_left
              itr = @itr
              injured = global->objects[injured_id]
              injured->pic_x_gain -= itr->dvx.to_f
            end
          end
        else
          # 0042EF18

          # illustration of stack:
          # [0]
          # [0 v 0.55]
          # [0 (v * 0.55) 0.55]
          # [0.55 (v * 0.55) 0]
          injured = global->objects[injured_id]
          if injured->x_velocity < 0

            # illustration of stack:
            # [0.55 0]
            # [0.55 0 v]
            # [0.55 0 (v * 0.55)]
            # [0.55 0 -(v * 0.55)]
            # [0.55 -(v * 0.55) 0]
          end
          # 0042EF41

          # illustration of stack:
          # [0.55 |v * 0.55| 0]
          # [0.55 |v * 0.55| 0 dvx]
          # [0.55 dvx 0]
          itr = @itr
          injured = global->objects[injured_id]

          # 0042EF6E
          injured = global->objects[injured_id]
          if (itr->dvx.to_f > injured->x_velocity.abs * 0.55 or
              attacker->facing == facing_right and injured->pic_x_gain > 0 or
              attacker->facing == facing_left  and injured->pic_x_gain < 0)
            # 0042EFC6

            # illustration of stack:
            # [0.55 dvx 0]
            # [0 dvx]
            if attacker->facing == facing_right

              # illustration of stack:
              # [0 dvx]
              # [0]
              injured = global->objects[injured_id]
              injured->pic_x_gain += itr->dvx.to_f
            else
              # 0042EFE0

              # illustration of stack:
              # [0 dvx]
              # [0]
            end
            # 0042EFE2
            attacker = global->objects[attacker_id]
            if attacker->facing == facing_left
              itr = @itr
              injured = global->objects[injured_id]
              injured->pic_x_gain -= itr->dvx.to_f
            end
          else
            # 0042EF84

            # illustration of stack:
            # [0.55 dvx 0]
            # [0.55 0]

            # 0042EF9C
            if (attacker->facing == facing_left  and injured->x_velocity > 0 or
                attacker->facing == facing_right and injured->x_velocity < 0)
              # 0042EFB1

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

              # illustration of stack:
              # [0.55 0]
              # [0]
            end
          end
          # 0042F00A
          attacker = global->objects[attacker_id]
          file = attacker->file

          # attacker is a stick and being held
          if (file->id == stick_dat and
              attacker->weapon_type < 0)
            injured = global->objects[injured_id]
            args = Array.new 2
            args[1] = 13
            injured->pic_x_gain *= 2.5
            injured = global->objects[injured_id]
            args[0] = injured->x
            func_417090 args
            injured = global->objects[injured_id]
            if (injured->pic_x_gain > 0 and
                injured->pic_x_gain < 10.0)
              injured->pic_x_gain = 10.0
            else
              # 0042F07F
            end

            # 0042F081
            injured = global->objects[injured_id]

            if (injured->pic_x_gain < 0 and
                injured->pic_x_gain > -10.0)
              injured->pic_x_gain = -10.0
            else
              # 0042F0A7
            end
          end
        end

        # if attacker is flying, goto hitting_frame (10)

        # 0042F0A9
        attacker = global->objects[attacker_id]
        frame_id = attacker->frame_id
        attacker_file = attacker->file
        injured = global->objects[injured_id]
        injured_file = injured->file
        injured_file_id = injured_file->id
        injured = global->objects[injured_id]

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
        injured = global->objects[injured_id]
        if injured->fall == 80
          itr = @itr
          dvy = itr->dvy
          file = injured->file
          type = file->type
          @dvy = dvy
          if dvy == 0
            # 0042F1FB

            # 0042F205
            if ((type != heavy_weapon_type and
                 type != attack_type) or
                 itr->fall > 40)
              # 0042F20B
              # fsub qword ptr ds:[447A50]
              injured = global->objects[injured_id]
              injured->y_accl -= 7.0
            end
          else

            # 0042F1BC
            if ((type != heavy_weapon_type and
                 type != attack_type) or
                 itr->fall > 40)
              # 0042F1C2
              injured = global->objects[injured_id]
              injured->y_accl += @dvy
            end
            # 0042F1D3
            injured = global->objects[injured_id]
            if __ftol2_sse(injured->y + injured->y_accl) > 0
              injured = global->objects[injured_id]
              injured->y_accl = 12.0
            end
          end
          # 0042F21E
          injured = global->objects[injured_id]

          # 0042F239
          if ((injured->facing == facing_right and injured->pic_x_gain <= 0) or
              (injured->facing == facing_left and injured->pic_x_gain >= 0))
            # 0042F248
            injured->frame_id = falling_back_frame
          else
            # 0042F251
            injured->frame_id = falling_front_frame
          end
          # 0042F258
          injured = global->objects[injured_id]
          weapon_id = injured->weapon_id
          weapon = global->objects[weapon_id]
          if (injured->weapon_type > 0 and
              injured_id == weapon->holder_id)
            weapon_id = injured->weapon_id
            attacker = global->objects[attacker_id]
            attacker->vrest_of_objects[weapon_id] = 45
            injured = global->objects[injured_id]
            weapon_id = injured->weapon_id
            injured->vrest_of_objects[weapon_id] = 30
          end
        end
        # 0042F2A7
        attacker = global->objects[attacker_id]
        if attacker->shaking >= 0
          attacker->shaking = 3
        end
        # 0042F2C1
        injured = global->objects[injured_id]
        injured->shaking = -3
        itr = @itr
        if (itr->arest < 4 and
            itr->vrest == 0)
          attacker = global->objects[attacker_id]
          attacker->arest = 4
        else
          # 0042F2F7
          attacker = global->objects[attacker_id]
          attacker->arest = itr->arest
        end
        # 0042F304
        if itr->vrest > 0
          injured = global->objects[injured_id]
          injured->vrest_of_objects[attacker_id] = itr->vrest
        end
        # 0042F31B
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        cpoint_kind = file->frames[frame_id].cpoint_kind
        injured = global->objects[injured_id]
        cpoint_timer_id = injured->cpoint_timer
        cpoint_timer = global->objects[cpoint_timer_id]
        cpoint_catcher_id = cpoint_timer->cpoint_catcher
        frame_id = injured->frame_id
        file = injured->file
        front_hurt_act = file->frames[frame_id].front_hurt_act
        if (cpoint_kind == caught_kind and
            cpoint_catcher_id == injured and
            injured->fall != 80 and
            front_hurt_act != 0)
          attacker = global->objects[attacker_id]
          if injured->facing != attacker->facing
            frame_id = injured->frame_id
            file = injured->file
            front_hurt_act = file->frames[frame_id].front_hurt_act
            injured->frame_id = front_hurt_act
          else
            # 0042F3B1
            frame_id = injured->frame_id
            file = injured->file
            back_hurt_act = file->frames[frame_id].back_hurt_act
            injured->frame_id = back_hurt_act
          end
        end
        # 0042F3CA
        injured = global->objects[injured_id]
        if injured->fall == 80
          injured->fall = 0
        end
        # 0042F3E4
        attacker = global->objects[attacker_id]
        if attacker->weapon_type < 0
          holder_id = attacker->holder_id
          holder = global->objects[holder_id]
          holder->shaking = attacker->shaking
        end
        # 0042F40D
        attacker = global->objects[attacker_id]
        frame_id = attacker->frame_id
        file = attacker->file
        state = file->frames[frame_id].state
        if state == throwing_state
          attacker = global->objects[attacker_id]
          attacker->frame_id = func_417170_random 16
          injured = global->objects[injured_id]
          attacker = global->objects[attacker_id]
          attacker->x_velocity = - injured->pic_x_gain * 0.5
          attacker = global->objects[attacker_id]
          attacker->y_velocity = - 4.0
          attacker = global->objects[attacker_id]
          injured = global->objects[injured_id]
          if (attacker->file->type == throw_weapon_type and
              injured->file->type == throw_weapon_type)
            attacker->pic_x_gain = - injured->pic_x_gain
          end
          # 0042F4AB
        end
        # 0042F4AD
        injured = global->objects[injured_id]
        file = injured->file
        if file->type == lignt_weapon_type
          injured->_unknownEB = 1
          injured = global->objects[injured_id]
          injured->frame_id = func_417170_random 16
          attacker = global->objects[attacker_id]
          injured = global->objects[injured_id]
          injured->team = attacker->team
        end
        # 0042F501
        injured = global->objects[injured_id]
        file = injured->file
        if (file->type == throw_weapon_type or
            file->type == drink_type)
          attacker = global->objects[attacker_id]
          attacker->vrest_of_objects[injured_id] = 30
          attacker->_unknownEB = 1
          injured = global->objects[injured_id]
          injured->frame_id = func_417170_random 16
          attacker = global->objects[attacker_id]
          injured = global->objects[injured_id]
          injured->team = attacker->team
        end
        # 0042F572
        injured = global->objects[injured_id]
        file = injured->file
        if file->type == heavy_weapon_type
          injured->_unknownEB = 1
          attacker = global->objects[attacker_id]
          if attacker->weapon_type == - heavy_weapon_type
            itr = @itr
            if (itr->fall > 40 or
                itr->effect == shrafe_effect)
              # 0042F5CE
              holder_id = attacker->holder_id
              holder = global->objects[holder_id]
              holder->vrest_of_objects[injured_id] = 19
            else
              holder_id = attacker->holder_id
              holder = global->objects[holder_id]
              holder->vrest_of_objects[injured_id] = 3
            end
          elsif (
            # 0042F5E5
            itr = @itr
            file = attacker->file
            file->type != heavy_weapon_type
          )
            if (itr->fall > 40 or
                itr->effect == shrafe_effect)
              # 0042F60D
              attacker->vrest_of_objects[injured_id] = 19
            else
              attacker->vrest_of_objects[injured_id] = 3
            end
          end
          # 0042F615
          attacker = global->objects[attacker_id]
          injured = global->objects[injured_id]
          injured->facing = attacker->facing
          injured = global->objects[injured_id]
          if (itr->fall > 40 or
              injured->y < 0 or
              itr->effect == shrafe_effect)
            # 0042F651
            injured = global->objects[injured_id]
            injured->frame_id = func_417170_random 6
          else
            injured->frame_id = 20
          end
          # 0042F66E
          attacker = global->objects[attacker_id]
          injured = global->objects[injured_id]
          injured->team = attacker->team
        end
        # 0042F688
        attacker = global->objects[attacker_id]
        injured = global->objects[injured_id]
        if (attacker->file->id == henry_arrow1_dat and
            injured->file->type == character_type)
          global->is_object_exists[attacker] = false
        end
        # 0042F6BC
        attacker = global->objects[attacker_id]
        injured = global->objects[injured_id]
        if (attacker->file->id == john_biscuit_dat and
            injured->file->type == character_type)
          attacker->hp = 0
        end
        # 0042F6F5
        injured = global->objects[injured_id]

        # if injured is attack
        if injured->file->type == attack_type
          frame_id = injured->frame_id
          file = injured->file
          injured_state = file->frames[frame_id].state
          injured = global->objects[injured_id]
          frame_id = injured->frame_id
          file = injured->file
          injured_state = file->frames[frame_id].state
          attacker = global->objects[attacker_id]
          frame_id = attacker->frame_id
          file = attacker->file
          attacker_state = file->frames[frame_id].state

          # if injured frame is changable
          # eg. henry wind keeps flying
          # eg. john biscuit keeps tracking when attacker isn't henry wind
          if (injured_state != henry_wind_state and
              (injured_state != john_biscuit_state or
               attacker_state == henry_wind_state))
            # 0042F778
            attacker = global->objects[attacker_id]
            if attacker->weapon_type >= 0
              # 0042F7D1
              injured = global->objects[injured_id]
              injured->team = attacker->team
              attacker = global->objects[attacker_id]
              injured = global->objects[injured_id]
              injured->owner = attacker->owner
            else
              holder_id = attacker->holder_id
              holder = global->objects[holder_id]
              injured = global->objects[injured_id]
              injured->team = holder->team
              attacker = global->objects[attacker_id]
              holder_id = attacker->holder_id
              holder = global->objects[holder_id]
              injured = global->objects[injured_id]
              injured->owner = holder->owner
            end
            # 0042F7FE
            injured = global->objects[injured_id]
            injured->_unknownEB = 1
            injured = global->objects[injured_id]
            injured->wait_counter = 0
            injured = global->objects[injured_id]
            injured = global->objects[injured_id]
            injured = global->objects[injured_id]
            injured->y_accl
            injured->pic_x_gain
            injured->z_accl
            attacker = global->objects[attacker_id]
            injured = global->objects[injured_id]
            file = injured->file
            injured_file_id = file->id

            # if attacker is freeze ball
            if (attacker->file->id == freeze_ball_dat and
                (injured_file_id == john_ball_dat or
                 injured_file_id == deep_ball_dat or
                 injured_file_id == dennis_ball_dat or
                 injured_file_id == woody_ball_dat or
                 injured_file_id == davis_ball_dat or
                 injured_file_id == dennis_chase_dat or
                 injured_file_id == jack_ball_dat))
              # 0042F89C
              injured = global->objects[injured_id]
              injured->team = attacker->team
              attacker = global->objects[attacker_id]
              injured = global->objects[injured_id]
              injured->owner = attacker->owner
              attacker = global->objects[attacker_id]
              injured = global->objects[injured_id]
              injured = global->objects[injured_id]
              injured = global->objects[injured_id]
              injured = global->objects[injured_id]
              injured->file = attacker->file
              injured->frame_id = rebounding_frame
              injured->frame_id = rebounding_frame
              injured->frame_id = rebounding_frame

              # 0042F90B

              # 0042F921
              itr = @itr
              effect = itr->effect
            elsif ((attacker->file->type == character_type or
                    attacker->weapon_type >= 0
                   ) and
                   (effect == fire_type_effect or
                    effect == burn_effect))
              # 0042FA10
              injured = global->objects[injured_id]
              injured->frame_id = hit_frame
            else
              injured = global->objects[injured_id]
              injured->frame_id = rebounding_frame
              attacker = global->objects[attacker_id]
              attacker_file_id = attacker->file->id
              injured = global->objects[injured_id]
              file = injured->file
              injured_file_id = file->id

              # 0042F9A6
              _unknown_objects_size = * (_4D82380 + @files)
              @files = global->files

              # if attacker is freeze 
              if (attacker_file_id == freeze_dat and
                  (injured_file_id == john_ball_dat or
                   injured_file_id == deep_ball_dat or
                   injured_file_id == dennis_ball_dat or
                   injured_file_id == woody_ball_dat or
                   injured_file_id == davis_ball_dat or
                   injured_file_id == dennis_chase_dat or
                   injured_file_id == jack_ball_dat
                  ) and
                  _unknown_objects_size > 0
                # 0042F9BC

                # the condition of the loop below
                for (object_id = 0;
                     object_id < _unknown_objects_size;
                     object_id++, @files++)
                  if (* @files)->id == freeze_ball_dat
                    # 0042F9DE
                    injured = global->objects[injured_id]
                    injured = global->objects[injured_id]
                    injured = global->objects[injured_id]
                    injured->file = global->files[object_id]
                    injured->frame_id2 = injured->frame_id1
                    injured->frame_id3 = injured->frame_id1
                    break
                  end
                end
              end # end if attacker is freeze 
            end # end if attacker is freeze ball
            # 0042FA1E
            attacker = global->objects[attacker_id]
            injured = global->objects[injured_id]

            # if attacker is holding weapon
            if attacker->weapon_type >= 0
              # 0042FB5E
              injured->move_counter = attacker_id
            else
              injured->move_counter = attacker->holder_id
              attacker = global->objects[attacker_id]
              injured = global->objects[injured_id]
              file = injured->file
              injured_file_id = file->id

              # if attacker is ice sword
              if (attacker->file->id == ice_sword_dat and
                  (injured_file_id == john_ball_dat or
                   injured_file_id == deep_ball_dat or
                   injured_file_id == dennis_ball_dat or
                   injured_file_id == woody_ball_dat or
                   injured_file_id == davis_ball_dat or
                   injured_file_id == dennis_chase_dat or
                   injured_file_id == jack_ball_dat))
                # 0042FAA6
                @files = global->files
                _unknown_objects_size = * (_4D82380 + @files)

                # the condition of the loop below
                if _unknown_objects_size > 0
                  # 0042FABC
                  for (object_id = 0;
                       object_id < _unknown_objects_size;
                       object_id++, @files++)
                    if (* @files)->id == freeze_ball_dat
                      # 0042FADE
                      injured = global->objects[injured_id]
                      injured = global->objects[injured_id]
                      injured = global->objects[injured_id]
                      injured->file = global->files[object_id]
                      injured->frame_id2 = injured->frame_id1
                      injured->frame_id3 = injured->frame_id1
                      break
                    end
                  end
                end
                # 0042FB0E
                attacker = global->objects[attacker_id]
                holder_id = attacker->holder_id
                holder = global->objects[holder_id]
                injured = global->objects[injured_id]
                injured->team = holder->team
                attacker = global->objects[attacker_id]
                holder_id = attacker->holder_id
                holder = global->objects[holder_id]
                injured = global->objects[injured_id]
                injured->owner = holder->owner
              end # end if attacker is ice sword
            end # end if attacker is holding weapon
          end # end if injured frame is changable
          # 0042FB60
          injured = global->objects[injured_id]
          frame_id = injured->frame_id
          file = injured->file
          injured_state = file->frames[frame_id].state
          attacker = global->objects[attacker_id]
          frame_id = attacker->frame_id
          file = attacker->file
          attacker_state = file->frames[frame_id].state

          # 0042FBA3
          injured = global->objects[injured_id]
          frame_id = injured->frame_id
          file = injured->file
          injured_state = file->frames[frame_id].state
          attacker = global->objects[attacker_id]
          frame_id = attacker->frame_id
          file = attacker->file
          attacker_state = file->frames[frame_id].state
          if (injured_state == henry_wind_state and
              attacker_state == henry_wind_state
             ) or
             (injured_state == john_biscuit_state and
              attacker_state == henry_wind_state)
             # 0042FBEA
             injured = global->objects[injured_id]
             injured = global->objects[injured_id]
             injured = global->objects[injured_id]
             injured = global->objects[injured_id]
             injured = global->objects[injured_id]
             injured->frame_id = hit_frame
             injured->wait_counter = 0
             injured->y_accl
             injured->pic_x_gain
             injured->z_accl
             attacker = global->objects[attacker_id]
             attacker = global->objects[attacker_id]
             attacker = global->objects[attacker_id]
             attacker = global->objects[attacker_id]
             attacker = global->objects[attacker_id]
             attacker->frame_id = hit_frame
             attacker->wait_counter = 0
             attacker->y_accl
             attacker->pic_x_gain
             attacker->z_accl
          end
          # 0042FC5B
          attacker = global->objects[attacker_id]

          # attacker and its holder shaking
          if attacker->weapon_type >= 0
            # 0042FC93
            if attacker->shaking > 0
              attacker->shaking = - attacker->shaking
            end
          else
            holder_id = attacker->holder_id
            holder = global->objects[holder_id]
            if holder->shaking > 0
              holder->shaking = - holder->shaking
            end
          end
        end # end if injured is attack
        # 0042FCAA
        itr = @itr
        effect = itr->effect

        # 0042FCBB
        injured = global->objects[injured_id]
        file = injured->file
        injured_type = file->type
        frame_id = injured->frame_id3
        file = injured->file
        injured_state = file->frames[frame_id].state
        if (effect == freeze_effect or
            effect == column_effect) and
            injured_type == character_type and
            injured_state != ice_state
          injured->frame_id = freeze_frame_start
          injured = global->objects[injured_id]
          injured = global->objects[injured_id]
          injured->wait_counter = 0
          func_417090 injured->x, 14
        end
        # 0042FD1D
        # 0042FDC6
      else
        # 0042FDF2
      end # end injured can be attacked when these conditions hold:
    else
      # 0043056E
    end # end normal attack
  end # end attack loop
end
