// 小孩子不懂事随便写的

const TEXTURE_BG = false;
const TEXTURE_LOGO = false;
const LOW_BODER = false;

var PREVIEW_OPEN = true;

const version = "0.0.0";
const version_ui = "1.0";
const last_update = "0000/00/00";

/////////////////////////////////////////////////
//                                             //
//                                             //
//                                             //
////////////////////////////////////////////////























/////////////////////////////////////////////////
//                                             //
//                Advanced GUI                 //
//                                             //
////////////////////////////////////////////////


const TEXTURE_BG_ALPHA = 200;

const style = {
    // fonts
    title_font: "segoeuib.ttf",
    main_font: "segoeui.ttf",
    title_font_size: 15,
    main_font_size: 14,
    // colors
    window_bg_col: [30, 30, 34, 255],//[30, 30, 34, 255] //背景色调
    window_border_col: [75, 75, 74, 255], //分割色调
    window_primary_col: [250, 166, 24, 255], //[250, 166, 24, 255] //主色调
    window_bg_col_on_text: [30, 30, 34, 255],//[30, 30, 34, 255] //背景色调
    frame_bg_col: [35, 35, 35, 255],
    frame_border_col: [40, 40, 40, 255],
    font_col: [255, 255, 255, 255],
    font_selected_col: [255, 255, 255, 255],
    font_hover_col: [255, 255, 255, 255],
    font_unselected_col: [255, 255, 255, 180],
    element_bg_col: [175, 175, 175, 255],//element_bg_col: [70, 70, 70, 255]
    element_dp_col: [220,220,220,225],
    element_bg_hovered_col: [255, 255, 255, 255],//element_bg_hovered_col: [100, 100, 100, 255]
    element_extra_col: [52, 52, 54, 255],
    element_key_bg_col: [35,35,40,255], //键位 背景
    element_key_edge_col: [44,44,48,255], //键位 边框
    shade_head_pic_col: [30, 30, 34, 255], //圆头像遮罩
    shade_head_pic_border: [75, 75, 74, 255], //方头像边框 
    adm_load_col: [255, 255, 255, 255], //动画颜色
    msg_pri_col: "\14",
    msg_sec_col: "\06",
    // options
    opt_tooltips: true,
};

var initialize_alpha = 0;
var initialize_alpha_load = 0;
var initialize_load_time = Global.Realtime()+2.5;
var initialize_adm = false;
var initialize_adm_loal_cr = 0;
var is_reloading = false;

const font = 0;
const globaltime = Globals.Realtime();
const sliding = false;
const num = 0.00;

const key_map = [
    0x41, //A
    0x42, //B
    0x43, //C
    0x44, //D
    0x45, //E
    0x46, //F
    0x47, //G
    0x48, //H
    0x49, //I
    0x4A, //J
    0x4B, //K
    0x4C, //L
    0x4D, //M
    0x4E, //N
    0x4F, //O
    0x50, //P
    0x51, //Q
    0x52, //R
    0x53, //S
    0x54, //T
    0x55, //U
    0x56, //V
    0x57, //W
    0x58, //X
    0x59, //Y
    0x5A, //Z
    0x10, //shift no.26
    0x11, //ctrl
    0x12, //alt
    0x14, //caps
    0x21, //page up
    0x22, //page down
    0x25, //left
    0x26, //up
    0x27, //right
    0x28, //down
    0x1B, //esc
    0x70, //F1
    0x71, //F2
    0x72, //F3
    0x73, //F4
    0x74, //F5
    0x75, //F6
    0x76, //F7
    0x77, //F8
    0x78, //F9
    0x79, //F10
    0x7A, //F11
    0x7B, //F11
    0x01, //M1
    0X02, //M2
    0x04 //MM
];
function get_key_id ( key )
{
    for( var i =0; i<key_map.length;++i )
    {
        if ( key == key_map[i] )
        {
            return i;
        }
    }
    return -1;
}
function get_key_name( key )
{
    const key_id = get_key_id(key);
    if ( key_id >= 0 && key_id <= 25 )
    {
        return String.fromCharCode( key_id + 65 );
    }
    else
    {
        switch( key_id )
        {
            case 26: return "Shift";
            case 27: return "Ctrl";
            case 28: return "Alt";
            case 29: return "Caps";
            case 30: return "PGUP";
            case 31: return "PGDN";
            case 32: return "Left";
            case 33: return "Up";
            case 34: return "Right";
            case 35: return "Down";
            case 36: return "Esc";
            case 37: return "F1";
            case 38: return "F2";
            case 39: return "F3";
            case 40: return "F4";
            case 41: return "F5";
            case 42: return "F6";
            case 43: return "F7";
            case 44: return "F8";
            case 45: return "F9";
            case 46: return "F10";
            case 47: return "F11";
            case 48: return "F12";
            case 49: return "M1";
            case 50: return "M2";
            case 51: return "MM";    
        }
    }
}
function get_input_key()
{
    for( var i =0; i<key_map.length;++i )
    {
        if ( Input.IsKeyPressed(key_map[i]) )
        {
            return key_map[i];
        }
    }
}
function get_mouse() {
    const mouse = Input.GetCursorPosition();
    return {
        x: mouse[0],
        y: mouse[1]
    };
}
function inbox(x, y, x2, y2) {
    const mouse = get_mouse();
    if (mouse.x > x && mouse.x < x2 && mouse.y > y && mouse.y < y2)
        return true;
}
function get_textsize(text) {
    if (font == 0) {
        font = Render.GetFont(style.main_font, style.main_font_size, true);
    }
    const size = Render.TextSize(text, font);
    return {
        x: size[0],
        y: size[1]
    };
}
function create_string(x, y, aligned, text, color, isTitle) {
    if (font == 0 || font == Render.GetFont(style.title_font, style.title_font_size, true)) {
        font = Render.GetFont(style.main_font, style.main_font_size, true);
    }
    if (isTitle) {
        font = Render.GetFont(style.title_font, style.title_font_size, true);
    }
    Render.String(x, y, aligned, text, color, font);
}
function begin_menu(title, x, y, width, height) {
    update_variables();
    var cont = false;
    if ( TEXTURE_BG && (initialize_alpha_load > 254 || initialize_alpha > 64) && initialized != -1)
    {
        const texture = Render.AddTexture("ot/pictures/bg.jpg");
        if ( initialize_alpha > 128 )
        {
            Render.TexturedRect( x ,y,width, height, texture );
            Render.FilledRect(x, y, width, height, style.window_bg_col_on_text);
        }
        else
        {
            Render.FilledRect(x, y, width, height, style.window_bg_col);
        }
    }
    else
    {
        Render.FilledRect(x, y, width, height, style.window_bg_col);
    }

    Render.FilledRect(x, y, width, 1, style.window_primary_col);
    Render.FilledRect(x + 1, y - 2, width - 2, 2, style.window_primary_col);
    Render.FilledRect(x + 2, y - 3, width - 4, 1, style.window_primary_col);
    Render.FilledRect(x + 4, y - 4, width - 8, 1, style.window_primary_col);
    if ( LOW_BODER )
    {
        Render.FilledRect(x + 1, y + height, width - 2, 2, style.window_primary_col);
        Render.FilledRect(x + 2, y + height, width - 4, 3, style.window_primary_col);
        Render.FilledRect(x + 4, y + height, width - 8, 4, style.window_primary_col);
    }
    else
    {
        Render.FilledRect(x + 1, y + height, width - 2, 2, style.window_bg_col);
        Render.FilledRect(x + 2, y + height, width - 4, 3, style.window_bg_col);
        Render.FilledRect(x + 4, y + height, width - 8, 4, style.window_bg_col);
    }
    Render.Line(x, y + 65, x + width, y + 65, style.window_border_col);
    if ( LOW_BODER )
    {
        Render.Line(x + 140, y + 65, x + 140, y + height, style.window_border_col);
    }
    else
    {
        Render.Line(x + 140, y + 65, x + 140, y + height+2, style.window_border_col);
    }
    create_string(x + 25, y + 20, 0, title, style.font_col, true);
}
function create_tab(title, x, y, object) {
    if (!object) {
        create_string(x, y, 0, title, style.font_unselected_col);
        create_string(x, y, 0, title, style.font_unselected_col);
    } else {
        create_string(x, y, 0, title, style.font_selected_col);
        create_string(x, y, 0, title, style.font_selected_col);
    }
    const tabSize = get_textsize(title);
    if (inbox(x, y-10, x + tabSize.x, y + tabSize.y + 14)) {
        create_string(x, y, 0, title, style.font_hover_col);
        if ( initialize_alpha < 200)
        {
            return object;
        }
        if (Input.IsKeyPressed(0x01) && Globals.Realtime() > globaltime + 0.2) {
            globaltime = Globals.Realtime();
            object = !object;
        }
    }
    return object;
}
function create_checkbox(title, x, y, object, tooltip) {
    Render.FilledRect(x, y - 1, 11, 13, style.element_bg_col);
    Render.FilledRect(x - 1, y, 13, 11, style.element_bg_col);
    create_string(x + 18, y - 6, 0, title, style.font_col);
    if (inbox(x - 1, y - 1, x + 24 + get_textsize(title).x, y + 12)) {
        Render.FilledRect(x, y - 1, 11, 13, style.element_bg_hovered_col);
        Render.FilledRect(x - 1, y, 13, 11, style.element_bg_hovered_col);
        if (Input.IsKeyPressed(0x01) && Globals.Realtime() > globaltime + 0.2) {
            globaltime = Globals.Realtime();
            object = !object;
        }
    }
    if (object) {
        Render.Line(x + 2, y + 5, x + 4, y + 8, style.element_extra_col);
        Render.Line(x + 4, y + 8, x + 8, y + 2, style.element_extra_col);
    }
    return object;
}
function create_slider(title, x, y, max, value) {
    const min = 0;
    const mouse = get_mouse();
    create_string(x, y - 10, 0, title, style.font_col);
    const useable_value = value / max * 350;
    Render.FilledRect(x, y + 13, 350, 5, style.element_bg_col);
    Render.FilledRect(x + 1, y + 12, 348, 7, style.element_bg_col);
    if ((inbox(x-5, y + 8, x + 355, y + 25) || sliding) && Input.IsKeyPressed(0x01)) {
        if (inbox(x-5, y + 8, x + 355, y + 25) )
        {
            Render.FilledRect(x, y + 13, 350, 5, style.element_bg_hovered_col);
            Render.FilledRect(x + 1, y + 12, 348, 7, style.element_bg_hovered_col);
            const tsize = get_textsize(value.toString());
            Render.FilledRect(x + useable_value - (tsize.x / 2) - 4, y - 20, tsize.x + 10, 22, style.frame_bg_col);
            Render.FilledRect(x + useable_value - (tsize.x / 2) - 5, y - 19, tsize.x + 12, 20, style.frame_bg_col)
            create_string(x + useable_value, y - 20, 1, value.toString(), style.font_unselected_col);
        }
        if (Input.IsKeyPressed(0x01)&&inbox(x-5, y + 8, x + 355, y + 25) ) {
            sliding = true;
            const delta = 1 - (mouse.x - x + 350) / 350;
            value = Math.round(min + (min - max) * delta);
            if (value < 0)
                value = 0;
            if (value > max)
                value = max;
        }
    } else {
        sliding = false;
    }
    Render.FilledRect(x, y + 13, useable_value + 2, 5, style.window_primary_col);
    Render.FilledRect(x + 1, y + 12, useable_value, 7, style.window_primary_col);
    Render.FilledRect(x + useable_value - 2, y + 9, 5, 12, style.element_extra_col);
    Render.FilledRect(x + useable_value - 1, y + 8, 3, 14, style.element_extra_col);
    return value;
}
function create_dropdown(title, x, y, options) {
    create_string(x, y - 10, 0, title, style.font_col);
    Render.FilledRect(x, y + 14, 350, 23, style.frame_bg_col);
    Render.FilledRect(x + 1, y + 13, 348, 25, style.frame_bg_col);
    Render.Line(x + 1, y + 13, x + 349, y + 13, style.window_border_col);
    Render.Line(x + 349, y + 13, x + 350, y + 15, style.window_border_col);
    Render.Line(x + 350, y + 15, x + 350, y + 36, style.window_border_col);
    Render.Line(x + 350, y + 36, x + 349, y + 38, style.window_border_col);
    Render.Line(x + 349, y + 38, x + 1, y + 38, style.window_border_col);
    Render.Line(x + 1, y + 38, x, y + 36, style.window_border_col);
    Render.Line(x, y + 36, x, y + 15, style.window_border_col);
    Render.Line(x, y + 15, x + 1, y + 13, style.window_border_col);
    Render.Polygon([[x + 330, y + 23], [x + 340, y + 23], [x + 335, y + 30]], style.font_unselected_col);
    create_string(x + 10, y + 15, 0, options[1][options[0]], style.font_selected_col);
    if (inbox(x, y + 13, x + 350, y + 38)) {
        Render.Polygon([[x + 330, y + 23], [x + 340, y + 23], [x + 335, y + 30]], style.font_selected_col);
        create_string(x + 10, y + 15, 0, options[1][options[0]], style.font_selected_col);
        if (Input.IsKeyPressed(0x01) && Globals.Realtime() > globaltime + 0.2) {
            globaltime = Globals.Realtime();
            options[2] = !options[2];
        }
    }
    if (options[2]) {
        Render.Polygon([[x + 330, y + 23], [x + 340, y + 23], [x + 335, y + 30]], style.font_selected_col);
        create_string(x + 10, y + 15, 0, options[1][options[0]], style.font_selected_col);
        Render.Line(x + 1, y + 13, x + 349, y + 13, style.window_primary_col);
        Render.Line(x + 349, y + 13, x + 350, y + 15, style.window_primary_col);
        Render.Line(x + 350, y + 15, x + 350, y + 38, style.window_primary_col);
        Render.Line(x + 350, y + 38, x, y + 38, style.window_primary_col);
        Render.Line(x, y + 38, x, y + 15, style.window_primary_col);
        Render.Line(x, y + 15, x + 1, y + 13, style.window_primary_col);
        const totallength = 0;
        for (i = 0; i < options[1].length; i++) {
            totallength += 26;
            Render.FilledRect(x, y + 39 + (26 * i), 351, 26, style.window_border_col);
            if (options[0] == i) {
                create_string(x + 10, y + 39 + 26 * i, 0, options[1][i], style.window_primary_col);
            } else {
                create_string(x + 10, y + 39 + 26 * i, 0, options[1][i], style.font_unselected_col);
            }
            if (inbox(x, y + 37 + 26 * i, x + 350, y + 63 + 26 * i)) {
                if (options[0] == i) {
                    create_string(x + 10, y + 39 + 26 * i, 0, options[1][i], style.window_primary_col);
                } else {
                    create_string(x + 10, y + 39 + 26 * i, 0, options[1][i], style.font_unselected_col);
                }
                if (Input.IsKeyPressed(0x01) && Globals.Realtime() > globaltime + 0.2) {
                    globaltime = Globals.Realtime();
                    options[0] = i;
                    options[2] = !options[2];
                }
            }
        }
        Render.Line(x, y + 16, x, y + 38 + totallength, style.window_border_col);
        Render.Line(x, y + 37 + totallength, x + 1, y + 39 + totallength, style.window_border_col);
        Render.Line(x + 1, y + 39 + totallength, x + 349, y + 39 + totallength, style.window_border_col);
        Render.Line(x + 349, y + 39 + totallength, x + 350, y + 37 + totallength, style.window_border_col);
        Render.Line(x + 350, y + 37 + totallength, x + 350, y + 16, style.window_border_col);
        Render.Line(x, y + 36, x + 1, y + 38, style.window_primary_col);
        Render.Line(x + 349, y + 38, x + 350, y + 36, style.window_primary_col);
        if (!inbox(x, y + 16, x + 350, y + 41 + totallength) && Input.IsKeyPressed(0x01)) {
            options[2] = false;
        }
    }
    return options;
}
function create_mutidropdown(title, x, y, options) {
    create_string(x, y - 10, 0, title, style.font_col);
    Render.FilledRect(x, y + 14, 350, 23, style.frame_bg_col);
    Render.FilledRect(x + 1, y + 13, 348, 25, style.frame_bg_col);
    Render.Line(x + 1, y + 13, x + 349, y + 13, style.window_border_col);
    Render.Line(x + 349, y + 13, x + 350, y + 15, style.window_border_col);
    Render.Line(x + 350, y + 15, x + 350, y + 36, style.window_border_col);
    Render.Line(x + 350, y + 36, x + 349, y + 38, style.window_border_col);
    Render.Line(x + 349, y + 38, x + 1, y + 38, style.window_border_col);
    Render.Line(x + 1, y + 38, x, y + 36, style.window_border_col);
    Render.Line(x, y + 36, x, y + 15, style.window_border_col);
    Render.Line(x, y + 15, x + 1, y + 13, style.window_border_col);
    Render.Polygon([[x + 330, y + 23], [x + 340, y + 23], [x + 335, y + 30]], style.font_unselected_col);

    create_string(x + 10, y + 15, 0, "...", style.font_selected_col);
    
    if (inbox(x, y + 13, x + 350, y + 38)) {
        Render.Polygon([[x + 330, y + 23], [x + 340, y + 23], [x + 335, y + 30]], style.font_selected_col);
        create_string(x + 10, y + 15, 0, "...", style.font_selected_col);
        if (Input.IsKeyPressed(0x01) && Globals.Realtime() > globaltime + 0.2) {
            globaltime = Globals.Realtime();
            options[2] = !options[2];
        }
    }

    if (options[2]) {
        Render.Polygon([[x + 330, y + 23], [x + 340, y + 23], [x + 335, y + 30]], style.font_selected_col);
        create_string(x + 10, y + 15, 0, "...", style.font_selected_col);
        Render.Line(x + 1, y + 13, x + 349, y + 13, style.window_primary_col);
        Render.Line(x + 349, y + 13, x + 350, y + 15, style.window_primary_col);
        Render.Line(x + 350, y + 15, x + 350, y + 38, style.window_primary_col);
        Render.Line(x + 350, y + 38, x, y + 38, style.window_primary_col);
        Render.Line(x, y + 38, x, y + 15, style.window_primary_col);
        Render.Line(x, y + 15, x + 1, y + 13, style.window_primary_col);
        const totallength = 0;

        for (i = 0; i < options[0].length; i++) {
            totallength += 26;
            Render.FilledRect(x, y + 39 + (26 * i), 351, 26, style.window_border_col);
            if (options[0][i]) {
                create_string(x + 10, y + 39 + 26 * i, 0, options[1][i], style.window_primary_col);
            } else {
                create_string(x + 10, y + 39 + 26 * i, 0, options[1][i], style.font_unselected_col);
            }
            if (inbox(x, y + 37 + 26 * i, x + 350, y + 63 + 26 * i)) {
                if (options[0][i]) {
                    create_string(x + 10, y + 39 + 26 * i, 0, options[1][i], style.window_primary_col);
                } else {
                    create_string(x + 10, y + 39 + 26 * i, 0, options[1][i], style.font_unselected_col);
                }
                if (Input.IsKeyPressed(0x01) && Globals.Realtime() > globaltime + 0.2) {
                    
                        globaltime = Globals.Realtime();
                        options[0][i] = !options[0][i];
                }
            }
            else if ( !inbox(x, y + 37 + 26 , x + 350, y + 63 + 26 * options[0].length))
            {  
                if (Input.IsKeyPressed(0x01)  && Globals.Realtime() > globaltime + 0.2 ) {
                    globaltime = Globals.Realtime();
                    options[2] = !options[2];
                }
            }
        }
        
        
        Render.Line(x, y + 16, x, y + 38 + totallength, style.window_border_col);
        Render.Line(x, y + 37 + totallength, x + 1, y + 39 + totallength, style.window_border_col);
        Render.Line(x + 1, y + 39 + totallength, x + 349, y + 39 + totallength, style.window_border_col);
        Render.Line(x + 349, y + 39 + totallength, x + 350, y + 37 + totallength, style.window_border_col);
        Render.Line(x + 350, y + 37 + totallength, x + 350, y + 16, style.window_border_col);
        Render.Line(x, y + 36, x + 1, y + 38, style.window_primary_col);
        Render.Line(x + 349, y + 38, x + 350, y + 36, style.window_primary_col);
        if (!inbox(x, y + 16, x + 350, y + 41 + totallength) && Input.IsKeyPressed(0x01)) {
            options[2] = false;
        }
    }
    return options;
}
function create_key_binds( title, x, y ,options,disable_print ) //options= [key,state,type,last state], return options
{
    //user_subtab1_var.sub1 = create_key_binds("Mom killer",windows.x + 185, windows.y + 235,user_subtab1_var.sub1);
    if ( disable_print == null )
    {
        disable_print = false;
    }
    if( !disable_print )
    {
        Render.FilledRect(x-3, y-5, 352, 20, style.frame_bg_col);
        Render.Line(x - 2, y -5, x + 349, y - 5, style.window_border_col);
        Render.Line(x + 349, y - 5 , x + 350, y -3, style.window_border_col);
        Render.Line(x + 350, y -3 , x + 350, y + 13, style.window_border_col);
        Render.Line(x + 349, y + 13, x + 350, y + 15, style.window_border_col);
        Render.Line(x - 2, y + 15, x + 349, y + 15, style.window_border_col);
        Render.Line(x - 2, y - 5, x-3, y - 3, style.window_border_col);
        Render.Line(x - 3, y - 3, x-3, y + 13, style.window_border_col);
        Render.Line(x - 3, y + 13, x -2, y + 15, style.window_border_col);
        Render.FilledRect(x + 3, y - 1, 11, 13, style.element_bg_col);
        Render.FilledRect(x + 2, y, 13, 11, style.element_bg_col);
    }
    

    if ((inbox(x + 1, y - 4, x + 24 + get_textsize(title).x + 35, y + 19) || options[0] == "wait" )&&disable_print==false) {
        if( !disable_print )
        {
            Render.FilledRect(x + 3, y - 1, 11, 13, style.element_bg_hovered_col);
            Render.FilledRect(x + 2, y, 13, 11, style.element_bg_hovered_col);
        }
        if ( options[0] == "wait" && Globals.Realtime() > globaltime + 0.2)
        {
            var key = get_input_key();
            if ( key == 0x1B )
            {
                options[0] = null;
                globaltime = Globals.Realtime();
            }
            else if ( key != null )
            {
                options[0] = key;
                globaltime = Globals.Realtime();
            }
        }
        else if (Input.IsKeyPressed(0x01) && Globals.Realtime() > globaltime + 0.2)
        {
            globaltime = Globals.Realtime();
            options[0] = "wait";
        }

    }

    if ( (options[0] != null && options[0] != "wait") || (options[2] == 0) )
    {
        switch ( options[2] )
        {
            case 0:
                options[1] = true;
                break;
            case 1:
                if ( Input.IsKeyPressed(options[0]) )
                {
                    options[1] = true;
                }
                else
                {
                    options[1] = false
                }
                break;
            case 2:
                var press = Input.IsKeyPressed(options[0]);
                if ( !options[3] && press )
                {
                    options[1] = !options[1];
                }
                options[3] = press;
                break;           
            case 3:
                options[1] = false;
                break;
            default:
                options[1] = false;
                break;
        }
        if( disable_print == false )
        {
            if ( options[2] != 3 )
            {
                Render.Line(x + 4, y + 5, x + 6, y + 8, style.element_extra_col);
                Render.Line(x + 6, y + 8, x + 10, y + 2, style.element_extra_col);
            }
            if ( options[0] == null )
            {
                create_string(x + 18, y - 6, 0, "   ...    ", style.font_col);
                create_string(x + 18, y - 6, 0, " [    ]  " + title, style.font_col);
            }
            else
            {
                create_string(x + 18, y - 6, 0, " [ " + get_key_name(options[0]) + " ]  " + title, style.font_col);
            }
        }
    }
    else
    {
        if( disable_print == false )
        {
            if ( options[0] == "wait" )
            {
                create_string(x + 18, y - 6, 0, "   ...    ", style.window_primary_col);
                create_string(x + 18, y - 6, 0, " [    ]  " + title, style.font_col);
            }
            else
            {
                create_string(x + 18, y - 6, 0, "   ...    ", style.font_col);
                create_string(x + 18, y - 6, 0, " [    ]  " + title, style.font_col);
            }
        }
        options[1] = false
    }
    
    var key_type = "none";
    switch( options[2] )
    {
        case 0:
            key_type = "always";
            break;
        case 1:
            key_type = "hold";
            break;
        case 2:
            key_type = "toggle";
            break;
        case 3:
            key_type = "disable";
            break;
    }

    key_type = "[ " + key_type + " ] ";

    if ( disable_print == false )
    {
        if (inbox(x + 342 - get_textsize(key_type).x, y - 4, x + 350 , y + 19))
        {
            if ( Input.IsKeyPressed(0x01) && Globals.Realtime() > globaltime + 0.2)
            {
                globaltime = Globals.Realtime();
                options[2] = options[2] + 1;
                if ( options[2] > 3 )
                {
                    options[2] = 0;
                }
            }
            create_string(x + 345 - get_textsize(key_type).x, y - 6, 0 , key_type , style.font_col);
        }
        else
        {
            create_string(x + 345 - get_textsize(key_type).x, y - 6, 0 , key_type , style.font_unselected_col);
        }
    }
    
    return options;

}
function update_variables() {
    return;
}

