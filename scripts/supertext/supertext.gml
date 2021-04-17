///@arg x
///@arg y
///@arg string
///@arg sep
///@arg maxwidth
///@arg color
///@arg font
///@arg speed
///@arg sound
///@arg priority
///@arg pitchvariance
//
//
//                          IMPORTANT NOTE: This script requires the exclusive use of the following instnace-scope variables in whatever instance it is run in.
//
//                                          ST_whole_string
//                                          ST_working_string
//                                          ST_characters    (2d array)
//                                          ST_display_thresh
//                                          ST_display_index
//                                          ST_pause_timer

#macro ST_CHAR              0
#macro ST_CHAR_X            1
#macro ST_CHAR_LINE         2
#macro ST_CHAR_VERT_OFFSET  3
#macro ST_CHAR_COLOR        4
#macro ST_CHAR_FONT         5
#macro ST_CHAR_SPEED        6
#macro ST_CHAR_PAUSE        7
#macro ST_CHAR_SOUND        8
#macro ST_CHAR_PITCHVAR     9


var _x = argument0;
var _y = argument1;
var _string = argument2;
var _line_sep = argument3;
var _max_width = argument4;
var _current_color = argument5;
var _current_font = argument6;
var _current_speed = argument7;
var _current_sound = argument8;
var _priority = argument9;
var _current_pitchvar = argument10;




#region If this is a new string, reset appropriate variables and parse
if !variable_instance_exists(id, "ST_whole_string") {ST_whole_string = 0;}

if _string != ST_whole_string
{
    ST_whole_string = _string;
    ST_working_string = _string;
    ST_characters = 0;
    ST_display_thresh = 0;
    ST_display_index = 0;
    ST_pause_timer = 0;

    var _width_so_far = 0;
    var _current_line = 0;
    var _current_pause = 0;
    var _current_char;
    var _char_index;
    var _current_vert_offset = 0;
    draw_set_font(_current_font);

    while (ST_working_string != "")
    {
        // === Get current character and set up array if it doesn't exist
        _current_char = string_char_at(ST_working_string, 1);
        if is_array(ST_characters)  {_char_index = array_height_2d(ST_characters);}
        else                        {_char_index = 0;}


        // === Check for hash commands
        if (_current_char == "#") && (string_char_at(ST_working_string, 2) == "(")
        {
            var _hash_command = string_char_at(ST_working_string, 3);
            ST_working_string = string_delete(ST_working_string, 1, 3);         

            switch (_hash_command)
            {
                case "C":
                    if string_char_at(ST_working_string, 10) == ")"
                    {
                        var _new_color_r = real(string_copy(ST_working_string, 1, 3));
                        var _new_color_g = real(string_copy(ST_working_string, 4, 3));
                        var _new_color_b = real(string_copy(ST_working_string, 7, 3));
                        ST_working_string = string_delete(ST_working_string, 1, 10);

                        _current_color = make_color_rgb(_new_color_r, _new_color_g, _new_color_b);
                    }
                    else
                    {
                        show_error("SUPER_TEXT ERROR: INVALID HASH COMMAND", true);
                    }
                    continue;                   


                case "P":
                    var _close_pos = string_pos(")", ST_working_string);
                    _current_pause = real(string_copy(ST_working_string, 1, _close_pos - 1));
                    ST_working_string = string_delete(ST_working_string, 1, _close_pos);
                    continue;


                case "F":
                    var _comma_pos = string_pos(",", ST_working_string);
                    var _close_pos = string_pos(")", ST_working_string);

                    if (_comma_pos != 0) && (_comma_pos < _close_pos)
                    {
                        _current_font = asset_get_index(string_copy(ST_working_string, 1, _comma_pos - 1));
                        ST_working_string = string_delete(ST_working_string, 1, _comma_pos);


                        if string_char_at(ST_working_string, 1) == " "  {ST_working_string = string_delete(ST_working_string, 1, 1);}
                        _close_pos = string_pos(")", ST_working_string);
                        _current_vert_offset = real(string_copy(ST_working_string, 1, _close_pos - 1));
                        ST_working_string = string_delete(ST_working_string, 1, _close_pos);
                    }
                    else
                    {
                        _current_font = asset_get_index(string_copy(ST_working_string, 1, _close_pos - 1));
                        ST_working_string = string_delete(ST_working_string, 1, _close_pos);
                        _current_vert_offset = 0;
                    }
                    draw_set_font(_current_font);
                    continue;


                case "S":
                    var _close_pos = string_pos(")", ST_working_string);
                    _current_speed = real(string_copy(ST_working_string, 1, _close_pos - 1));
                    ST_working_string = string_delete(ST_working_string, 1, _close_pos);
                    continue;


                case "L":
                    if string_char_at(ST_working_string, 1) == ")"
                    {
                        ST_working_string = string_delete(ST_working_string, 1, 1);
                        _current_line += 1;
                        _width_so_far = 0;
                    }
                    else
                    {
                        show_error("SUPER_TEXT ERROR: INVALID HASH COMMAND", true);
                    }
                    continue;

                case "Z":
                    var _comma_pos = string_pos(",", ST_working_string);
                    var _close_pos = string_pos(")", ST_working_string);

                    if (_comma_pos != 0) && (_comma_pos < _close_pos)
                    {
                        _current_sound = asset_get_index(string_copy(ST_working_string, 1, _comma_pos - 1));
                        ST_working_string = string_delete(ST_working_string, 1, _comma_pos);


                        if string_char_at(ST_working_string, 1) == " "  {ST_working_string = string_delete(ST_working_string, 1, 1);}
                        _close_pos = string_pos(")", ST_working_string);
                        _current_pitchvar = real(string_copy(ST_working_string, 1, _close_pos - 1));
                        ST_working_string = string_delete(ST_working_string, 1, _close_pos);
                    }
                    else
                    {
                        _current_sound = asset_get_index(string_copy(ST_working_string, 1, _close_pos - 1));
                        ST_working_string = string_delete(ST_working_string, 1, _close_pos);
                        _current_pitchvar = 0;
                    }
                    continue;                   


                default:
                    show_error("SUPER_TEXT ERROR: INVALID HASH COMMAND", true); 
                    break;
            }

        }
        else
        {

            // === Check for character overflow and make new line if necessary
            if _max_width != -1
            {
                if _width_so_far + string_width(_current_char) > _max_width
                {
                    var k = _char_index;

                    while (ST_characters[k - 1, ST_CHAR] != " ")
                    {
                        k -= 1;
                        if ST_characters[k, ST_CHAR_X] == 0 {k = 0;}
                        if k == 0   {break;}
                    }

                    _current_line += 1;
                    _width_so_far = 0;

                    if (k != 0)
                    {
                        while (k < _char_index)
                        {
                            ST_characters[k, ST_CHAR_X] = _width_so_far;
                            ST_characters[k, ST_CHAR_LINE] = _current_line;

                            _width_so_far += string_width(ST_characters[k, ST_CHAR]);

                            k += 1;
                        }
                    }
                }
            }

            if _current_speed <= 0
            {
                show_error("SUPER_TEXT ERROR: SPEED MUST BE GREATER THAN 0", true);
            }

            // === Store data on current character
            ST_characters[_char_index, ST_CHAR] = _current_char;
            ST_characters[_char_index, ST_CHAR_X] = _width_so_far;
            ST_characters[_char_index, ST_CHAR_LINE] = _current_line;
            ST_characters[_char_index, ST_CHAR_COLOR] = _current_color;
            ST_characters[_char_index, ST_CHAR_FONT] = _current_font;
            ST_characters[_char_index, ST_CHAR_VERT_OFFSET] = _current_vert_offset;
            ST_characters[_char_index, ST_CHAR_SPEED] = _current_speed;         
            ST_characters[_char_index, ST_CHAR_PAUSE] = _current_pause;
            ST_characters[_char_index, ST_CHAR_SOUND] = _current_sound;
            ST_characters[_char_index, ST_CHAR_PITCHVAR] = _current_pitchvar;

            // === Make adjustments for next character
            _current_pause = 0;
            _width_so_far += string_width(_current_char);
            ST_working_string = string_delete(ST_working_string, 1, 1); 
        }

    }

}
#endregion

