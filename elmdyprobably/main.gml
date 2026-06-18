gml

global.lap4times =
{
    entrance_10: 4,
    entrance_9: 5,
    entrance_8: 10,
    entrance_7: 7,
    entrance_6: 2,
    entrance_6c: 8,
    entrance_5: 3,
    entrance_4: 5,
    entrance_3: 4,
    entrance_2: 3,
    entrance_1: 5,
    entrance_lap: 1,
    entrance_treasure: 3,

    medieval_10: 3,
    medieval_9b: 5,
    medieval_9: 5,
    medieval_7: 5,
    medieval_6: 3,
    medieval_5: 5,
    medieval_4: 6,
    medieval_3: 5,
    medieval_2: 8,
    medieval_1: 4,
    medieval_treasure: 3,

    ruin_11: 4,
    ruin_12: 11,
    ruin_13: 9,
    ruin_8: 3,
    ruin_7: 5,
    ruin_6: 6,
    ruin_5: 7,
    ruin_1: 3,
    ruin_treasure: 3,

    dungeon_10: 4,
    dungeon_9: 5,
    dungeon_8: 11,
    dungeon_7: 8,
    dungeon_6: 10,
    dungeon_5: 7,
    dungeon_4: 6,
    dungeon_3: 13,
    dungeon_2: 10,
    dungeon_1: 1,
    dungeon_treasure: 3,

    badland_10: 4,
    badland_6: 5,
    badland_7: 8,
    badland_3: 14,
    badland_2: 6,
    badland_1: 4,
    badland_treasure: 3,

    graveyard_6: 4,
    graveyard_5c: 8,
    graveyard_3: 6,
    graveyard_2: 3,
    graveyard_7: 4,
    graveyard_8: 6,
    graveyard_9: 10,
    graveyard_10: 7,
    graveyard_1: 8,
    graveyard_treasure: 3,

    farm_11: 3,
    farm_12: 7,
    farm_12b: 7,
    farm_13: 14,
    farm_4: 4,
    farm_1: 3,
    farm_2: 1,
    farm_treasure: 3,

    saloon_6: 3,
    saloon_5: 7,
    saloon_4: 16,
    saloon_3: 6,
    saloon_2: 10,
    saloon_1: 12,
    saloon_treasure: 3,

    plage_cavern2: 3,
    plage_cavern3: 7,
    plage_beach2: 5,
    plage_shipmain: 5,
    plage_shiptop: 12,
    plage_beach1: 10,
    plage_entrance: 5,
    plage_treasure: 3,

    forest_john: 8,
    forest_escape2: 12,
    forest_G5: 4,
    forest_escape1: 8,
    forest_G3: 4,
    forest_G2: 5,
    forest_G1: 8,
    forest_3: 4,
    forest_2: 5,
    forest_1: 4,
    forest_treasure: 3,

    space_9: 2,
    space_10: 7,
    space_11: 9,
    space_11b: 11,
    space_12: 15,
    space_1: 2,
    space_treasure: 3,

    minigolf_8: 4,
    minigolf_9: 10,
    minigolf_10: 6,
    minigolf_11: 15,
    minigolf_4: 13,
    minigolf_3: 12,
    minigolf_2: 6,
    minigolf_1: 6,

    street_john: 4,
    street_5: 15,
    street_4: 15,
    street_jail: 4,
    street_3: 7,
    street_2: 6,
    street_1: 5,
    street_intro: 2,

    industrial_5: 9,
    industrial_4: 9,
    industrial_3: 18,
    industrial_2: 10,
    industrial_1: 12,
    industrial_treasure: 3,

    sewer_8: 2,
    sewer_9: 13,
    sewer_10: 22,
    sewer_11: 13,
    sewer_12: 14,
    sewer_2: 3,
    sewer_1: 7,
    sewer_treasure: 3,

    freezer_escape1: 2,
    freezer_13: 3,
    freezer_12: 5,
    freezer_9: 3,
    freezer_7: 11,
    freezer_4: 8,
    freezer_3: 4,
    freezer_2: 9,
    freezer_1: 7,
    freezer_treasure: 3,

    chateau_9: 11,
    chateau_8: 10,
    chateau_7: 16,
    chateau_6: 1,
    chateau_5: 6,
    chateau_2: 9,
    chateau_1: 2,
    chateau_treasure: 3,

    kidsparty_john: 3,
    kidsparty_floor4_3: 8,
    kidsparty_escape1: 5,
    kidsparty_floor3_1: 7,
    kidsparty_floor2_3: 2,
    kidsparty_escape2: 6,
    kidsparty_floor1_3: 6,
    kidsparty_floor1_2: 7,
    kidsparty_floor1_1: 6,
    kidsparty_1: 3,
    kidsparty_treasure: 3,

    war_1: 3,
    war_2: 13,
    war_3: 8,
    war_6: 12,
    war_7: 11,
    war_8: 11,
    war_9: 9,
    war_10: 4,
    war_11: 9,
    war_12: 18,
    war_12b: 12,
    war_13: 5,

    tower_finalhallway: 4,
    tower_5: 8,
    tower_escape1: 5,
    tower_escape2: 7,
    tower_escape3: 6,
    tower_4: 10,
    tower_escape4: 10,
    tower_escape5: 12,
    tower_escape6: 12,
    tower_3: 12,
    tower_escape7: 8,
    tower_escape8: 10,
    tower_escape9: 9,
    tower_2: 10,
    tower_escape10: 9,
    tower_escape11: 12,
    tower_escape12: 10,
    tower_1: 6,
    tower_entrancehall: 3
};