function update_key ( object )
{
    return create_key_binds("",0,0,object,true);
}

function add_key( name )
{
    UI.AddSliderInt(["Config", ".CC Settings",".CC Settings",], name+"_key", -1, 51);
    UI.AddSliderInt(["Config", ".CC Settings",".CC Settings",], name+"_type", -1, 3);
}

function save_key( name, options )
{
    UI.SetValue(["Config", ".CC Settings",".CC Settings", name+"_key"], get_key_id(options[0]));
    UI.SetValue(["Config", ".CC Settings",".CC Settings", name+"_type"], options[2]);
    UI.SetEnabled(["Config", ".CC Settings",".CC Settings", name+"_key"],0);
    UI.SetEnabled(["Config", ".CC Settings",".CC Settings", name+"_type"],0);
}

function get_key( name, options )
{
    options[0] = key_map[UI.GetValue(["Config", ".CC Settings",".CC Settings", name+"_key"])];
    options[2] = UI.GetValue(["Config", ".CC Settings",".CC Settings", name+"_type"]);
    return options;
}

/////////////////////////////////////////////////
//                                             //
//                    Main                     //
//                                             //
////////////////////////////////////////////////

const texture_path = "ot/pictures/hp.png";
const FIX_FPS_LEVEL = 3;
/*

    0 基本按键,主界面背景,分隔符
    1 包含图片
    2 包含抗锯齿
    3 包含动画
    4 未知

*/

UI.AddSubTab(["Config", "SUBTAB_MGR"], ".CC Settings");

const user_database = [
    "wqy224491","MadMan121","aD2077","15dada",
    "FERLOVE","MuRan2333"
];
var user_name = Cheat.GetUsername();
var initialized = 0;

function FPS_CAN_LOAD( level )
{
    if ( level > FIX_FPS_LEVEL ) return false;
    return true;
}

function bool_to_int( n )
{
    if ( n )
    return 1;
    return 0;
}

function draw_circle(x, y, radius, thickness, color) {
    var inner = radius - thickness;
    for(; radius > inner; --radius) {
        Render.Circle(x, y, radius, color);
    }
}

function normalize_alpha( current, max )
{
    if ( current > max ) return max;
    if ( current < 0 ) return 0;
    return current;
}

const menu_name = 
{
    tab_rage: "Rage",
    tab_aa: "Anti-Aim",
    tab_vs: "Visuals",
    tab_misc: "Misc.",
    tab_user: user_name
}