#region Everything Else
// === Increase ST_display_thresh and play sound
if ST_display_index < array_height_2d(ST_characters) - 1
{

    if ST_characters[ST_display_index + 1, ST_CHAR_PAUSE] != 0
    {
        if ST_pause_timer < ST_characters[ST_display_index + 1, ST_CHAR_PAUSE]
        {
            ST_pause_timer += 1;
        }
        else
        {
            ST_characters[ST_display_index + 1, ST_CHAR_PAUSE] = 0;
            ST_pause_timer = 0;
        }
    }
    else
    {
        ST_display_thresh += ST_characters[ST_display_index + 1, ST_CHAR_SPEED];

        if floor(ST_display_thresh) > ST_display_index
        {
            var _new_display_index = floor(ST_display_thresh);


            if _new_display_index > ST_display_index + 1
            {
                _new_display_index =  min(_new_display_index, array_height_2d(ST_characters) - 1);

                for(var z = ST_display_index + 1; z < _new_display_index; z += 1)
                {
                    if (ST_characters[z + 1, ST_CHAR_PAUSE] != 0)   {break;}
                }

                _new_display_index = z;

            }

            ST_display_index = min(_new_display_index, array_height_2d(ST_characters) - 1);
            if _current_sound != -1
            {
                var _pitch = random_range(1 - ST_characters[ST_display_index, ST_CHAR_PITCHVAR], 1 + ST_characters[ST_display_index, ST_CHAR_PITCHVAR]);
                audio_sound_pitch(ST_characters[ST_display_index, ST_CHAR_SOUND], _pitch);
                audio_play_sound(ST_characters[ST_display_index, ST_CHAR_SOUND], _priority, false);
            }
        }
    }
}



// === Draw Text On Screen
for (var i = 0; i <= ST_display_index; i += 1)
{
    draw_set_color(ST_characters[i, ST_CHAR_COLOR]);
    draw_set_font(ST_characters[i, ST_CHAR_FONT]);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    draw_text(_x + ST_characters[i, ST_CHAR_X], _y + ST_characters[i, ST_CHAR_VERT_OFFSET] + (ST_characters[i, ST_CHAR_LINE] * _line_sep), ST_characters[i, ST_CHAR]);
}


// === Return Done Value
if ST_display_index >= array_height_2d(ST_characters) - 1   {var _done = 1;}
else                                                        {var _done = 0;}

return _done;

#endregion