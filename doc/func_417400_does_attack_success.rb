# 0x00417400
def func_417400_does_attack_success(global, attacker_id, injured_id, mode)
  attacker = global->objects[attacker_id]
  frame_id = attacker->frame_id
  file = attacker->file
  @attacker_frame = &file->frames[frame_id]
  injured = global->objects[injured_id]
  frame_id = injured->frame_id
  file = injured->file
  @injured_frame = &file->frames[frame_id]

  # the condition of the loop
  # 00417F59
  for (@itr_id = 0; @itr_id < @attacker_frame->itrs_size; @itr_id++)
    # 00417465
    @itr = &@attacker_frame->itrs[@itr_id]

    # the condition of the loop
    # 00417F3E
    for (@bdy_id = 0; @bdy_id < @injured_frame->bdys_size; @bdy_id++)
      # 00417492
      attacker = global->objects[attacker_id]
      @attacker_file = attacker->file
      @attacker_file_id = @attacker_file->id

      # 004174E2
      injured = global->objects[injured_id]
      file = injured->file
      injured_file_id = file->id

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

      # 00417510
      @itr_kind = @itr->kind
      injured = global->objects[injured_id]
      file = injured->file
      injured_type = file->type

      # can only catch character
      if (@itr_kind == itr_catch and
          injured_file != character_type)
        break
      end
      # 0041753D
      if @itr_kind == itr_normal_attack
        effect = @itr->effect
        injured = global->objects[injured_id]
        file = injured->file
        injured_type = file->type
        if (effect == shrafe_effect and
            injured_type == character_type)
          break
        end
        # 0041756E
        injured = global->objects[injured_id]
        file = injured->file
        injured_type = file->type
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        injured_state = file->frames[frame_id].state
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        injured_state = file->frames[frame_id].state
        if (effect == fire_effect and
            (injured_type != character_type or
             injured_state == fire_state or
             injured_state == burn_run_state))
          break
        end
        # 004175E1
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        injured_state = file->frames[frame_id].state
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        injured_state = file->frames[frame_id].state
        if (effect == burn_effect and
            (injured_state == fire_state or
             injured_state == burn_run_state))
          break
        end
        # 00417636
        injured = global->objects[injured_id]
        injured_frame_id = injured->frame_id

        # freeze column can't attack the one is freezed.
        if (effect == column_effect and
            injured_frame_id >= freeze_frame_start and
            injured_frame_id <= freeze_frame_end)
          break
        end
        # 0041765B
        attacker = global->objects[attacker_id]
        frame_id = attacker->frame_id
        file = attacker->file
        attacker_state = file->frames[frame_id].state
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        injured_state = file->frames[frame_id]

        # burn run skill can't attack the one is burning.
        if (effect == fire_effect and
            attacker_state == burn_run_state and
            injured_state == fire_state)
          break
        end
      end
      # 004176AC
      injured = global->objects[injured_id]
      file = injured->file
      injured_type = file->type
      if (@itr_kind == itr_heal and
          injured_type != character_type)
        break
      end
      # 004176CB
      injured = global->objects[injured_id]

      # only healball, stone, and box can attack the one is invincible
      if (injured->invincible_time != 0 and
          @itr_kind != itr_heal and
          @itr_kind != itr_stop)
        break
      end
      # 004176EE
      file = injured->file
      injured_type = file->type

      # 0041770C

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
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        injured_state = file->frames[frame_id].state
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        injured_state = file->frames[frame_id].state
        file = injured->file
        injured_file_id = file->id
        attacker = global->objects[attacker_id]

        # 004177B5

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
          attacker = global->objects[attacker_id]
          attacker = global->objects[attacker_id]
          frame_id = attacker->frame_id
          file = attacker->file
          attacker_state = file->frames[frame_id]
          effect = @itr->effect

          # 0041781C
          attacker_type = @attacker_file->type
          injured_type = file->type

          # 00417840
          injured_type = file->type

          # 00417862

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
      attacker = global->objects[attacker_id]
      holder_id = attacker->holder_id
      holder = global->objects[holder_id]
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id].state
      file = injured->file
      injured_type = file->type
      injured_file_id = file->id
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
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        @frame = &file->frames[frame_id]
        injured_centerx = @frame->centerx
        bdy_left_boundary = injured->x - injured_centerx + bdy_x
      else
        # 00417988
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        @frame = &file->frames[frame_id]
        injured_centerx = @frame->centerx
        bdy_left_boundary = injured->x + injured_centerx - @bdy_w - bdy_x
      end
      # 004179BD
      injured_centery = @frame->centery
      @bdy_top_boundary = injured->y - injured_centery + @bdy_y
      attacker = global->objects[attacker_id]
      frame_id = attacker->frame_id
      file = attacker->file
      frame = &file->frames[frame_id]
      attacker_x = attacker->x
      attacker_y = attacker->y
      if attacker->facing == facing_right
        attacker_centerx = frame->centerx
        itr_left_boundary = attacker_x - attacker_centerx + itr_x
      else
        # 004179FF
        attacker_centerx = frame->centerx
        @frame = frame
        itr_left_boundary = attacker_x + attacker_centerx - @itr->w - itr_x
      end
      # 00417A18
      @in_z_boundary = false
      attacker_centery = frame->centery
      itr_top_boundary = attacker_y - attacker_centery + itr_y
      itr_zwidth = @itr->zwidth
      if itr_zwidth == 0
        # 00417A38
        itr_zwidth = 15
      end
      # 00417A38
      attacker = global->objects[attacker_id]
      @injured = global->objects[injured_id]
      z_distance = attacker->z - @injured->z
      if (z_distance < itr_zwidth and
          z_distance > - itr_zwidth)
        in_z_boundary = true
      else
        # 00417A67
        in_z_boundary = @in_z_boundary
      end
      # 00417A6B
      is_overlap = func_4171C0_is_itr_bdy_overlap(
        bdy_left_boundary, @bdy_top_boundary, @bdy_w, @bdy_h,
        itr_left_boundary, itr_top_boundary, @itr->w, @itr->h
      )
      if !is_overlap or !in_z_boundary
        next
      end
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id].state
      is_attack_success = bool_initial
      itr_fall = @itr->fall
      itr_kind = @itr->kind
      if (injured_state == falling_state and
          itr_fall <= 40 and
          itr_kind != itr_flute and
          itr_kind != itr_float)
        is_attack_success = bool_false
      end
      # 00417AE2
      attacker_file = @attacker_file
      if mode == stage_mode
        can_rescue_criminal = false
        attacker_type = attacker_file->type
        attacker_file_id = attacker_file->id

        # 00417B0F
        attacker = global->objects[attacker_id]

        # 00417B2A
        if (attacker_type == character_type or
            attacker_file_id == henry_arrow1_dat or
            attacker_file_id == rudolf_weapon_dat) and
            attacker->team != stage_enemy_team
          can_rescue_criminal = true
        end
        # 00417B2E
        attacker = global->objects[attacker_id]
        holder_id = attacker->holder_id
        is_holder_exists = global->is_object_exists[holder_id]
        holder = global->objects[holder_id]
        file = holder->file
        holder_type = file->type
        if (attacker->weapon_type < 0 and
            is_holder_exists and
            holder_type == character_type and
            holder->team != stage_enemy_team)
          can_rescue_criminal = true
        end
        # 00417B6F
        if (@bdy_kind >= 1000 and
            !can_rescue_criminal)
          is_attack_success = bool_false
        end
      else
        # 00417B82
      end
      # 00417B86
      itr_vrest = @itr->vrest
      itr_kind = @itr->kind
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id].state
      attacker_type = attacker_file->type
      attacker = global->objects[attacker_id]

      # 00417BF9
      if (itr_vrest == 0 and
          itr_kind != itr_catch_injured and
          itr_kind != itr_pick_up_weapon and
          itr_kind != itr_rowing_pick and
          (injured_state != on_ground_state_1 or
           (attacker_type > character_type and
            attacker->weapon_type >= 0)
          ) and
          is_attack_success == bool_initial)
        attacker = global->objects[attacker_id]
        x_distance = attacker->x - @injured->x
        if (attacker->weapon_type < 0 and
            attacker->holder_id == injured_id)
          x_distance = 2000
        else
          # 00417C2F
          holder = global->objects[holder_id]
          x_distance = holder->x - @injured->x
        end
        # 00417C3B
        if x_distance < 0
          x_distance = - x_distance
        end
        # 00417C41
        attacker = global->objects[attacker_id]
        if (x_distance > attacker->attackable_distance or
            (x_distance == attacker->attackable_distance and
            func_417170_random(2) != 0))
          next
        end
        # 00417C6F
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
      attacker = global->objects[attacker_id]
      if (attacker->successful_attacks >= 20 or
          is_attack_success != bool_initial)
        next
      end
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id].state
      attacker_type = attacker_file->type

      # 00417D07
      itr_kind = @itr->kind
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
      if @itr->kind == itr_catch_injured
        # jns short 00417D38
        x_distance = attacker->x - @injured->x
        if x_distance > 0
          x_distance = - x_distance
        end
        # 00417D38
        if (x_distance < @injured->vulnerable_distance or
            (x_distance == @injured->vulnerable_distance and
             func_417170_random(2) == 0))
          # 00417D5E
          injured = global->objects[injured_id]
          injured->vulnerable_distance = x_distance
        else
          # 00417D57
          is_attack_success = bool_false
        end
      end
      # 00417D6F
      itr_kind = @itr->kind
      attacker = global->objects[attacker_id]
      if (itr_kind == itr_thrown and
          attacker->thrown_injury != 0 and
          is_attack_success != bool_false)
        is_attack_success = bool_true
      end
      # 00417D92

      # 00417DA3
      attacker = global->objects[attacker_id]
      injured = global->objects[injured_id]

      # 00417DC6
      injured = global->objects[injured_id]

      # 00417DE2
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id]
      if (itr_kind == itr_catch_injured and
          ((attacker->click_right and attacker->x <  injured->x) or
           (attacker->click_left  and attacker->x >= injured->x)
          ) and
          injured_state == picked_caught_state and
          is_attack_success != bool_false)
        is_attack_success = bool_true
      end
      if (itr_kind != itr_catch_injured and
          itr_kind != itr_pick_up_weapon and
          itr_kind != itr_rowing_pick and
          is_attack_success != bool_false)
        is_attack_success = bool_true
      end
      # 00417E10
      if itr_kind == itr_pick_up_weapon
        # 00417E19
        attacker = global->objects[attacker_id]
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        injured_state = file->frames[frame_id]
        if (attacker->weapon_type == null and
            attacker->click_attack and
            !attacker->holding_attack and
            injured_state == on_ground_state_1 and
            is_attack_success != bool_false)
          is_attack_success = bool_true
        end
        # 00417E70
        injured = global->objects[injured_id]
        frame_id = injured->frame_id
        file = injured->file
        injured_state = file->frames[frame_id]
        if (attacker->click_attack and
            !attacker->holding_attack and
            injured_state == on_ground_state_2 and
            is_attack_success != bool_false)
          is_attack_success = bool_true
        end
      end
      # 00417EB5

      # 00417EB9
      attacker = global->objects[attacker_id]
      injured = global->objects[injured_id]
      frame_id = injured->frame_id
      file = injured->file
      injured_state = file->frames[frame_id]

      # 00417EFF
      if ((itr_kind == itr_rowing_pick and
           attacker->click_attack and
           !attacker->holding_attack and
           injured_state == on_ground_state_1 and
           is_attack_success != bool_false
          ) or
          is_attack_success == bool_true)
        # 00417F04
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