function initialize()
{

    if ( PREVIEW_OPEN == true && initialized == 1 )
    {
        user_name = "Unknow";
        menu_name.tab_user = user_name;
    }

    if ( initialized == 1 && initialize_adm )
    {
        return;
    }
    if( !initialize_adm  )
    {

        if ( Global.Realtime()-initialize_load_time > 0 )
        {
            initialize_alpha = normalize_alpha((Global.Realtime()-initialize_load_time)*255,255);

            if ( initialize_alpha >= 255 )
            {
                initialize_adm = true; 
            }
        }
        else if ( Global.Realtime()- (initialize_load_time-2.5) > 0  )
        {
            initialize_alpha_load = normalize_alpha((Global.Realtime()-(initialize_load_time-2.52))*510,255);
        }
        else
        {
            initialize_alpha = 0;
        }
        initialize_alpha_load = normalize_alpha(initialize_alpha_load - (initialize_alpha*1.2));

   
        if ( TEXTURE_BG )
        {
            style.window_bg_col_on_text[3] = normalize_alpha(initialize_alpha*128+initialize_alpha_load*1.5,TEXTURE_BG_ALPHA);
        }
        else
        {
            style.window_bg_col[3] = normalize_alpha(initialize_alpha*128+initialize_alpha_load*1.5,255);
            style.window_bg_col_on_text[3] = normalize_alpha(initialize_alpha*128+initialize_alpha_load*1.5,255);
        }
        style.window_border_col[3] = normalize_alpha(initialize_alpha*128+initialize_alpha_load*1.5,255);
        style.window_primary_col[3] = normalize_alpha(initialize_alpha*128+initialize_alpha_load*1.5,255);
        style.frame_bg_col[3] = initialize_alpha;
        style.frame_border_col[3] = initialize_alpha;
        style.font_col[3] = initialize_alpha;
        style.font_selected_col[3] = initialize_alpha;
        style.font_hover_col[3] = initialize_alpha;
        style.font_unselected_col[3] = normalize_alpha(initialize_alpha,180);
        style.element_bg_col[3] = initialize_alpha;
        style.element_dp_col[3] = normalize_alpha(initialize_alpha,225);
        style.element_bg_hovered_col[3] = initialize_alpha;
        style.element_extra_col[3] = initialize_alpha;
        style.element_key_bg_col[3] = initialize_alpha;
        style.element_key_edge_col[3] = initialize_alpha;
    }

    if ( initialized == 1)
    {
        return;
    }

    for( var i = 0;i<user_database.length;++i )
    {
        if ( user_database[i] == user_name )
        {
            initialized = 1;
            PREVIEW_OPEN = false;
            break;
        }
    }
    if ( initialized == 0 )
    {
        switch( PREVIEW_OPEN )
        {
            case false:
                initialized = -1;
                break;
            case true:
                initialized = 1;
                break;
        }
        
    }
    else if( initialized == 1 )
    {
        PREVIEW_OPEN = false;
    }
    return;
}
Cheat.RegisterCallback("Draw", "initialize");

const ScreenSize = Global.GetScreenSize();
const start_time = Globals.Realtime();

const menu_size =
{
    x: 540,
    y: 460
}

const windows =
{
    once: false,
    clicked: false,
    w: menu_size.x,
    h: menu_size.y,
    x: ScreenSize[0] -(ScreenSize[0] - (ScreenSize[0]/10)),
    y: ScreenSize[1] -(ScreenSize[1] - (ScreenSize[1]/10)),
    t: "VANTED.CC"
}

var mouse_movement =
{
    last_x: 0,
    lasy_y: 0
}

var menu_opened = 
{
    tab_rage: false,
    tab_aa: false,
    tab_vs: false,
    tab_misc: false,
    tab_user: true
}

function clear_all_tabs( set )
{
    
    menu_opened.tab_rage = false;
    menu_opened.tab_aa = false;
    menu_opened.tab_vs = false;
    menu_opened.tab_misc = false;
    menu_opened.tab_user = false;
    if ( set == "all" )
    {
        menu_opened.tab_user = true;
    }
}

var subtab_opend = 
{
    //rage
    rage_subtab1: true,
    rage_subtab2: false,
    rage_subtab3: false,
    rage_subtab4: false,
    //aa
    aa_subtab1: true,
    aa_subtab2: false,
    aa_subtab3: false,
    //vsiuals
    vs_subtab1: true,
    vs_subtab2: false,
    vs_subtab3: false,
    //misc
    misc_subtab1: true,
    misc_subtab2: false,
    misc_subtab3: false,
    misc_subtab4: false,
    //user
    user_subtab1: true,
    user_subtab2: false,
    user_subtab3: false,
    user_subtab4: false
}

const subtab_name = 
{
    //rage
    rage_subtab1: "General  ",
    rage_subtab2: "Aimbot   ",
    rage_subtab3: "Exploits ",
    rage_subtab4: "Extra    ",
    //aa
    aa_subtab1: "Fake Angle ",
    aa_subtab2: "Fake Lag   ",
    aa_subtab3: "Extra      ",
    //vsiuals
    vs_subtab1: "General    ",
    vs_subtab2: "World      ",
    vs_subtab3: "Extra      ",
    //misc
    misc_subtab1: "View     ",
    misc_subtab2: "Helpers  ",
    misc_subtab3: "Movement ",
    misc_subtab4: "Extra    ",
    //user
    user_subtab1: "About    ",
    user_subtab2: "User     ",
    user_subtab3: "Settings ",
    user_subtab4: "Helps    "
}

//Rage

var rage_subtab1_var =
{
    sub1: false,
    sub2: false,
    sub2_1: 0,
    sub3: false,
    //sub4: false,

}
const rage_subtab1_name = 
{
    sub1: "Enable advanced ragebot",
    sub2: "Sync weapon fov",
    sub2_1: "Weapon fov",
    sub3: "Disable autowall",
    //sub4: "Smart resolver",
}

var rage_subtab3_var =
{
    sub1: [0,["Off","HvH optimized","MM optimized","Manual"],false],
    sub2: [0,["Prefer speed", "Prefer accuracy"],false],
    sub2_1: [0,["Prefer safe","Prefer speed","Force recharge"],false],
    sub2_2: [0,["Off","+2 ticks","+4 ticks","+6 ticks","+8 ticks","+10 ticks","+12 ticks","+14 ticks","+16 ticks"],false],  
    sub3: 0,
    sub3_1: 0,
    //sub3_2: 0,
    sub4: [0,["Auto","Enabled","Disabled"],false],
    /*
    sub5_1: false,
    sub5_2: false,
    sub5_3: false,
    sub5_4: false,
    sub5_5: false,
    sub5_6: false,
    */
}

const rage_subtab3_name = 
{
    sub1: "Dynamic doubletap",
    sub2: "Options",
    sub2_1: "Recharge",
    sub2_2: "Boost",
    sub3: "Shift",
    sub3_1: "Tolerance",
    //sub3_2: "Recharge CD (50ms per block)",
    sub4: "Instant",
    /*
    sub5_1: "Teleport stop",
    sub5_2: "Break LC",
    sub5_3: "Fast reload",
    sub5_4: "Fast switch",
    sub5_5: "Fast throw",
    sub5_6: "Fake flick",
    */
}

var rage_subtab4_var =
{
    sub1: false,
    sub2: false
}

const rage_subtab4_name = 
{
    sub1: "Unlock MM Exploits",
    sub2: "Fix Hideshots spread"
}

//AA

var aa_subtab3_var = 
{
    sub1: [0,["Off","Anti-Catch"],false],
}

const aa_subtab3_name = 
{
    sub1: "Dynamic on-shot desync",
}

//MSIC

var misc_subtab2_var =
{
    sub1: [0, ["Off", "Onetap", windows.t], false],
    sub1_1: false,
    sub2: false,
    sub3: false,
    sub4: [0, ["Off", "To local", "To team","To all"], false],
    sub5: [0, ["Off", "Onetap", "Advanced Features","Custom","Clantag Stealer"], false],
    sub5_1: [0,["none"],false]
}

const misc_subtab2_name = 
{
    sub1: "Watermark",
    sub1_1: "Log doubletap",
    sub2: "Log shops",
    sub3: "Log shots",
    sub4: "Vote reveal",
    sub5: "Clantag",
    sub5_1: "Clantag Stealer"
}

var misc_subtab3_var =
{
    sub1: [0, ["Avoid silde", "Force silde", "Break legs"], false],
    sub2: false,
    sub3: false,
    sub3_1: [0x10,false,1,false],
    sub4: false,
}

const misc_subtab3_name = 
{
    sub1: "Leg movement",
    sub2: "Strafe assistance",
    sub3: "Crouch in air",
    sub3_1: "Crouch",
    sub4: "Bunny hop"
}

//USER

var user_subtab3_var = 
{
    sub1: [0, ["Off", "Low","Medium", "High"], false],
    sub2: true,
    sub3: [1, ["Off", "Circle","Square", "Free"], false],
    sub4: [1, ["Default", "Red","Green","Blue"], false]
    //sub3: true
}

const user_subtab3_name =
{
    sub1: "FPS optimize",
    sub2: "Auto optimize",
    sub3: "Profile style",
    sub4: "Theme"
    //sub3: "Crash helper"
}

////

function clear_subtabs( group )
{
    if ( group == "user_subtab" || group == "all")
    {
        subtab_opend.user_subtab1 = false;
        subtab_opend.user_subtab2 = false;
        subtab_opend.user_subtab3 = false;
        subtab_opend.user_subtab4 = false;
    }
    if ( group == "misc_subtab" || group == "all" )
    {
        subtab_opend.misc_subtab1 = false;
        subtab_opend.misc_subtab2 = false;
        subtab_opend.misc_subtab3 = false;
        subtab_opend.misc_subtab4 = false;
    }
    if ( group == "vs_subtab" || group == "all" )
    {
        subtab_opend.vs_subtab1 = false;
        subtab_opend.vs_subtab2 = false;
        subtab_opend.vs_subtab3 = false;
    }
    if ( group == "aa_subtab" || group == "all" )
    {
        subtab_opend.aa_subtab1 = false;
        subtab_opend.aa_subtab2 = false;
        subtab_opend.aa_subtab3 = false;
    }
    if ( group == "rage_subtab" || group == "all" )
    {
        subtab_opend.rage_subtab1 = false;
        subtab_opend.rage_subtab2 = false;
        subtab_opend.rage_subtab3 = false;
        subtab_opend.rage_subtab4 = false;
    }
    if ( group == "all" )
    {
        subtab_opend.user_subtab1 = true;
        subtab_opend.misc_subtab1 = true;
        subtab_opend.vs_subtab1 = true;
        subtab_opend.aa_subtab1 = true;
        subtab_opend.rage_subtab1 = true;
    }
}

const login_day = new Date();
const login_h = login_day.getHours();
const login_m = login_day.getMinutes();
const login_s = login_day.getSeconds();

var auto_optimize_set = 0;
var avrage_frame_rate = 200;

function is_connected()
{
    return (World.GetServerString()!="");
}


var last_server_state = World.GetServerString();

function draw_load_cl( base_x,base_y,color)
{
    var bg_color = [20,20,24,240];
    switch( initialize_adm_loal_cr )
    {
        case 0:
            Render.FilledCircle( base_x+1, base_y-2, 2, bg_color);
            break;
        case 1:
            Render.FilledCircle( base_x+8, base_y+4, 2, bg_color);
            break;
        case 2:
            Render.FilledCircle( base_x+8, base_y+11, 2, bg_color);
            break;
        case 3:
            Render.FilledCircle( base_x+1, base_y+15, 2, bg_color);
            break;
        case 4:
            Render.FilledCircle( base_x-6, base_y+11, 2, bg_color);
            break;
        case 5:
            Render.FilledCircle( base_x-6, base_y+4, 2, bg_color);
            break;
    }
    Render.Circle( base_x, base_y-1, 2, color);
    Render.Circle( base_x-7, base_y+3, 2, color);
    Render.Circle( base_x+7, base_y+3, 2, color);
    Render.Circle( base_x-7, base_y+10, 2, color);
    Render.Circle( base_x+7, base_y+10, 2, color);
    Render.Circle( base_x, base_y+14, 2, color);
    
    switch( initialize_adm_loal_cr )
    {
        case 0:
            Render.FilledCircle( base_x, base_y-1, 2, color);
            break;
        case 1:
            Render.FilledCircle( base_x+7, base_y+3, 2, color);
            break;
        case 2:
            Render.FilledCircle( base_x+7, base_y+10, 2, color);
            break;
        case 3:
            Render.FilledCircle( base_x, base_y+14, 2, color);
            break;
        case 4:
            Render.FilledCircle( base_x-7, base_y+10, 2, color);
            break;
        case 5:
            Render.FilledCircle( base_x-7, base_y+3, 2, color);
            break;
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//user
UI.AddDropdown (["Config", ".CC Settings",".CC Settings"], user_subtab3_name.sub1, ["1","2","3","4"], 0);
UI.AddCheckbox (["Config", ".CC Settings",".CC Settings"], user_subtab3_name.sub2);
UI.AddDropdown (["Config", ".CC Settings",".CC Settings"], user_subtab3_name.sub3, ["1","2","3","4"], 0);
UI.AddDropdown (["Config", ".CC Settings",".CC Settings"], user_subtab3_name.sub4, ["1","2","3","4"], 0);
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub1], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub2], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub3], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub4], 0 );

//rage
UI.AddDropdown (["Config", ".CC Settings",".CC Settings"], rage_subtab3_name.sub1, ["1", "2","3"], 0);
UI.AddDropdown (["Config", ".CC Settings",".CC Settings"], rage_subtab3_name.sub2, ["1", "1"], 0);
UI.AddDropdown (["Config", ".CC Settings",".CC Settings"], rage_subtab3_name.sub2_1, ["0", "1","2"], 0);
UI.AddDropdown (["Config", ".CC Settings",".CC Settings"], rage_subtab3_name.sub2_2, ["0", "1","2","3","4","5"], 0);
UI.AddSliderInt(["Config", ".CC Settings",".CC Settings"], rage_subtab3_name.sub3, 0, 64);
UI.AddSliderInt(["Config", ".CC Settings",".CC Settings"], rage_subtab3_name.sub3_1, 0, 8);
//UI.AddSliderInt(["Config", ".CC Settings",".CC Settings"], rage_subtab3_name.sub3_2, 0, 40);
UI.AddDropdown (["Config", ".CC Settings",".CC Settings"], rage_subtab3_name.sub4, ["0", "1","2"], 0);

UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub1], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub2], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub2_1], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub2_2], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub3], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub3_1], 0 );
//UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub3_2], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub4], 0 );

UI.AddCheckbox (["Config", ".CC Settings",".CC Settings"], rage_subtab4_name.sub1);
UI.AddCheckbox (["Config", ".CC Settings",".CC Settings"], rage_subtab4_name.sub2);
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", rage_subtab4_name.sub1], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", rage_subtab4_name.sub2], 0 );

//aa
UI.AddDropdown (["Config", ".CC Settings",".CC Settings"], aa_subtab3_name.sub1, ["1", "2"], 0);
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", aa_subtab3_name.sub1], 0 );

//misc


UI.AddDropdown (["Config", ".CC Settings",".CC Settings"], misc_subtab2_name.sub1, ["1", "2","3"], 0);
UI.AddCheckbox (["Config", ".CC Settings",".CC Settings"], misc_subtab2_name.sub1_1);
UI.AddCheckbox (["Config", ".CC Settings",".CC Settings"], misc_subtab2_name.sub2);
UI.AddCheckbox (["Config", ".CC Settings",".CC Settings"], misc_subtab2_name.sub3);
UI.AddDropdown (["Config", ".CC Settings",".CC Settings"], misc_subtab2_name.sub4, ["1", "2","3"], 0);
UI.AddDropdown (["Config", ".CC Settings",".CC Settings"], misc_subtab2_name.sub5, ["1", "2","3","4","5"], 0);
const online_players = UI.AddDropdown(["Config", ".CC Settings",".CC Settings"],  misc_subtab2_name.sub5_1, [], 1);
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub1], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub1_1], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub2], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub3], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub4], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub5], 0 );
UI.SetEnabled( ["Config", ".CC Settings",".CC Settings",  misc_subtab2_name.sub5_1], 0 );
UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub5_1] , misc_subtab2_var.sub5_1[0] );
UI.SetEnabled(["Misc.", "Helpers", "Client", "Clantag changer"],bool_to_int( misc_subtab2_var.sub5[0] == 0));

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

