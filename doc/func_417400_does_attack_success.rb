# 0x00417400
def func_417400_does_attack_success(global, attacker_id, injured_id)
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
    @_var20 = 0
    if @injured_frame->bdys_size <= 0
      next
    end
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
      next
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
      next
    end
    # 0041753D
    if @itr_kind == itr_normal_attack
      effect = @itr->effect
      injured = global->objects[injured_id]
      file = injured->file
      injured_type = file->type
      if (effect == shrafe_effect and
          injured_type == character_type)
        next
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
        next
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
        next
      end
      # 00417636
      injured = global->objects[injured_id]
      injured_frame_id = injured->frame_id

      # freeze column can't attack the one is freezed.
      if (effect == column_effect and
          injured_frame_id >= freeze_frame_start and
          injured_frame_id <= freeze_frame_end)
        next
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
        next
      end
    end
    # 004176AC
    injured = global->objects[injured_id]
    file = injured->file
    injured_type = file->type
    if (@itr_kind == itr_heal and
        injured_type != character_type)
      next
    end
    # 004176CB
    injured = global->objects[injured_id]

    # only healball, stone, and box can attack the one is invincible
    if (injured->invincible_time != 0 and
        @itr_kind != itr_heal and
        @itr_kind != itr_stop)
      next
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
          next
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
      next
    end
    # 00417919
  end
end
