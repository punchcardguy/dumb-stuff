// this code base is horrible to work with

global.characters = {}; // character code : struct
global.customObjects = {};

instance_destroy(obj_custom_object);
instance_destroy(obj_custom_object_ext);

with (instance_create(0, 0, obj_custom_object))
{
	persistent = 1;
	image_alpha = 0;
	depth = -9999;
	mods = [];
	get_user_folder = function()
	{
		var startPath = "";
		
		if (os_type == os_android)
		{
			var temp = string_split(game_save_id, "/");
			var first_index = array_get_index("data", temp);
			startPath = "/storage/emulated/" + temp[first_index + 2];
		} 
		else
		{
			var temp = string_split(working_directory, "\\");
			startPath = "C:/Users/" + temp[3];
		}
		
		return startPath + "/Documents/pizza tower android/";
	}
	
	game_directory = get_user_folder();
	path = game_directory + "mods" + "/";
	
	if !directory_exists(game_directory)
		directory_create(game_directory);
	
	if !directory_exists(path)
		directory_create(path);
	
	ini_open(game_directory + "modloader_user.ini");
	
	var saved_path = ini_read_string("General", "saved_path", "");
	if saved_path != path
	{
		get_string_async("(This system was made by hoy_es_diciembre_1225 this code is being used for temporary purposes) Heya!\nJust to let you know that the afom folder is " + (saved_path == "" ? "" : "now ") + "located in:", path);
		ini_write_string("General", "saved_path", string(path));
	}
	
	ini_close();
	
	show_message_async(path);
	
	selected = 0;
	scrolling = 0;
	quote = @'"';
	
	scr_load_file = function(filename)
	{
		var _gml = "";
		if file_exists(filename)
		{
			var _file = buffer_load(filename);
			if buffer_get_size(_file) > 0
				_gml = buffer_read(_file, buffer_string);
			buffer_delete(_file); 
		}
		return _gml;
	}
	
	Mod = function(_file_path, _name, _desc, _enabled, _icon) constructor // constructors my beloved
	{
		file_path = _file_path;
		name = _name;
		desc = _desc;
		enabled = _enabled;
		was_enabled = _enabled;
		icon = _icon;
	}
	
	find_files_recursive = function(folder, ext, max)
	{
		var dirQueue = ds_queue_create();
		var fileArray = [];
		ds_queue_enqueue(dirQueue, folder);
		var startDepth = string_count("/", folder);
		
		while !ds_queue_empty(dirQueue)
		{
			var currDir = ds_queue_dequeue(dirQueue);
			for (var fold = file_find_first(currDir + "*", fa_directory);fold != "";fold = file_find_next())
			{
				var check = fold + "/";
				if directory_exists(currDir + check)
				{
					if max == undefined or string_count("/", currDir + check) - startDepth <= max
						ds_queue_enqueue(dirQueue, currDir + check);
				}
			}
			file_find_close();
			
			for (var file = file_find_first(currDir + "*" + ext, 0); file != ""; file = file_find_next())
			{
				if !directory_exists(currDir + file)
					array_push(fileArray, currDir + file);
			}
			file_find_close();
		}
		
		return fileArray;
	}
	
	editorTreeMin = function(v, max) // is this just cycle?
	{
		if v > max
			return max + (max - v);
		else
			return v;
	}
	
	for (var mods_name = file_find_first(path + "*", fa_directory); mods_name != ""; mods_name = file_find_next())
	{
		var _path = path + mods_name;
		if file_exists(_path + "/mod.json")
			var jsonstruct = json_parse(scr_load_file(_path + "/mod.json"));
		if file_exists(_path + "/icon.png")
			icon = sprite_add(_path + "/icon.png", 0, 0, 0, 0, 0);
		else
			icon = spr_null;
		ini_open(_path + "/mod.ini");
		array_push(mods, new Mod(_path, file_exists(_path + "/mod.json") ? jsonstruct.name : mods_name, file_exists(_path + "/mod.json") ? jsonstruct.desc : "Description is missing.", ini_read_real("Mod", "enabled", 0), icon));
		ini_close();
	}
	
	file_find_close();
	drawgui_event = @'
		draw_set_color(c_black);
		draw_set_alpha(0.5);
	    draw_rectangle(960,0,-100,540,false); 
		if array_length(mods) > 0
		{
	        for (var i = 0; i < array_length(mods); i++)
	        {
		        var m = mods[i];
				draw_set_alpha(1);
				draw_set_color(i == selected ? c_white : c_gray);
				draw_set_font(global.bigfont);
				draw_set_valign(fa_middle);
				draw_set_halign(fa_right);
				var width = string_width(concat(string_upper(m.name), " : ", m.enabled ? "ON" : "OFF"));
				var xscale = min(width, display_get_gui_width() - 20) / width;
				var lerp_var = scrolling;
				var x = editorTreeMin(125 + (25*(lerp_var-i)), 125)
				var y = display_get_gui_height() / 2 + ((i-(lerp_var+0.5)) * 55)
				draw_text_transformed(x + string_width(string_upper(m.name)), y, concat(string_upper(m.name), " : ", m.enabled ? "ON" : "OFF"), xscale, 1, 0);
			}
			draw_set_alpha(0.6);
			draw_set_color(c_black);
			draw_rectangle(0, 480, 960, 540, false);
			draw_set_alpha(1);
			draw_set_color(c_white);
			draw_set_font(global.smallfont);
			draw_set_halign(fa_center);
			draw_set_valign(fa_bottom);
			draw_text_ext_transformed(display_get_gui_width()/2, 500 + string_height(string_upper(mods[selected].desc)), string_upper(mods[selected].desc), 16, 900, 1, 1, 0);
			draw_sprite_stretched(mods[selected].icon, 0,  display_get_gui_width() - 120, 70, 100, 100);
		} 
		else
		{
			draw_set_alpha(1);
			draw_set_font(-1);
			draw_set_color(c_white);
			draw_set_valign(fa_center);
			draw_set_halign(fa_middle);
			draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2, string_hash_to_newline("NO MODS FOUND#PRESS X TO EXIT"), 2, 2, 0);
		} 
	';
	step_event = @'
		scr_getinput();
		
		if array_length(mods) == 0
		{
			if key_slap
			{
				instance_destroy();
				scr_soundeffect(sfx_enemyprojectile); 
			} 
			exit;
		}
		with obj_player1
			state = 18;
        move = (key_down2 - key_up2);
        selected += move;
		scrolling = lerp(scrolling,selected,0.1);
        selected = cycle(selected, 0, array_length(mods));
		
        if key_jump
        {
	        mods[selected].enabled = !mods[selected].enabled;
			ini_open(mods[selected].file_path + "/mod.ini");
			ini_write_real("Mod", "enabled", mods[selected].enabled);
			ini_close();
		}
		
        if key_slap2
        {
	        for (var i = 0, len = array_length(mods); i < len; i++)
			{
				var m = mods[i];
				
				if m.enabled
				{
					if directory_exists(m.file_path + "/objects")
					{
						for (var object_names = file_find_first(m.file_path + "/objects/" + "*", fa_directory); object_names != ""; object_names = file_find_next())
						{
							if asset_get_index(object_names) != -1
							{
								show_message_async("Object error for \"" + object_names + "\" : Cannot have a object with the same name as an already existing object");
								break;
							}
							
							global.customObjects[$ object_names] = 
							{
								file_path : m.file_path + "/objects/" + object_names + "/",
								events : {}
							};
						}
						
						file_find_close();
						
						for (var j = 0, names = variable_struct_get_names(global.customObjects), glen = array_length(names); j < glen; j++)
						{
							for (var event_names = file_find_first(global.customObjects[$ names[j]].file_path + "*.gml", 0); event_names != ""; event_names = file_find_next())
								global.customObjects[$ names[j]].events[$ string_replace_all(event_names, ".gml", "")] = scr_load_file(global.customObjects[$ names[j]].file_path + event_names);
							file_find_close();
							
							global.gml_const_map[$ names[j]] = true;
							global.gml_const_val[$ names[j]] = global.customObjects[$ names[j]];
						}
						
						// get_string_async(global.customObjects, "");
					}
					
					/* live_function_add("instance_create(_x, _y, _obj)", function(_x, _y, _obj)
					{
						if !is_struct(_obj)
							instance_create(_x, _y, _obj);
						else
						{
							myobj = instance_create(_x, _y, obj_custom_object);
							with myobj
							{
								sprite = 0;
								if _obj.events[$ "create"] != undefined
								{
									snippet = live_snippet_create(_obj.events.create);
									_func = asset_get_index(script_get_name(method(self, live_snippet_call))); // prevent game from going bat shit insane
									_func(snippet);
							 	}
							}
							
							return myobj;
						}
					}); */
					
					if file_exists(m.file_path + "/init.gml")
					{
						var api = "";
						api += string("globalvar MOD_PATH = \"" + m.file_path + "\";#globalvar MOD_GLOBAL = {};#");
						var snippet = live_snippet_create(string_hash_to_newline(api + "#") + scr_load_file(m.file_path + "/init.gml"));
						if live_snippet_call(snippet){} else get_string_async("Your mod fucked up!", "Runtime error for mod : " + quote + m.name + quote  + " in init.gml\n" + global.live_result);
					}
				}
				else if m.was_enabled != m.enabled && !m.enabled && file_exists(m.file_path + "/cleanup.gml")
				{
					var api = "";
					api += string("globalvar MOD_PATH = \"" + m.file_path + "\";#globalvar MOD_GLOBAL = {};#");
					var snippet = live_snippet_create(string_hash_to_newline(api + "#") + scr_load_file(m.file_path + "/cleanup.gml"))
					if live_snippet_call(snippet){} else get_string_async("Your mod fucked up!", "Runtime error for mod : " + quote + m.name + quote  + " in cleanup.gml\n" + global.live_result);
				}
			}
			instance_destroy();
			scr_soundeffect(sfx_enemyprojectile);
			obj_player.state = 0;
		}
    ';docommand("reload_gml")
}