const msg_once = false;

var last_load = 0;

var reload_start_time = 0;
var reload_now = false;

var user_subtab3_last_state = false;
var rage_subtab3_last_state = false;
var rage_subtab4_last_state = false;
var aa_subtab3_last_state = false;
var misc_subtab2_last_state = false;
var misc_subtab3_last_state = false

var muti_box_test = [[false,false,false],["option 1","option 2","option 3",],false]

function is_config_loaded()
{
    return (
        user_subtab3_last_state &&
        rage_subtab3_last_state &&
        rage_subtab4_last_state &&
        aa_subtab3_last_state &&
        misc_subtab2_last_state &&
        misc_subtab3_last_state
    )
}

function menu()
{   

    //menu open
    if ( !UI.IsMenuOpen() && initialize_alpha > 0 && is_config_loaded())
    {
        return;
    }

    //move pos
    if (Input.IsKeyPressed(0x01)) {
        
        const mouse_pos = get_mouse();
        if ( windows.once == true )
        {
            windows.x = windows.x + (mouse_pos.x - mouse_movement.last_x);
            windows.y = windows.y + (mouse_pos.y - mouse_movement.last_y);
            mouse_movement.last_x = mouse_pos.x;
            mouse_movement.last_y = mouse_pos.y;
        }
        else
        {
            if (
                windows.once == false && windows.clicked == false &&
                (
                    inbox( windows.x,windows.y-5,windows.x+menu_size.x,windows.y+25 ) ||
                    inbox( windows.x,windows.y,windows.x+130,windows.y+65 ) ||
                    inbox( windows.x,windows.y+40,windows.x+menu_size.x,windows.y+65 )
                )
            )
            {
                windows.once = true;
                mouse_movement.last_x = mouse_pos.x;
                mouse_movement.last_y = mouse_pos.y;
            }
        }
        windows.clicked = true;
    }
    else
    {
        windows.once = false;
        windows.clicked = false
    }

    //draw menu
    begin_menu(windows.t, windows.x, windows.y, windows.w, windows.h);

    if ( PREVIEW_OPEN )
    {
        Render.String(windows.x+ 200, windows.y + menu_size.y - 20, 0, "Preview version, not represent the final quality", [255,255,255,initialize_alpha], Render.GetFont(style.main_font, 12, true)); 
    }

    //help
    if ( initialize_alpha > 240 )
    { 
        var help_x = windows.x + 15;
        var help_y = windows.y + menu_size.y - 15;
        if ( !LOW_BODER )
        {
            help_y = help_y + 4;
        }
        if ( inbox(help_x-6,help_y-6,help_x+6,help_y+6) && initialize_alpha > 254 && initialize_adm && !reload_now)
        {
            Render.FilledCircle(help_x,help_y,6,style.font_selected_col);
            Render.String(help_x-1.5, help_y-7, 0, "", [0,0,0,initialize_alpha], Render.GetFont(style.main_font, 10, true)); 

            if ( reload_start_time == 0 )
            {
                reload_start_time = Global.Realtime();
            }
            else
            {
                cd = 3;
                if ( Global.Realtime() - reload_start_time > cd )
                {
                    switch( last_server_state )
                    {
                        case "-1":
                            last_server_state = "0";
                            break;
                        default:
                            last_server_state = "-1";
                            break;
                    }
                    reload_start_time = 0;
                    reload_now = true;
                }
                else
                {
                    var length = ( 100 / cd ) * (Global.Realtime() - reload_start_time);
                    Render.String(help_x + 28, help_y-15, 0, "Hold to reload.", style.font_hover_col, Render.GetFont(style.main_font, 10, true)); 
            
                    Render.FilledRect(help_x + 15, help_y , 100 , 5, style.window_border_col);
                    Render.FilledRect(help_x + 15, help_y , length , 5, style.window_primary_col);
                }
            }

            

        }
        else
        {
            reload_start_time = 0;
            Render.FilledCircle(help_x,help_y,6,style.window_border_col);
            Render.String(help_x-1.5, help_y-7, 0, "?", [128,128,128,initialize_alpha], Render.GetFont(style.main_font, 10, true)); 
        }
    }

    //size
    const tab_size = get_textsize(windows.t).x + windows.x + 50;
    const tab2_size = get_textsize(menu_name.tab_rage).x + tab_size + 16;
    const tab3_size = get_textsize(menu_name.tab_aa).x + tab2_size + 11;
    const tab4_size = get_textsize(menu_name.tab_vs).x + tab3_size + 16;
    const tab5_size = get_textsize(menu_name.tab_vs).x + tab4_size + 55;

    //initialize
    if ( initialized == -1 )
    {
        if (  initialize_alpha > 64 && msg_once== 0)
        {
            msg_once = -1;
            Cheat.PrintColor([255,77,77,255],"\n [ " + windows.t + " ]  Failed!\n");
        }
        if ( initialize_alpha >= 128 )
        {
            create_string(windows.x + 160, windows.y + 85, 0,  " Failed! ", style.font_col);
            create_string(windows.x + 160, windows.y + 115, 0,  " | How this happend?", style.font_col);
            create_string(windows.x + 185, windows.y + 135, 0, " - This version may out-of-date, please download", style.font_col);
            create_string(windows.x + 185, windows.y + 155, 0, "   latest update from our server.", style.font_col);
            create_string(windows.x + 185, windows.y + 175, 0, "   *Your version: " + version + "   Server version: failed", style.font_unselected_col);
            create_string(windows.x + 185, windows.y + 200, 0, " - Some JavaScripts may not working well and", style.font_col);
            create_string(windows.x + 185, windows.y + 220, 0, "   caused this error.", style.font_col);
            create_string(windows.x + 185, windows.y + 240, 0, "   *Reload scripts may fix this problem.", style.font_unselected_col);
            create_string(windows.x + 185, windows.y + 265, 0, " - Your account settings may not correct.", style.font_col);
            create_string(windows.x + 185, windows.y + 285, 0, "   *Please contact with us if your account was", style.font_unselected_col);
            create_string(windows.x + 185, windows.y + 305, 0, "    not correct.", style.font_unselected_col);
        }
        if ( initialize_alpha > 0 )
        {
            return;
        }
    }
    if ( initialized == 1 )
    {
        if ( initialize_alpha > 0 && msg_once >= 0)
        {
            if ( msg_once == 0)
            {
                msg_once = 1;
                if ( !PREVIEW_OPEN && false )
                {
                    Cheat.ExecuteCommand("clear");
                }
            }
            else if ( initialize_alpha > 128 )
            {   
                msg_once = -1;
                if ( !PREVIEW_OPEN )
                {
                    Cheat.PrintColor(style.window_primary_col," [ " + windows.t + " ]  ----------------------------\n");
                    Cheat.PrintColor(style.window_primary_col," [ " + windows.t + " ]  Welcome! " + user_name + "\n");
                    Cheat.PrintColor(style.window_primary_col," [ " + windows.t + " ]  ----------------------------\n");
                }
                else
                {
                    Cheat.PrintColor(style.window_primary_col," [ " + windows.t + " ]  ----------------------------\n");
                    Cheat.PrintColor(style.window_primary_col," [ " + windows.t + " ]  Preview version, not represent the final quality. \n");
                    Cheat.PrintColor(style.window_primary_col," [ " + windows.t + " ]  ----------------------------\n");
                }
                
            }
        }
         //head pic
        if ( FPS_CAN_LOAD(1)  && !PREVIEW_OPEN )
        {
            var cont = false;
            if ( initialize_alpha_load > 254 || initialize_alpha > 0 )
            {
                const texture = Render.AddTexture(texture_path);
                cont = true;
            }
        
            if ( user_subtab3_var.sub3[0] != 0 && cont )
            {
                const pic_x = tab5_size - 42;
                const pic_y = windows.y + 14;
                const rid = 32; //style.window_bg_col
                if ( !initialize_adm )
                {
                    pic_x = -100;
                    pic_y = -100;
                }
                Render.TexturedRect( pic_x ,pic_y,rid, rid, texture );
                if ( FPS_CAN_LOAD(2) )
                {
                    if ( user_subtab3_var.sub3[0] == 1 )
                    {
                        draw_circle(pic_x+(rid/2), pic_y+(rid/2),25,10,style.shade_head_pic_col)
                        Render.FilledRect( pic_x-10,pic_y-10,rid+22,11, style.shade_head_pic_col);
                        Render.FilledRect( pic_x-10,pic_y-5,11,rid+5, style.shade_head_pic_col);
                        Render.FilledRect( pic_x+rid,pic_y-5,12,rid+5, style.shade_head_pic_col);
                        Render.FilledRect( pic_x-10,pic_y+rid,rid+22,11, style.shade_head_pic_col);
                        //left up
                        for( var i = 1;i<9;++i ) Render.Line(pic_x+1, pic_y+i, pic_x+i+1, pic_y , style.shade_head_pic_col);
                        //right down
                        for( var i = 1;i<9;++i ) Render.Line(pic_x+rid-1, pic_y+rid-i, pic_x-i+rid-1, pic_y+rid , style.shade_head_pic_col);
                        //left down
                        for( var i = 1;i<9;++i ) Render.Line(pic_x+1, pic_y+rid-i, pic_x+i+1, pic_y+rid , style.shade_head_pic_col);
                        //right up
                        for( var i = 1;i<9;++i ) Render.Line(pic_x+rid-i-1, pic_y+1, pic_x+rid+1, pic_y+i+1, style.shade_head_pic_col);
                    }
                    else if ( user_subtab3_var.sub3[0] == 2 )
                    {
                        Render.Line(pic_x, pic_y, pic_x+rid, pic_y, style.shade_head_pic_border);
                        Render.Line(pic_x, pic_y, pic_x, pic_y+rid, style.shade_head_pic_border);
                        Render.Line(pic_x+rid, pic_y, pic_x+rid, pic_y+rid, style.shade_head_pic_border);
                        Render.Line(pic_x, pic_y+rid, pic_x+rid, pic_y+rid, style.shade_head_pic_border);
                    }
                }
                
            }
        }
    
        //tabs
        if ( create_tab(menu_name.tab_rage, tab_size , windows.y+20, menu_opened.tab_rage))
        {
            clear_all_tabs( );
            menu_opened.tab_rage = true;
        }
        if ( create_tab(menu_name.tab_aa, tab2_size  , windows.y+20, menu_opened.tab_aa))
        {
            clear_all_tabs( );
            menu_opened.tab_aa = true;
        }
        if ( create_tab(menu_name.tab_vs, tab3_size , windows.y+20, menu_opened.tab_vs))
        {
            clear_all_tabs( );
            menu_opened.tab_vs = true;
        }
        if ( create_tab(menu_name.tab_misc, tab4_size , windows.y+20, menu_opened.tab_misc))
        {
            clear_all_tabs( );
            menu_opened.tab_misc = true;
        }
        var tab_user_move = 0;
        if ( user_subtab3_var.sub3[0] == 0 )
        {
            tab_user_move = -30;
        }
        if ( create_tab(menu_name.tab_user, tab5_size+tab_user_move , windows.y+20, menu_opened.tab_user))
        {
            clear_all_tabs( );
            menu_opened.tab_user = true;
        }

        
        if ( World.GetServerString() != last_server_state )
        {

            if ( last_load == 0 )
            {
                last_load = Globals.Realtime();
            }
            else if ( Globals.Realtime() - last_load > 2 ||  World.GetServerString()=="" || reload_now ) //start reload
            {

                reload_now = false;

                last_load = 0;
                globaltime = Globals.Realtime();

                last_server_state = World.GetServerString();

                clear_all_tabs("all");
                clear_subtabs("all");

                initialized = 0;
                is_reloading = true;
                initialize_alpha = 0;
                initialize_alpha_load = 0;
                initialize_load_time = Global.Realtime()+2.5;
                initialize_adm = false;
                initialize_adm_loal_cr = 0;
                
                user_subtab3_last_state = false;
                rage_subtab3_last_state = false;
                rage_subtab4_last_state = false;
                aa_subtab3_last_state = false;
                misc_subtab2_last_state = false;
                misc_subtab3_last_state = false;
                
                return;

            }   

        }
        
        //rage
        if ( menu_opened.tab_rage )
        {
            if (create_tab(subtab_name.rage_subtab1, windows.x + 30 , windows.y + 90, subtab_opend.rage_subtab1)) {
                clear_subtabs("rage_subtab");
                subtab_opend.rage_subtab1 = true;
            }
            var override = 0;
            if ( rage_subtab1_var.sub1 )
            {
                if (create_tab(subtab_name.rage_subtab2, windows.x + 30 , windows.y + 120, subtab_opend.rage_subtab2)) {
                    clear_subtabs("rage_subtab");
                    subtab_opend.rage_subtab2 = true;
                }
                override = 30;
            }
            if (create_tab(subtab_name.rage_subtab3, windows.x + 30 , windows.y + 120 + override, subtab_opend.rage_subtab3)) {
                clear_subtabs("rage_subtab");
                subtab_opend.rage_subtab3 = true;
            }
            if (create_tab(subtab_name.rage_subtab4, windows.x + 30 , windows.y + 150 + override, subtab_opend.rage_subtab4)) {
                clear_subtabs("rage_subtab");
                subtab_opend.rage_subtab4 = true;
            }
            if ( subtab_opend.rage_subtab1 )
            {
                //create_string(windows.x + 170, windows.y + 85, 0, subtab_name.rage_subtab1, style.font_col);
                //misc_subtab3_var.sub3_1 = create_key_binds(misc_subtab3_name.sub3_1, windows.x + 170, windows.y + 175 + override, misc_subtab3_var.sub3_1);

                override = 0;
                rage_subtab1_var.sub1 = create_checkbox(rage_subtab1_name.sub1,windows.x + 170, windows.y + 85,rage_subtab1_var.sub1);
                rage_subtab1_var.sub2 = create_checkbox(rage_subtab1_name.sub2,windows.x + 170, windows.y + 115,rage_subtab1_var.sub2);
                if ( rage_subtab1_var.sub2 )
                {
                    rage_subtab1_var.sub2_1 = create_slider(rage_subtab1_name.sub2_1, windows.x + 170, windows.y + 145,180, rage_subtab1_var.sub2_1);
                    override = 30;
                }
                rage_subtab1_var.sub3 = create_checkbox(rage_subtab1_name.sub3,windows.x + 170, windows.y + 145+override,rage_subtab1_var.sub3);
                muti_box_test = create_mutidropdown("test muti drop down", windows.x + 170, windows.y + 175 + override, muti_box_test) 
                            
            }
            if ( subtab_opend.rage_subtab2 )
            {
                create_string(windows.x + 170, windows.y + 85, 0, subtab_name.rage_subtab2, style.font_col);
            }
            if ( subtab_opend.rage_subtab3 )
            {
                //rage_subtab3_var
                //rage_subtab3_name
                /*
                sub1:   "Advanced doubletap",
                sub2: "Dynamic speed",
                sub2_1: "Utral shift",
                sub3: 0,
                sub3_1: 0
                */
               var override = 0;
                rage_subtab3_var.sub1 = create_dropdown(rage_subtab3_name.sub1, windows.x + 170, windows.y + 85, rage_subtab3_var.sub1);
                switch( rage_subtab3_var.sub1[0] )
                {
                    case 0:
                        break;
                    case 1:
                        if ( !rage_subtab3_var.sub1[2] )
                        {
                            var override = 0;
                            rage_subtab3_var.sub2 = create_dropdown(rage_subtab3_name.sub2, windows.x + 170, windows.y + 145, rage_subtab3_var.sub2);
                            if ( !rage_subtab3_var.sub2[2] )
                            {
                                rage_subtab3_var.sub2_1 = create_dropdown(rage_subtab3_name.sub2_1, windows.x + 170, windows.y + 205, rage_subtab3_var.sub2_1);
                            }   
                        }    
                        if ( !rage_subtab3_var.sub2_1[2] && rage_subtab3_var.sub2[0] == 0 )
                        {
                            rage_subtab3_var.sub2_2 = create_dropdown(rage_subtab3_name.sub2_2, windows.x + 170, windows.y + 265, rage_subtab3_var.sub2_2);
                        }

                        if ( (rage_subtab3_var.sub2[0] == 1 && !rage_subtab3_var.sub2_1[2]) || (rage_subtab3_var.sub2[0] == 0 && !rage_subtab3_var.sub2_2[2]))
                        {
                            if ( rage_subtab3_var.sub2[0] == 1 )
                            {
                                override = -60;
                            }
                            rage_subtab3_var.sub4 = create_dropdown(rage_subtab3_name.sub4, windows.x + 170, windows.y + 325 + override, rage_subtab3_var.sub4);
                            }
                        break;
                    case 2:
                        break
                    case 3:
                        if ( !rage_subtab3_var.sub1[2] )
                        {
                            rage_subtab3_var.sub3 = create_slider(rage_subtab3_name.sub3, windows.x + 170, windows.y + 145,64, rage_subtab3_var.sub3);
                            rage_subtab3_var.sub3_1 = create_slider(rage_subtab3_name.sub3_1, windows.x + 170, windows.y + 205,12, rage_subtab3_var.sub3_1);
                        }
                        //rage_subtab3_var.sub3_2 = create_slider(rage_subtab3_name.sub3_2, windows.x + 170, windows.y + 265,40, rage_subtab3_var.sub3_2);
                        break;
                }
                

            }
            if ( subtab_opend.rage_subtab4 )
            {
                rage_subtab4_var.sub1 = create_checkbox(rage_subtab4_name.sub1,windows.x + 170, windows.y + 85,rage_subtab4_var.sub1);
                rage_subtab4_var.sub2 = create_checkbox(rage_subtab4_name.sub2,windows.x + 170, windows.y + 115,rage_subtab4_var.sub2);
            }
        }

        //anti-aim
        if ( menu_opened.tab_aa )
        {
            if (create_tab(subtab_name.aa_subtab1, windows.x + 30 , windows.y + 90, subtab_opend.aa_subtab1)) {
                clear_subtabs("aa_subtab");
                subtab_opend.aa_subtab1 = true;
            }
            if (create_tab(subtab_name.aa_subtab2, windows.x + 30 , windows.y + 120, subtab_opend.aa_subtab2)) {
                clear_subtabs("aa_subtab");
                subtab_opend.aa_subtab2 = true;
            }
            if (create_tab(subtab_name.aa_subtab3, windows.x + 30 , windows.y + 150, subtab_opend.aa_subtab3)) {
                clear_subtabs("aa_subtab");
                subtab_opend.aa_subtab3 = true;
            }
            if ( subtab_opend.aa_subtab1 )
            {
                create_string(windows.x + 170, windows.y + 85, 0, subtab_name.aa_subtab1, style.font_col);
            }
            if ( subtab_opend.aa_subtab2 )
            {
                create_string(windows.x + 170, windows.y + 85, 0, subtab_name.aa_subtab2, style.font_col);
            }
            if ( subtab_opend.aa_subtab3 )
            {
                aa_subtab3_var.sub1 = create_dropdown(aa_subtab3_name.sub1, windows.x + 170, windows.y + 85, aa_subtab3_var.sub1);
            }
        }
        //visuals
        if ( menu_opened.tab_vs )
        {
            if (create_tab(subtab_name.vs_subtab1, windows.x + 30 , windows.y + 90, subtab_opend.vs_subtab1)) {
                clear_subtabs("vs_subtab");
                subtab_opend.vs_subtab1 = true;
            }
            if (create_tab(subtab_name.vs_subtab2, windows.x + 30 , windows.y + 120, subtab_opend.vs_subtab2)) {
                clear_subtabs("vs_subtab");
                subtab_opend.vs_subtab2 = true;
            }
            if (create_tab(subtab_name.vs_subtab3, windows.x + 30 , windows.y + 150, subtab_opend.vs_subtab3)) {
                clear_subtabs("vs_subtab");
                subtab_opend.vs_subtab3 = true;
            }
            if ( subtab_opend.vs_subtab1 )
            {
                create_string(windows.x + 170, windows.y + 85, 0, subtab_name.vs_subtab1, style.font_col);
            }
            if ( subtab_opend.vs_subtab2 )
            {
                create_string(windows.x + 170, windows.y + 85, 0, subtab_name.vs_subtab2, style.font_col);
            }
            if ( subtab_opend.vs_subtab3 )
            {
                create_string(windows.x + 170, windows.y + 85, 0, subtab_name.vs_subtab3, style.font_col);
            }
        }

        //misc
        if ( menu_opened.tab_misc )
        {
            if (create_tab(subtab_name.misc_subtab1, windows.x + 30 , windows.y + 90, subtab_opend.misc_subtab1)) {
                clear_subtabs("misc_subtab");
                subtab_opend.misc_subtab1 = true;
            }
            if (create_tab(subtab_name.misc_subtab2, windows.x + 30 , windows.y + 120, subtab_opend.misc_subtab2)) {
                clear_subtabs("misc_subtab");
                subtab_opend.misc_subtab2 = true;
            }
            if (create_tab(subtab_name.misc_subtab3, windows.x + 30 , windows.y + 150, subtab_opend.misc_subtab3)) {
                clear_subtabs("misc_subtab");
                subtab_opend.misc_subtab3 = true;
            }
            if (create_tab(subtab_name.misc_subtab4, windows.x + 30 , windows.y + 180, subtab_opend.misc_subtab4)) {
                clear_subtabs("misc_subtab");
                subtab_opend.misc_subtab4 = true;
            }
            if ( subtab_opend.misc_subtab1 )
            {
                create_string(windows.x + 170, windows.y + 85, 0, subtab_name.misc_subtab1, style.font_col);
            }
            if ( subtab_opend.misc_subtab2 )
            {
                misc_subtab2_var.sub1 = create_dropdown(misc_subtab2_name.sub1, windows.x + 170, windows.y + 85, misc_subtab2_var.sub1);
                if ( misc_subtab2_var.sub1[2] == false )
                {
                    misc_subtab2_var.sub1_1 = create_checkbox(misc_subtab2_name.sub1_1, windows.x + 170, windows.y + 145, misc_subtab2_var.sub1_1);
                    misc_subtab2_var.sub2 = create_checkbox(misc_subtab2_name.sub2, windows.x + 170, windows.y + 175, misc_subtab2_var.sub2);
                }
                misc_subtab2_var.sub3 = create_checkbox(misc_subtab2_name.sub3, windows.x + 170, windows.y + 205, misc_subtab2_var.sub3);
                misc_subtab2_var.sub4 = create_dropdown(misc_subtab2_name.sub4, windows.x + 170, windows.y + 235, misc_subtab2_var.sub4);
                if ( misc_subtab2_var.sub4[2] == false )
                {
                    misc_subtab2_var.sub5 = create_dropdown(misc_subtab2_name.sub5, windows.x + 170, windows.y + 295, misc_subtab2_var.sub5);
                    if ( misc_subtab2_var.sub5[2] == false )
                    {
                        if ( misc_subtab2_var.sub5[0] == 4 )
                        {
                            misc_subtab2_var.sub5_1 = create_dropdown(misc_subtab2_name.sub5_1, windows.x + 170, windows.y + 355, misc_subtab2_var.sub5_1);
                        }
                    }
                }
                
            }
            if ( subtab_opend.misc_subtab3 )
            {
                var override = 0;
                misc_subtab3_var.sub1 = create_dropdown(misc_subtab3_name.sub1, windows.x + 170, windows.y + 85, misc_subtab3_var.sub1);
                if ( misc_subtab3_var.sub1[2] == false )
                {
                    misc_subtab3_var.sub2 = create_checkbox(misc_subtab3_name.sub2, windows.x + 170, windows.y + 145 + override, misc_subtab3_var.sub2);
                    misc_subtab3_var.sub3 = create_checkbox(misc_subtab3_name.sub3, windows.x + 170, windows.y + 175 + override, misc_subtab3_var.sub3);
                }
                if ( misc_subtab3_var.sub3 )
                {
                    override = override + 30;
                    misc_subtab3_var.sub3_1 = create_key_binds(misc_subtab3_name.sub3_1, windows.x + 170, windows.y + 175 + override, misc_subtab3_var.sub3_1);
                }
                misc_subtab3_var.sub4 = create_checkbox(misc_subtab3_name.sub4, windows.x + 170, windows.y + 205 + override, misc_subtab3_var.sub4);
            }
            if ( subtab_opend.misc_subtab4 )
            {
                create_string(windows.x + 170, windows.y + 85, 0, subtab_name.misc_subtab4, style.font_col);
            }
        }

        //user
        if ( menu_opened.tab_user )
        {
            if (create_tab(subtab_name.user_subtab1, windows.x + 30 , windows.y + 90, subtab_opend.user_subtab1)) {
                clear_subtabs("user_subtab");
                subtab_opend.user_subtab1 = true;
            }
            if (create_tab(subtab_name.user_subtab2, windows.x + 30 , windows.y + 120, subtab_opend.user_subtab2)) {
                clear_subtabs("user_subtab");
                subtab_opend.user_subtab2 = true;
            }
            if (create_tab(subtab_name.user_subtab3, windows.x + 30 , windows.y + 150, subtab_opend.user_subtab3)) {
                clear_subtabs("user_subtab");
                subtab_opend.user_subtab3 = true;
            }
            if (create_tab(subtab_name.user_subtab4, windows.x + 30 , windows.y + 180, subtab_opend.user_subtab4)) {
                clear_subtabs("user_subtab");
                subtab_opend.user_subtab4 = true;
            }
            if ( subtab_opend.user_subtab1 )
            {
                create_string(windows.x + 170, windows.y + 85, 0, "[ " + windows.t + " | Advanced Features "+version+" ]", style.font_col);
                create_string(windows.x + 165, windows.y + 105, 0, "  Last update: " + last_update, style.font_unselected_col);
                create_string(windows.x + 165, windows.y + 140, 0, " | Developer", style.font_col);
                create_string(windows.x + 185, windows.y + 160, 0, " - VANTED ( Bilibili UID: "+(0x59f8a5c).toString()+" )", style.font_col);
                create_string(windows.x + 165, windows.y + 185, 0, " | Support", style.font_col);
                create_string(windows.x + 185, windows.y + 205, 0, " - AD#1337, Bot Molu, BlorpGneezer", style.font_col);
                create_string(windows.x + 185, windows.y + 225, 0, " - MSR GAMING", style.font_col);
                create_string(windows.x + 185, windows.y + 245, 0, " - And You", style.font_col);
                create_string(windows.x + 165, windows.y + 290, 0, " | Information", style.font_col);
                create_string(windows.x + 185, windows.y + 315, 0, " - Basic GUI Module by supplybarren", style.font_col);
                create_string(windows.x + 185, windows.y + 335, 0, " - Simple UI " + version_ui , style.font_col);
                if ( initialize_alpha > 128 && TEXTURE_LOGO)
                {
                    var based_x =  windows.x + 190  ;
                    var based_y =  windows.y + menu_size.y - 80;
                    const logo = Render.AddTexture("ot/pictures/logo.png");
                    
                    Render.TexturedRect(based_x, based_y,100, 65, logo );
                    var font = Render.GetFont(style.title_font, 20, true)
                    Render.String(based_x+105, based_y + 10 , 0, "GAMING" , [255,255,255,initialize_alpha], font)
                    Render.String(based_x+100, based_y + 25, 0, "GROUP" , [255,255,255,initialize_alpha], font)
                }
            }   
            if ( subtab_opend.user_subtab2 )
            {
                Render.Line(windows.x + 140, windows.y + 205, windows.x + menu_size.x, windows.y + 205, style.window_border_col);
                if ( FPS_CAN_LOAD(1) && !PREVIEW_OPEN )
                {
                    Render.TexturedRect( windows.x + 165 ,windows.y + 85, 100, 100, texture );
                }
                Render.Line(windows.x + 165, windows.y + 85, windows.x + 265, windows.y + 85, style.window_border_col);
                Render.Line(windows.x + 165, windows.y + 185, windows.x + 265, windows.y + 185, style.window_border_col);
                Render.Line(windows.x + 165, windows.y + 85, windows.x + 165, windows.y + 185, style.window_border_col);
                Render.Line(windows.x + 265, windows.y + 85, windows.x + 265, windows.y + 185, style.window_border_col);
                create_string(windows.x + 300, windows.y + 95, 0, "Username:  " + menu_name.tab_user, style.font_col);
                if ( !PREVIEW_OPEN )
                {
                    create_string(windows.x + 300, windows.y + 115, 0, "Password:", style.font_col);
                    create_string(windows.x + 370, windows.y + 120, 0, "******", style.font_unselected_col);
                    create_string(windows.x + 300, windows.y + 135, 0, "Group:  Premium",style.font_col);
                    time = login_day.getFullYear().toString();
                    time = time + "/" + (login_day.getMonth()+1).toString();
                    time = time + "/" + login_day.getDate().toString();
                    time = time + " | " + login_day.getHours().toString();
                    time = time + ":" + login_day.getMinutes().toString();
                    time = time + ":" + login_day.getSeconds().toString();
                    create_string(windows.x + 300, windows.y + 155, 0, "Login time: "+ time , style.font_col);
                }
                else
                {
                    create_string(windows.x + 300, windows.y + 115, 0, "Group:  Preview",style.font_col);
                }
            }
            if ( subtab_opend.user_subtab3 )
            {
                user_subtab3_var.sub1 = create_dropdown(user_subtab3_name.sub1, windows.x + 170, windows.y + 85, user_subtab3_var.sub1);
                if ( user_subtab3_var.sub1[2] == false )
                {
                    // user_subtab3_var.sub2 = create_checkbox(user_subtab3_name.sub2, windows.x + 170, windows.y + 145, user_subtab3_var.sub2);
                    user_subtab3_var.sub2 = false
                    user_subtab3_var.sub3 = create_dropdown(user_subtab3_name.sub3, windows.x + 170, windows.y + 145, user_subtab3_var.sub3);
                    if ( user_subtab3_var.sub3[2] == false )
                    {
                        user_subtab3_var.sub4 = create_dropdown(user_subtab3_name.sub4, windows.x + 170, windows.y + 205, user_subtab3_var.sub4);
                    }
                }
                
            }
            if ( subtab_opend.user_subtab4 )
            {
                create_string(windows.x + 165, windows.y + 85, 0, " | User support", style.font_col);
                create_string(windows.x + 185, windows.y + 105, 0, " - Customer services:", style.font_col);
                create_string(windows.x + 205, windows.y + 125, 0, " - Tencent Chat Group: "+(0x2c69b433).toString(), style.font_col);
            } 
        }
    }

    if ( initialize_alpha_load > 0 ) //initialize_adm_loal_cr
    {

        var color = [style.adm_load_col[0],style.adm_load_col[1],style.adm_load_col[2],initialize_alpha_load];

        if ( FPS_CAN_LOAD(3) )
        {
            draw_load_cl(windows.x+(menu_size.x/2)+65,windows.y+(menu_size.y/2)+20,color);
            //draw_load_cl(windows.x+70,windows.y+(menu_size.y/2)+30);
            //draw_load_cl(tab5_size - 24,windows.y + 24);
        }

        if ( Global.Realtime()*96%1<=0.1  )
        {
            initialize_adm_loal_cr = initialize_adm_loal_cr + 1;
            if ( initialize_adm_loal_cr > 5 )
            {
                initialize_adm_loal_cr = 0;
            }
        }
        if ( initialize_alpha_load > 64 )
        {
            var msg = "initializing...";
            if ( initialize_alpha_load > 160 || initialize_alpha > 0)
            {
                msg = "loading...";
            }
            if ( (initialize_alpha_load > 254 || initialize_alpha > 0) && initialized == 1)
            {
                if ( !PREVIEW_OPEN )
                {
                    msg = "welcome! " + user_name + "..."
                }
                else
                {
                    msg = "Perview requested..."
                }
                
            }
            if (is_reloading)
            {
                msg = "reloading...";
            }
            var ord = 0;
            if( !FPS_CAN_LOAD(3) )
            {
                ord =10;
            }

            create_string(windows.x+(menu_size.x/2)+70-(get_textsize(msg).x/2), windows.y+(menu_size.y/2)+48-ord, 0, msg, color,false);
        }
        //create_string(windows.x+70-(get_textsize("loading...").x/2), windows.y+(menu_size.y/2)+48, 0, "Loading...", [ 255, 255, 255, initialize_alpha_load],false);
        //create_string(tab5_size +5, windows.y + 20, 0, "Loading...", [ 255, 255, 255, normalize_alpha(initialize_alpha_load-(255/initialize_alpha_load)*2,255)],false);

    }
    

}
Cheat.RegisterCallback("Draw", "menu");