instance_destroy(obj_custom_object_ext);
with (instance_create(0, 0, obj_custom_object_ext))
{
	persistent = true;
	image_alpha = 0;
	download_queue = ds_queue_create();
	enum asset_type_dl
	{
		sprite,
		sound
	}
	downloading = false;
	downloadFile = function(_file, _filename, _type = asset_type_dl.sprite, _frames = 1, xorigin = 0, yorigin = 0) // this could be a constructor but im reusing code so it doesn't matter
	{
		var q =
		{
			file : _file, 
			name : _filename,
			frames : _frames,
			xo : xorigin,
			yo : yorigin,
			type : _type
		};
		
		ds_queue_enqueue(download_queue, q);
	}
	downloadFile("https://raw.githubusercontent.com/randomguy1177/PTEM-gmls/refs/heads/main/elmdyprobably/spr_lap4timer.png", "spr_lap4timer.png", asset_type_dl.sprite, 1, 0, 200);
	downloadFile("https://raw.githubusercontent.com/randomguy1177/PTEM-gmls/refs/heads/main/elmdyprobably/spr_mrskelly_idle.png", "spr_mrskelly_idle.png", asset_type_dl.sprite, 3, 0, 200);
	downloadFile("https://raw.githubusercontent.com/randomguy1177/PTEM-gmls/refs/heads/main/elmdyprobably/spr_mrskelly_timelow.png", "spr_mrskelly_timelow.png", asset_type_dl.sprite, 6, 0, 200);
	downloadFile("https://github.com/randomguy1177/PTEM-gmls/raw/refs/heads/main/elmdyprobably/losetime.ogg", "sfx_losetime.ogg", asset_type_dl.sound);
	s = 1 / 60;
	tseconds = 20;
	prev_tseconds = 20;
	offset = -200;
	ind = 0;
	event.step[0] = @'
		ind += 0.35;
		if !ds_queue_empty(download_queue) && !downloading
		{
			var d = ds_queue_head(download_queue);

			if !file_exists(d.name)
			{
				downloading = true;
			    http_get_file(d.file, d.name);
			} 
			else
			{
				if d.type == 0
				{
					var _spr = sprite_add(d.name, d.frames, false, false, d.xo, d.yo);
					sprite_set_speed(_spr, 60, 60);
					variable_global_set(string_replace_all(d.name, ".png", ""), _spr);
				}
				else if d.type == 1
					variable_global_set(string_replace_all(d.name, ".ogg", ""), audio_create_stream(d.name));
				ds_queue_dequeue(download_queue);
			} 
		}
		
		if floor(prev_tseconds) != floor(tseconds) && variable_global_exists("sfx_losetime")
		{
			scr_soundeffect(variable_global_get("sfx_losetime"));
			prev_tseconds = tseconds;
		}
		
		tseconds = max(tseconds - s, 0);
		offset = Approach(offset, 0, 2);
	;'
	event.http[0] = @';
		var status = async_load[? "status"];
		if status == 0
		{
		    var d = ds_queue_head(download_queue);
			
			if file_exists(d.name)
			{
				if d.type == 0
				{
					var _spr = sprite_add(d.name, d.frames, false, false, d.xo, d.yo);
					sprite_set_speed(_spr, 60, 60);
					variable_global_set(string_replace_all(d.name, ".png", ""), _spr);
				}
				else if d.type == 1
					variable_global_set(string_replace_all(d.name, ".ogg", ""), audio_create_stream(d.name));
			}
			ds_queue_dequeue(download_queue);
			downloading = false;
		}
		else
		{
			ds_queue_dequeue(download_queue);
			downloading = false;
		} 
	';
	event.draw_gui[0] = @'
		sr = function(arg0) {if !variable_global_exists(arg0) || !sprite_exists(variable_global_get(arg0)) return spr_player_idle; return variable_global_get(arg0);}
		
		draw_set_font(global.bigfont);
		draw_set_alpha(1);
		
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		
		
		var _minutes = floor(tseconds / 60);
		var _seconds = floor(tseconds mod 60);
		
		var _check = (_seconds <= 3 && _minutes <= 0);
		
		draw_sprite_ext(sr("spr_lap4timer"), 0, 0, display_get_gui_height() - offset, 1, 1, 0, c_white, 1);
		draw_set_color(_check ? c_red : c_white);
		draw_text(87 + (_check ? irandom_range((4 - _seconds) * - 1, (4 - _seconds)) : 0), display_get_gui_height() - 100 - offset + (_check ? irandom_range((4 - _seconds) * - 1, (4 - _seconds)) : 0), string(_minutes) + ":" + ((_seconds < 10 ? "0" : "") + string(_seconds)));
		draw_sprite_ext(_check ? sr("spr_mrskelly_timelow") : sr("spr_mrskelly_idle"), ind, 0, display_get_gui_height() - offset, 1, 1, 0, c_white, 1);
	';
	event.room_start[0] = @'
		if global.lap4times[$ room_get_name(room)] != undefined
			tseconds += global.lap4times[$ room_get_name(room)];
	;'
	docommand("reload_gml");
}