///////////////////////////////////////
//           user sub 3             //
//////////////////////////////////////



function user_subtab3()
{
    if( !user_subtab3_last_state )
    {
        
        user_subtab3_last_state = true;
        user_subtab3_var.sub1[0] = UI.GetValue(["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub1]);
        user_subtab3_var.sub2 = UI.GetValue(["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub2]);
        user_subtab3_var.sub3[0] = UI.GetValue(["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub3]);
        user_subtab3_var.sub4[0] = UI.GetValue(["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub4]);
    }
    else
    {
        UI.SetValue(["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub1] , user_subtab3_var.sub1[0] );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub2] , bool_to_int(user_subtab3_var.sub2) );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub3] , user_subtab3_var.sub3[0] );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub4] , user_subtab3_var.sub4[0] );
    }  

    //auto_optimize_set
    if ( initialized != 1 || !initialize_adm )
    {
        return;
    }
    if ( user_subtab3_var.sub2 )
    {
        if ( user_subtab3_var.sub1[0] != auto_optimize_set )
        {
            user_subtab3_var.sub2 = false;
            auto_optimize_set = user_subtab3_var.sub1[0];
        }
        else
        {
            var fps_now = Math.floor(1/Globals.Frametime());
            avrage_frame_rate = Math.floor((avrage_frame_rate+fps_now)/2);
            if ( avrage_frame_rate >= 60 )
            {
                auto_optimize_set = 0;
            }
            else if ( avrage_frame_rate >= 40 )
            {
                auto_optimize_set = 1;
            }
            else
            {
                auto_optimize_set = 2;
            }
            user_subtab3_var.sub1[0] = auto_optimize_set;
        }
    }
    
    switch( user_subtab3_var.sub1[0] )
    {
        case 0:
            FIX_FPS_LEVEL = 3;
            break;
        case 1:
            FIX_FPS_LEVEL = 2;
            break;
        case 2:
            FIX_FPS_LEVEL = 1;
            break;
        case 3:
            FIX_FPS_LEVEL = 0;
            break;
        default:
            FIX_FPS_LEVEL = 3;
            break;
    }

    switch (user_subtab3_var.sub4[0]) //theme
    {
        case 0:
            style.window_primary_col = [250, 166, 24, 255];
            break;
        case 1:
            style.window_primary_col = [250, 53, 24, 255];
            break;
        case 2:
            style.window_primary_col = [32,255,67, 255];
            break;
        case 3:
            style.window_primary_col = [32,67,255, 255];
            break;
        }

}
Cheat.RegisterCallback("Draw","user_subtab3");

///////////////////////////////////////
//           rage sub 3             //
//////////////////////////////////////




var dis = 0;
var tolerance = 0;
var shift = 0;
var distance = -1;

var rage_subtab3_set_once = false;

function rage_subtab3()
{
    //initialize
    if ( initialized != 1 )
    {
        return;
    }

    if( !rage_subtab3_last_state )
    {
        rage_subtab3_last_state = true;
        rage_subtab3_var.sub1[0] = UI.GetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub1]);
        rage_subtab3_var.sub2[0] = UI.GetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub2]);
        rage_subtab3_var.sub2_1[0] = UI.GetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub2_1]);
        rage_subtab3_var.sub2_2[0] = UI.GetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub2_2]);
        rage_subtab3_var.sub3 = UI.GetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub3]);
        rage_subtab3_var.sub3_1 = UI.GetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub3_1]);
        //rage_subtab3_var.sub3_2 = UI.GetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub3_2]);
        rage_subtab3_var.sub4[0] = UI.GetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub4]);
    }
    else
    {
        UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub1] , rage_subtab3_var.sub1[0] );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub2] , rage_subtab3_var.sub2[0] );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub2_1] , rage_subtab3_var.sub2_1[0] );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub2_1] , rage_subtab3_var.sub2_2[0] );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub3] , rage_subtab3_var.sub3 );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub3_1] , rage_subtab3_var.sub3_1 );
        //UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub3_1] , rage_subtab3_var.sub3_2 );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub4] , rage_subtab3_var.sub4[0] );

    }

    if ( rage_subtab3_var.sub1[0] > 0 )
    {
        UI.SetValue(["Rage", "Exploits","General", "Double tap"], 1);
        UI.SetEnabled(["Rage", "Exploits","General", "Double tap"], 0 );
        rage_subtab4_var.sub1 = true;
        if ( rage_subtab3_var.sub1[0] != 3 )
        {
            UI.SetValue(["Rage", "Exploits","General", "Speed"], 3);
            UI.SetEnabled(["Rage", "Exploits","General", "Speed"], 0 );
            UI.SetEnabled(["Rage", "Exploits", "General", "Options"],0);
        }
        else
        {
            UI.SetEnabled(["Rage", "Exploits","General", "Speed"], 1 );
            UI.SetEnabled(["Rage", "Exploits", "General", "Options"],1);
        }
        rage_subtab3_set_once = false;
    }
    else if ( !rage_subtab3_set_once )
    {
        rage_subtab3_set_once = true;
        UI.SetValue(["Rage", "Exploits","General", "Double tap"], 1);
        UI.SetEnabled(["Rage", "Exploits","General", "Double tap"], 1 );
        UI.SetEnabled(["Rage", "Exploits","General", "Speed"], 1 );
        UI.SetEnabled(["Rage", "Exploits", "General", "Options"],1);
    }

}
Cheat.RegisterCallback("Draw","rage_subtab3");


function can_shift_shot(ticks_to_shift) {
    var me = Entity.GetLocalPlayer();
    var wpn = Entity.GetWeapon(me);
    if (me == null || wpn == null) return false;
    var tickbase = Entity.GetProp(me, "CCSPlayer", "m_nTickBase"); 
    var curtime = Globals.TickInterval() * (tickbase-ticks_to_shift) 
    if (curtime < Entity.GetProp(me, "CCSPlayer", "m_flNextAttack")) return false;
    if (curtime < Entity.GetProp(wpn, "CBaseCombatWeapon", "m_flNextPrimaryAttack")) return false;
    return true;
}

function GetVelocity(index) { //获取速度
    var velocity = Entity.GetProp(index, "CBasePlayer", "m_vecVelocity[0]");
    return Math.sqrt(velocity[0] * velocity[0] + velocity[1] * velocity[1]);
}

function getDropdownValue(value, index)
{
    var mask = 1 << index;
    return value & mask ? true : false;
}

function setDropdownValue(value, index, enable)
{
    var mask = 1 << index;
    
    return enable ? ( value | mask ) : ( value & ~mask );
}

var shot_fired = false;

function rage_subtab3_shot_fired()
{
    if ( Ragebot.GetTarget() != 0 )
    {
        shot_fired = true;
    }
}
Cheat.RegisterCallback("ragebot_fire","rage_subtab3_shot_fired");

var recharge_once = false
var aa_subtab3_last_shot_time = 0;
var last_target = 0;
var cd_time = 0;
var recharge_set_once = false;

function rage_subtab3_doubletap() // some code from Alpha_DT cracked
{

    doubletap_key = UI.GetValue(["Rage","Exploits","Keys","Key assignment","Double tap"]);
    hideshots_key = UI.GetValue(["Rage","Exploits","Keys","Key assignment","Hide shots"]);

    if ( rage_subtab3_var.sub1[0] > 0 )
    {

        if ( !doubletap_key && !recharge_set_once )
        {
            recharge_set_once = true;
            Exploit.EnableRecharge();
        }
        else
        {
            recharge_set_once = false
        }

        if ( doubletap_key && !hideshots_key )
        {

            if ( rage_subtab3_var.sub1[0] == 1 )
            {
                var slowwalk = UI.GetValue (["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"]);

                var velocity =  GetVelocity(Entity.GetLocalPlayer());

                var value_d = UI.GetValue(["Rage", "Exploits", "General", "Options"]);

                switch ( rage_subtab3_var.sub4[0] )
                {
                    case 0:
                        if ( velocity < 3 || slowwalk || Exploit.GetCharge() != 1)
                        {
                            value_d = setDropdownValue(value_d, 0,false);
                        }
                        else
                        {
                            value_d = setDropdownValue(value_d, 0, true);
                        }
                        break;
                    case 2:
                        value_d = setDropdownValue(value_d, 0,false);
                        break;
                    case 1:
                        value_d = setDropdownValue(value_d, 0,true);
                        break;
                }

                value_d = setDropdownValue(value_d, 1, true);
                value_d = setDropdownValue(value_d, 2, false);
                value_d = setDropdownValue(value_d, 3, false);
                value_d = setDropdownValue(value_d, 4, false);
                value_d = setDropdownValue(value_d, 5, true);
                value_d = setDropdownValue(value_d, 6, true);

                UI.SetValue(["Rage", "Exploits", "General", "Options"],value_d);
                
                var instant = getDropdownValue(value_d,0);

                var target = Ragebot.GetTarget();

                if ( !instant )
                {
                    Exploit[( Exploit.GetCharge() == 1?"Enable" : "Disable" ) + "Recharge" ]();
                }

                if ( Exploit.GetCharge() == 1 )
                {
                    aa_subtab3_last_shot_time = Global.Realtime();
                }

                if ( shot_fired )
                {
                    switch ( rage_subtab3_var.sub2_1[0] )
                    {
                        case 0:
                            cd_time = 1.2;
                            break;
                        case 1:
                            cd_time = 0.6;
                            break;
                        case 2:
                            cd_time = 0;
                            break;
                    }
                }

                if ( shot_fired && Exploit.GetCharge() != 0 )
                {
                    shot_fired = false;
                    aa_subtab3_last_shot_time = Global.Realtime();
                }

                LocalPlayerIndex = Entity.GetLocalPlayer();
                Enemies = Entity.GetEnemies();

                distance = -1;

                for ( i = 0; i < Enemies.length; i++){ // Copyed from BlorpGneezer#8932"s "Doubletap Based On Distance.js"

                    if (Entity.IsValid(Enemies[i]) == true && Entity.IsAlive(Enemies[i]) && Entity.IsDormant(Enemies[i]) == false ){

                        HitboxPos = Entity.GetHitboxPosition(LocalPlayerIndex, 0);
                        BotEyePos = Entity.GetEyePosition(Enemies[i])
                        ResultX = Math.abs(HitboxPos[0] - BotEyePos[0]);
                        ResultY = Math.abs(HitboxPos[1] - BotEyePos[1]);
                        ResultXX = ResultX * ResultX;
                        ResultYY = ResultY * ResultY;
                        ResultXY = ResultXX + ResultYY;
                        ResultC = Math.sqrt( ResultXY );

                        if ( distance == -1 || ResultC < distance )
                        {
                            distance = ResultC;
                        }

                    }

                }

                dis = 0;
                tolerance = 0;
                shift = 0;

                if ( distance != -1 )
                {        
                    if ( rage_subtab3_var.sub2[0] == 0 )
                    {
                        dis = distance - 300;
                        tolerance = Math.floor( dis / 150 ) - 1;

                        tolerance = Math.floor(tolerance * 0.6);

                        if ( velocity < 3 )
                        {
                            shift = shift + 4;
                            tolerance = tolerance - 1;
                        }

                        if ( tolerance < 0 ) { tolerance = 0; };
                        if ( tolerance > 8 ) { tolerance = 8; };
                        
                        const max = 14 + ( rage_subtab3_var.sub2_2[0] * 2 );

                        shift = max - tolerance;

                        if ( shift > max ) { shift = max; }
                        if ( shift < 12 ) { shift = 12; }

                        if ( tolerance > 2 )
                        {
                            tolerance = 0;
                        }
                        else if( tolerance > 4 )
                        {
                            tolerance = 1;
                        }
                        else if( tolerance > 6 )
                        {
                            tolerance = 2;
                        }
                        else if( tolerance > 7 )
                        {
                            tolerance = 3;
                        }
                        else
                        {
                            tolerance = 4;
                        }

                    }
                    else if ( rage_subtab3_var.sub2[0] == 1 )
                    {
                        dis = distance - 300;
                        tolerance = Math.floor( dis / 120 ) - 1;

                        if ( tolerance < 0 ) { tolerance = 0; };
                        if ( tolerance > 8 ) { tolerance = 8; };
                        
                        shift = 14 - tolerance;

                        tolerance = Math.floor( ( tolerance - 2 ) / 2 );

                        if ( shift < 8 ) { shift = 8; }

                    }

                    
                    if ( tolerance < 0 ) { tolerance = 0; };
                    if ( tolerance > 3 ) { tolerance = 3; };
                }
                else
                {
                    if ( rage_subtab3_var.sub2[0] == 0 )
                    {
                        shift = 14 + ( rage_subtab3_var.sub2_2[0] * 2 );
                    }
                    else if ( rage_subtab3_var.sub2[0] == 1 )
                    {
                        shift = 14;
                    }
                    tolerance = 0;
                }

                Exploit.OverrideShift(shift);
                Exploit.OverrideTolerance(tolerance);
                Exploit.OverrideMaxProcessTicks(shift+2);

                recharge_once = false;

                if ( can_shift_shot(shift) && Exploit.GetCharge() != 1 && target == 0 && Global.Realtime() - aa_subtab3_last_shot_time > cd_time )
                {
                    cd_time = 0;
                    Exploit.DisableRecharge();
                    Exploit.Recharge();
                }

            }
            else if( rage_subtab3_var.sub1[0] == 2 )
            {

                var value_d = UI.GetValue(["Rage", "Exploits", "General", "Options"]);

                value_d = setDropdownValue(value_d, 0,false);
                value_d = setDropdownValue(value_d, 1, false);
                value_d = setDropdownValue(value_d, 2,false);
                value_d = setDropdownValue(value_d, 3, false);
                value_d = setDropdownValue(value_d, 4, false);
                value_d = setDropdownValue(value_d, 5, false);
                value_d = setDropdownValue(value_d, 6, true);

                UI.SetValue(["Rage", "Exploits", "General", "Options"],value_d);
                
                Exploit.OverrideShift(6);
                Exploit.OverrideTolerance(0);
                Exploit.OverrideMaxProcessTicks(6);

                if ( !recharge_once )
                {
                    recharge_once = true;
                    Exploit.EnableRecharge();
                    
                }
                
                shift = 6;
                tolerance = 0;
            }
            else if( rage_subtab3_var.sub1[0] == 3 )
            {
                shift = rage_subtab3_var.sub3;
                tolerance = rage_subtab3_var.sub3_1;
                Exploit.OverrideShift(shift);
                Exploit.OverrideTolerance(tolerance);
                Exploit.OverrideMaxProcessTicks(shift+2);
                if ( !recharge_once )
                {
                    recharge_once = true;
                    Exploit.EnableRecharge();
                }
            }
        }
        
    }
    else
    {
        Exploit.EnableRecharge();
        Exploit.Recharge();
    }
}
Cheat.RegisterCallback("CreateMove","rage_subtab3_doubletap");

function draw_doubletap_speed()
{

    doubletap_key = UI.GetValue(["Rage","Exploits","Keys","Key assignment","Double tap"]);
    hideshots_key = UI.GetValue(["Rage","Exploits","Keys","Key assignment","Hide shots"]);


    if ( UI.GetValue(["Rage","Exploits","Keys","Key assignment","Double tap"]) && rage_subtab3_var.sub1[0] == 1 && Entity.IsAlive(Entity.GetLocalPlayer()) && doubletap_key && !hideshots_key)
    {
        var font = Render.GetFont(style.title_font, 15, true)
        var font2 = Render.GetFont(style.title_font, 13, true)
        distance = Math.floor(distance);

        var x = (ScreenSize[0] / 2) - 30;
        var y = (ScreenSize[1] / 2) - (ScreenSize[1]*0.05);

        if( Exploit.GetCharge() != 1 )
        {
            Render.String( x, y, 0, "Recharging...", [255,255,255,248], font2)
        }
        
        else if( Global.Realtime() - aa_subtab3_last_shot_time < cd_time && Exploit.GetCharge() != 1 )
        {
            Render.String( x, y, 0, "Waiting...", [255,255,255,248], font2)
        }
        else if ( distance == -1 )
        {
            Render.String( x, y, 0, "Searching...", [255,255,255,248], font2)
        } 
        else
        {
            Render.String( x, y, 0, shift.toString() + " " + tolerance.toString() + " " + distance.toString(), [255,255,255,248], font)
        }
        

    }
}
Cheat.RegisterCallback("Draw","draw_doubletap_speed");

///////////////////////////////////////
//           rage sub 4             //
//////////////////////////////////////


function rage_subtab4()
{
    //initialize
    if ( initialized != 1 )
    {
        return;
    }

    if( !rage_subtab4_last_state )
    {
        rage_subtab4_last_state = true;
        rage_subtab4_var.sub1 = UI.GetValue(["Config", ".CC Settings",".CC Settings", rage_subtab4_name.sub1]);
        rage_subtab4_var.sub2 = UI.GetValue(["Config", ".CC Settings",".CC Settings", rage_subtab4_name.sub2]);
    }
    else
    {
        UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab4_name.sub1] , bool_to_int(rage_subtab4_var.sub1));
        UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab4_name.sub2] , bool_to_int(rage_subtab4_var.sub2));
    }

    if ( rage_subtab4_var.sub1 )
    {
        UI.SetValue(["Cheat", "SHEET_MGR", "General", "Restrictions"], 0);
        UI.SetValue(["Misc.", "Helpers", "Client", "Force sv_cheats"], 1);
        UI.SetEnabled( ["Cheat", "SHEET_MGR", "General", "Restrictions"], 0 );
        UI.SetEnabled( ["Misc.", "Helpers", "Client", "Force sv_cheats"], 0 );

    }
    else
    {
        UI.SetEnabled( ["Cheat", "SHEET_MGR", "General", "Restrictions"], 1 );
        UI.SetEnabled( ["Misc.", "Helpers", "Client", "Force sv_cheats"], 1 );
    }

}
Cheat.RegisterCallback("Draw","rage_subtab4");

var shot_missed = 0;

var rage_subtab4_last_shot_time = Global.Realtime();

function rage_subtab4_last_shot()
{
    var hit = Entity.GetEntityFromUserID(Event.GetInt("userid"));
    var attacker = Entity.GetEntityFromUserID(Event.GetInt("attacker"));
    if ( !(attacker == Entity.GetLocalPlayer() && hit == Ragebot.GetTarget()) ) {
        shot_missed = shot_missed + 1;
    }
    rage_subtab4_last_shot_time = Global.Realtime();

}
Cheat.RegisterCallback("ragebot_fire","rage_subtab4_last_shot");

function rage_subtab4_fix_hs()
{
    //initialize
    if ( initialized != 1 )
    {
        return;
    }
    
    if ( rage_subtab4_var.sub2 && UI.GetValue(["Rage","Exploits","Keys","Key assignment","Hide shots"]))
    {
        if ( Global.Realtime() - rage_subtab4_last_shot_time > 1.5 )
        {
            shot_missed = 0;
        }
        
        if ( shot_missed > 1 )
        {
            Ragebot.ForceTargetSafety(Ragebot.GetTarget());
        }
    }

}
Cheat.RegisterCallback("CreateMove","rage_subtab4_fix_hs");

///////////////////////////////////////
//            aa sub 3              //
//////////////////////////////////////


var aa_subtab3_last_shot_time = Global.Realtime();

var aa_subtab3_set_once = false;
var aa_subtab3_switch = false;
var aa_subtab3_last_shot = false;
function aa_subtab3()
{
    //initialize
    if ( initialized != 1 )
    {
        return;
    }

    if( !aa_subtab3_last_state )
    {
        aa_subtab3_last_state = true;
        aa_subtab3_var.sub1[0] = UI.GetValue(["Config", ".CC Settings",".CC Settings", aa_subtab3_name.sub1]);
    }
    else
    {
        UI.SetValue(["Config", ".CC Settings",".CC Settings", aa_subtab3_name.sub1] , aa_subtab3_var.sub1[0]);
    }

    doubletap_key = UI.GetValue(["Rage","Exploits","Keys","Key assignment","Double tap"]);
    hideshots_key = UI.GetValue(["Rage","Exploits","Keys","Key assignment","Hide shots"]);

    if ( aa_subtab3_var.sub1[0] == 1 && !hideshots_key && !doubletap_key)
    {
        aa_subtab3_set_once = true;
        //UI.SetEnabled(["Rage", "Anti Aim", "SHEET_MGR", "On-shot desync"], 0 );

        if ( Global.Realtime() - aa_subtab3_last_shot_time > 1 )
        {
            UI.SetValue(["Rage", "Anti Aim", "SHEET_MGR", "On-shot desync"], 0);
            aa_subtab3_switch = false;
        }
        else
        {
            UI.SetValue(["Rage", "Anti Aim", "SHEET_MGR", "On-shot desync"], 1);//    
        }
    }
    else
    {
        if ( aa_subtab3_set_once )
        {
            aa_subtab3_set_once = false;
            UI.SetValue(["Rage", "Anti Aim", "SHEET_MGR", "On-shot desync"], 1);
        }
        UI.SetEnabled(["Rage", "Anti Aim", "SHEET_MGR", "On-shot desync"], 0 );
    }
}
Cheat.RegisterCallback("Draw","aa_subtab3");

function rage_subtab3_anti_catch()
{
    if ( initialized != 1 )
    {
        return;
    }
    if ( aa_subtab3_var.sub1[0] == 1 )
    {
        aa_subtab3_last_shot_time = Global.Realtime();
    }
}
Cheat.RegisterCallback("ragebot_fire","rage_subtab3_anti_catch");


///////////////////////////////////////
//           msic sub 2             //
//////////////////////////////////////


var last_tick = 0;
function log_doubletap_speed()
{
    if ( misc_subtab2_name.sub1_1 )
    {
        if ( UI.GetValue(["Rage", "Exploits", "Keys", "Double tap"]) )
        {
			var trol = Globals.Tickcount() - last_tick;
            if ( Exploit.GetCharge() >= 0.999 )
            {
                last_tick = Globals.Tickcount();
            }
            else if ( last_tick != 0 && trol <= 16 )
            {
                var state = "Null";
				if ( trol <= 0 )
				{
					state = "Error";
				}
				else if ( trol <= 2 )
				{
					state = "Fastest"
				}
				else if ( trol <= 3 )
				{
					state = "Faster";
				}
				else if ( trol <= 4 )
				{
					state = "Fast";
				}
                else if ( trol > 4 && trol < 16 )
                {
					state = "Reliable";
                }   
                Cheat.PrintChat("\01 [ \14"+windows.t+" \01] \06 DoubleTap \x01速度: \06" + (trol).toString() + "  tick(s) \x01 状态: \06" + state);
                last_tick = 0;
            }
        }
    }
}

Cheat.RegisterCallback("ragebot_fire","log_doubletap_speed");

function Get_Prop(table, prop)
{
    var Prop = Entity.GetProp(Entity.GetLocalPlayer(), table, prop);
    return Prop;
}
    
var misc_subtab2_cl_update = 0;

var misc_subtab2_clantag = 
[
    "         A",
    "        Ad",
    "       Adv",
    "      Adva",
    "     Advan",
    "    Advanc",
    "   Advance",
    "  Advanced",
    " Advanced ",
    " Advanced ",
    " Advanced ",
    "Advanced F",
    "dvanced Fe",
    "vanced Fea",
    "anced Feat",
    "nced Featu",
    "ced Featur",
    "ed Feature",
    "d Features",
    " Features ",
    " Features ",
    "Features  ",
    "Features  ",
    "eatures   ",
    "atures    ",
    "tures     ",
    "ures      ",
    "res       ",
    "es        ",
    "s         ",
    "          ",
    "          "
]

const run_on_startup = void function()
{
	this.controller = function()
	{
		switch (arguments[0])
		{
			case String: return "String"; break;
			case null: return "Value"; break;
			default: return "Color"; break;
		}
	}
	Object.defineProperty(Object.prototype, "get_cl", {
		value: function(type) {
			return UI["Get" + controller(type)](this);
		},
		enumerable: false,
		configurable: false
	});
}();

const tag_prev = "";

const get_players = function() 
{
	const players = Entity.GetPlayers();
	if (players == null) return;
	players.sort();
	var players_names = [];
	for (var g in players)
	{
		players_names[g] = Entity.GetName(players[g]).replace(/[^ -~]+/g, "").replace(/\s+/g, " ").trim();
    }
    UI.UpdateList(online_players, players_names);
    if ( players_names.length <= 1 )
    {
        misc_subtab2_var.sub5_1[1] = ["none"];
    }
    else
    {
        misc_subtab2_var.sub5_1[1] = players_names;
    }
}

const run_tag_animation = function() 
{
	const players = Entity.GetPlayers();
	if (players == null) // check if players exist
		return;
	
	/* sort */
	players.sort();
	
	const index = online_players.get_cl(null);
	if (players[index] != null) 
	{
		const tag = Entity.GetProp(players[index], "CCSPlayerResource", "m_szClan");
		if (tag == "m_szClan" || tag == null) // if tag is invalid -> set it to blank
			tag = "\0";
			
		if (tag != tag_prev) 
		{
			Local.SetClanTag(tag); // set clan tag
		}
		tag_prev = tag;
	}	
	else 
	{
		Local.SetClanTag("\0");
	}
}

var clan_set = -1;

function misc_subtab2()
{
    //initialize
    if ( initialized != 1 )
    {
        return;
    }

    //cfg check
    if( !misc_subtab2_last_state )
    {
        misc_subtab2_last_state = true;
        misc_subtab2_var.sub1[0] = UI.GetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub1]);
        misc_subtab2_var.sub1_1 = UI.GetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub1_1]);
        misc_subtab2_var.sub2 = UI.GetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub2]);
        misc_subtab2_var.sub3 = UI.GetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub3]);
        misc_subtab2_var.sub4[0] = UI.GetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub4]);
        misc_subtab2_var.sub5[0] = UI.GetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub5]);
    }
    else
    {
        UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub1] , misc_subtab2_var.sub1[0] );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub1_1] , bool_to_int(misc_subtab2_var.sub1_1) );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub2] , bool_to_int(misc_subtab2_var.sub2) );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub3] , bool_to_int(misc_subtab2_var.sub3) );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub4] , misc_subtab2_var.sub4[0] );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub5] , misc_subtab2_var.sub5[0] );
    }  

    //Watermark
    switch( misc_subtab2_var.sub1[0] )
    {
        case 0:
            UI.SetValue(["Misc.", "Helpers", "Watermark"], 0);
            break;
        case 1:
            UI.SetValue(["Misc.", "Helpers", "Watermark"], 1);
            break;
        case 2:
            var today = new Date();
            var hourss = today.getHours();
            var minutess = today.getMinutes();
            var secondss = today.getSeconds();
    
            var hours = hourss <= 9 ? "0" + hourss + ":" : hourss + ":";
            var minutes = minutess <= 9 ? "0" + minutess + ":" : minutess + ":";
            var seconds = secondss <= 9 ? "0" + secondss : secondss;
            var tick = 64;
            var ping = 0;
            if ( World.GetServerString() )
            {
                tick = Globals.Tickrate();
                ping = Math.round(Get_Prop("CPlayerResource", "m_iPing"));
            }

            var text = windows.t + "  |  " + user_name + "  |  "  + " tick: " + tick.toString() + "  |  "+ ping.toString() + " ms  |  " + hours + minutes + seconds;

            var start_x = ScreenSize[0] - get_textsize(text).x+30;
            var start_y = 6;
            var end_x = ScreenSize[0];
            var end_y = start_y+get_textsize(text).y+8;
            
            Render.GradientRect(start_x, start_y, end_x-start_x, end_y-start_y, 1, [ 0, 0, 0,0], [0 , 0, 0, 152]);

            Render.String(start_x+1, start_y+3, 0, text, [0, 0, 0, 146], Render.GetFont(style.title_font, 12, true));
            Render.String(start_x, start_y+2, 0, text, [255, 255, 255, 255], Render.GetFont(style.title_font, 12, true));

            UI.SetValue(["Misc.", "Helpers", "Watermark"], 0);
            break;
        default:
            UI.SetValue(["Misc.", "Helpers", "Watermark"], 0);
            break;
            
    }

    //Clantag
    switch( misc_subtab2_var.sub5[0] )
    {
        case 0:
            if ( clan_set != 0 )
            {
                UI.SetValue(["Misc.", "Helpers", "Client", "Clantag changer"],0);
                Local.SetClanTag("");
                clan_set = 0;
            }
            break;
        case 1:
            UI.SetValue(["Misc.", "Helpers", "Client", "Clantag changer"],1);
            if ( clan_set != 1 )
            {
                UI.SetValue(["Misc.", "Helpers", "Client", "Clantag changer"],0);
                Local.SetClanTag("");
                clan_set = 1;
            }
            break;
        case 2:
            var now = Math.floor((Globals.Curtime() * 3)%32);
            if ( misc_subtab2_cl_update != now )
            {
                Local.SetClanTag(misc_subtab2_clantag[now]);
                misc_subtab2_cl_update = now;
            }
            if ( clan_set != 2 )
            {
                UI.SetValue(["Misc.", "Helpers", "Client", "Clantag changer"],0);
                Local.SetClanTag("");
                clan_set = 2;
            }
            break;
        case 3:
            UI.SetValue(["Misc.", "Helpers", "Client", "Clantag changer"],2);
            if ( clan_set != 3 )
            {
                UI.SetValue(["Misc.", "Helpers", "Client", "Clantag changer"],0);
                Local.SetClanTag("");
                clan_set = 3;
            }
            break;
        case 4:
            get_players();
            run_tag_animation();
            if ( clan_set != 4 )
            {
                UI.SetValue(["Misc.", "Helpers", "Client", "Clantag changer"],0);
                Local.SetClanTag("");
                clan_set = 4;
            }
            break;
        default:
            UI.SetValue(["Misc.", "Helpers", "Client", "Clantag changer"],0);
            break;
    }
}
Cheat.RegisterCallback("Draw", "misc_subtab2");

var Options = [];
function misc_subtab2_VoteOptions () {
    Options[0] = Event.GetString("option1");
    Options[1] = Event.GetString("option2");
    Options[2] = Event.GetString("option3");
    Options[3] = Event.GetString("option4");
    Options[4] = Event.GetString("option5");
}
function misc_subtab2_vote()
{
    //initialize
    if ( initialized != 1 )
    {
        return;
    }

    if ( misc_subtab2_var.sub4[0] > 0 ) {
        var EntityID = Event.GetInt("entityid");
        if (EntityID) {
            var Team = Event.GetInt("team");
            var option = Event.GetInt("vote_option");
            var Name = Entity.GetName(EntityID);
            var team = "null";
            switch (Team) {       
                case 2:
                    team = "恐怖分子";
                    break;             
                case 3:
                    team = "反恐精英";
                    break;           
                default:
                    team = "未知";
                    break;
            }
            var Vote = Options[option];
            switch( Vote )
            {
                case "Yes":
                    Vote = "是";
                    break;
                case "No":
                    Vote = "否";
                    break;
                default: 
                    Vote = "未知";
                    break;
            }
            var msg = "队伍 " + Team + " 玩家 " + Name + " 投票 " + Vote;
            Cheat.PrintChat("\01 [ \14"+windows.t+" \01] 队伍 \06" + Team + " \01玩家 \06" + Name + " \01投票 \06" + Vote );
            switch ( misc_subtab2_var.sub4[0] ) {     
                case 2:
                    Cheat.ExecuteCommand("say_team " + msg);
                    break;
                case 3:
                    Cheat.ExecuteCommand("say " + msg);
                    break;
            }
        }
    }
}
Global.RegisterCallback("vote_options", "misc_subtab2_VoteOptions");
Global.RegisterCallback("vote_cast", "misc_subtab2_vote");

function misc_subtab2_buylogs()
{
    //initialize
    if ( initialized != 1 )
    {
        return;
    }

    if ( misc_subtab2_var.sub2 )
    {
        if ( Event.GetInt("team") != Get_Prop("CBaseEntity", "m_iTeamNum") )
        {
            var item = Event.GetString("weapon");
            item = item.replace("weapon_", "")
            item = item.replace("item_", "")
            item = item.replace("assaultsuit", "kevlar + helmet")
            item = item.replace("incgrenade", "molotov")
            if (item != "unknown") {
                var Player_name = Entity.GetName(Entity.GetEntityFromUserID(Event.GetInt("userid")))
                if ( Player_name == "" )
                {
                    Player_name = "Unknow";
                }
                Cheat.PrintChat("\01 [ \14"+windows.t+" \01] 玩家 \06" + Player_name + " \01购买了 \06" + item );
                Cheat.PrintColor(style.window_primary_col," [ "+windows.t+" ] 玩家 " + Player_name + " 购买了 " + item + "\n");
            }
        }
    }
}
Global.RegisterCallback("item_purchase", "misc_subtab2_buylogs");



///////////////////////////////////////
//           msic sub 3             //
//////////////////////////////////////


function misc_subtab3_strafe_clamp(min, max, value)
{
    if ( max > min )
        return Math.min( max, Math.max(min, value) );
    else
        return Math.min( min, Math.max(max, value) );
}

var leg_movement_break = true
var leg_movement_loop = 1;

UI.AddDropdown (["Config", ".CC Settings",".CC Settings"], misc_subtab3_name.sub1, ["1", "2","3"], 0);
UI.AddCheckbox (["Config", ".CC Settings",".CC Settings"], misc_subtab3_name.sub2);
UI.AddCheckbox (["Config", ".CC Settings",".CC Settings"], misc_subtab3_name.sub3);
add_key( misc_subtab3_name.sub3_1 );

function misc_subtab3()
{
    //initialize
    if ( initialized != 1 )
    {
        return;
    }

    //cfg check
    if( !misc_subtab3_last_state )
    {
        misc_subtab3_last_state = true;
        misc_subtab3_var.sub1[0] = UI.GetValue(["Config", ".CC Settings",".CC Settings", misc_subtab3_name.sub1]);        
        misc_subtab3_var.sub2 = UI.GetValue(["Config", ".CC Settings",".CC Settings", misc_subtab3_name.sub2]);
        misc_subtab3_var.sub3 = UI.GetValue(["Config", ".CC Settings",".CC Settings", misc_subtab3_name.sub3]);
        misc_subtab3_var.sub3_1 = get_key(misc_subtab3_name.sub3_1,misc_subtab3_var.sub3_1)
    }
    else
    {
        UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab3_name.sub1] , misc_subtab3_var.sub1[0] );
        UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab3_name.sub2] , bool_to_int(misc_subtab3_var.sub2));
        UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab3_name.sub3] , bool_to_int(misc_subtab3_var.sub3));
        UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", misc_subtab3_name.sub1], 0 );
        UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", misc_subtab3_name.sub2], 0 );
        UI.SetEnabled( ["Config", ".CC Settings",".CC Settings", misc_subtab3_name.sub3], 0 );

        misc_subtab3_var.sub3_1[2] = 1;
        save_key(misc_subtab3_name.sub3_1, misc_subtab3_var.sub3_1);
        misc_subtab3_var.sub3_1 = update_key(  misc_subtab3_var.sub3_1 );

        

    } 

    //leg movement
    switch ( misc_subtab3_var.sub1[0] )
    {
        case 0:
            UI.SetValue( ["Misc." , "Movement" , "Leg movement"] , 2 );
            break;
        case 1: 
            UI.SetValue( ["Misc." , "Movement" , "Leg movement"] , 1 );
            break;
        case 2:
            var Amount = 10 * 0
            if (leg_movement_break == true) {
                if ( leg_movement_loop > Amount ) {
                UI.SetValue( ["Misc." , "Movement" , "Leg movement"] , 1 )
                UI.SetValue( ["Rage" , "Anti Aim" , "Jitter move"] , 1 )
                leg_movement_loop = 0;
                leg_movement_break = false
                }
            }
            else if (leg_movement_break == false)
            {
                if ( leg_movement_loop > Amount )
                {
                    UI.SetValue( ["Misc." , "Movement" , "Leg movement"] , 2 )
                    UI.SetValue( ["Rage" , "Anti Aim" , "Jitter move"] , 0 )
                    leg_movement_loop = 0;
                    leg_movement_break = true
                }
            }
            leg_movement_loop = leg_movement_loop + 1;
            break;
        default:
            UI.SetValue( ["Misc." , "Movement" , "Leg movement"] , 0 );
            break;
    }

    //Strafe assistance
    if ( misc_subtab3_var.sub2 )
    {
        UI.SetValue(["Misc.", "Movement", "Strafe assistance"], 0);
        UI.SetValue(["Misc.", "Movement", "Auto strafe"], 3);
        var sv_airaccelerate = Convar.GetInt("sv_airaccelerate");
        var turnSpeed = 100;
        turnSpeed = misc_subtab3_strafe_clamp(15, 500, sv_airaccelerate * 3.45 );
        UI.SetValue(["Misc.", "Movement", "Turn speed"], turnSpeed);
    }
    
    //Crouch
    if ( misc_subtab3_var.sub3_1[1] )
    {
        
    }

}
Cheat.RegisterCallback("Draw", "misc_subtab3");

///////////////////////////////////////
//               unload              //
//////////////////////////////////////
function unload()
{
    UI.SetEnabled(["Rage", "Exploits", "General", "Double tap"], 1 );
    UI.SetEnabled(["Rage", "Exploits", "General", "Options"],1);
    UI.SetEnabled(["Rage", "Exploits", "General", "Speed"], 1 );
    UI.SetEnabled( ["Cheat", "SHEET_MGR", "General", "Restrictions"], 1 );
    UI.SetEnabled( ["Misc.", "Helpers", "Client", "Force sv_cheats"], 1 );
    UI.SetEnabled(["Rage", "Anti Aim", "SHEET_MGR", "On-shot desync"], 1 );
    Exploit.EnableRecharge();
    Exploit.Recharge();
    initialized = 0;

    //user
    UI.SetValue(["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub1] , user_subtab3_var.sub1[0] );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub2] , bool_to_int(user_subtab3_var.sub2) );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub3] , user_subtab3_var.sub3[0] );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", user_subtab3_name.sub4] , user_subtab3_var.sub4[0] );
    
    //rage
    UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub1] , rage_subtab3_var.sub1[0] );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub2] , rage_subtab3_var.sub2[0] );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub2_1] , rage_subtab3_var.sub2_1[0] );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub2_1] , rage_subtab3_var.sub2_2[0] );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub3] , rage_subtab3_var.sub3 );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub3_1] , rage_subtab3_var.sub3_1 );
    //UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub3_1] , rage_subtab3_var.sub3_2 );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab3_name.sub4] , rage_subtab3_var.sub4[0] );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab4_name.sub1] , bool_to_int(rage_subtab4_var.sub1));
    UI.SetValue(["Config", ".CC Settings",".CC Settings", rage_subtab4_name.sub2] , bool_to_int(rage_subtab4_var.sub2));

    //aa
    UI.SetValue(["Config", ".CC Settings",".CC Settings", aa_subtab3_name.sub1] , aa_subtab3_var.sub1[0]);

    //misc
    UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub1] , misc_subtab2_var.sub1[0] );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub1_1] , bool_to_int(misc_subtab2_var.sub1_1) );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub2] , bool_to_int(misc_subtab2_var.sub2) );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub3] , bool_to_int(misc_subtab2_var.sub3) );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub4] , misc_subtab2_var.sub4[0] );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub5] , misc_subtab2_var.sub5[0] );
    UI.SetValue(["Config", ".CC Settings",".CC Settings", misc_subtab2_name.sub5_1] , misc_subtab2_var.sub5_1[0] );

}
Cheat.RegisterCallback("Unload","unload");
