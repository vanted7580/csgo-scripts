
UI.AddSubTab( ["Config", "SUBTAB_MGR"], ".CC settings" );

UI.AddDropdown( ["Config",".CC settings",".CC settings"], "Theme", ["Dark","Light"], 0);

const Render_GetFont        = Render.GetFont;
const Render_TextSize       = Render.TextSize;
const Render_String         = Render.String;
const Render_FilledCircle   = Render.FilledCircle;
const Render_TexturedRect   = Render.TexturedRect;
const Render_AddTexture     = Render.AddTexture;
const Render_Polygon        = Render.Polygon;
const Render_GradientRect   = Render.GradientRect;
const Render_GetScreenSize  = Render.GetScreenSize;
const Render_WorldToScreen  = Render.WorldToScreen;
const Render_Circle         = Render.Circle;
const Render_FilledRect     = Render.FilledRect;
const Render_Rect           = Render.Rect;
const Render_Line           = Render.Line;

const Input_GetCursorPosition = Input.GetCursorPosition;
const Input_IsKeyPressed = Input.IsKeyPressed;

const Global_Realtime = Global.Realtime;


var _DEBUG =
{
    SHOW_FILLED_EDGE: 
    {
        TOGGLE: 0,
        COLOR0: [255,255,255,255],
        COLOR1: [255,0,0,255],
        COLOR2: [0,255,0,255],
        COLOR3: [0,0,255,255]
    }
}

var Theme = 
{
    ["Default"]:
    {
        ThemeVer: 0.1, // 校验值
        //Fonts
        TitleFont:      "segoeuib.ttf", // 标题字体
        TitleSize:      15, // 字体大小
        TitleColor:     [0,0,0,255], // 字体颜色
        TitleShadowCol: [0,0,0,16], // 字体影子
        TitleWFont:      true, // 字体属于windows

        TextFont:       "segoeui.ttf", // 标签字体
        TextSize:       13,
        TextColor:      [16,16,16,255],
        TextShadowCol:  [0,0,0,16],
        TextWFont:      true,

        DescFont:       "segoeui.ttf", //说明字体
        DescSize:       10,
        DescColor:      [180,180,180,255],
        DescShadowCol:  [0,0,0,8],
        DescWFont:      true,

        IconFont:   "SimpleUI.ttf", // 图标
        IconSize:   15,
        IconColor:  [0,0,0,255],
        IconShadow: [0,0,0,16],
        IconWFont:  false,

        //Colors
        BreakLineCol: [0,0,0,32], // 全局分隔线颜色

        BackgroundCol:  [240,240,240,255], // 全局背景色
        BGShadowCol:    [0,0,0,16], // 背景阴影

        HighLightCol:  [56,68,255,255], // 高亮单色
        HighLightLCol: [56,68,255,255], // 高亮双色 左
        HighLightRCol: [ 255, 64, 32, 255 ], // 高亮双色 右

        SubPGSelLineCol:        [0,0,0,0], // 焦点标签的分隔线颜色
        SubPGTitleBGCol:        [2400,240,240,240], // 标签栏背景
        SubPGTitleSelected:     [255,255,255,255], // 焦点标签颜色
        SubPGTitleUnSelected:   [245,245,245,245], // 非焦点标签颜色
         
        unselected:
        {
            element: [[250,250,250,255],[0,0,0,0]],
            font: [[[0,0,0,255], [0,0,0,8]], [[16,16,16,255], [0,0,0,8]]],
            anime: 255
        },
        selected:
        {
            element: [[255,255,255,250],[0,0,0,0]],
            font: [[[0,0,0,255], [0,0,0,8]], [[0,0,0,255], [0,0,0,8]]],
            anime: 0
        },
        opened:
        {
            element: [[43,65,255,255] ,[0,0,0,0]],
            font: [[[255,255,255,255], [0,0,0,8]], [[230,230,230,255], [0,0,0,8]]],
            anime: 0
        },

        navibar:
        {
            unselected:
            {
                element: [[220,220,220,255],[0,0,0,0]],
                anime: 255
            },
            selected:
            {
                element: [[180,180,180,255],[0,0,0,0]],
                anime: 0
            },
            opened:
            {
                element: [[140,140,140,255],[0,0,0,8]],
                anime: 0
            }
        }
    },
    ["Dark"]:
    {
        ThemeVer: 0.1, // 校验值
        //Fonts
        TitleFont:      "segoeuib.ttf", // 标题字体
        TitleSize:      15, // 字体大小
        TitleColor:     [255,255,255,255], // 字体颜色
        TitleShadowCol: [0,0,0,16], // 字体影子
        TitleWFont:      true, // 字体属于windows

        TextFont:       "segoeui.ttf", // 标签字体
        TextSize:       13,
        TextColor:      [240,240,240,255],
        TextShadowCol:  [0,0,0,16],
        TextWFont:      true,

        DescFont:       "segoeui.ttf", //说明字体
        DescSize:       10,
        DescColor:      [230,230,230,255],
        DescShadowCol:  [0,0,0,8],
        DescWFont:      true,

        IconFont:   "SimpleUI.ttf", // 图标
        IconSize:   15,
        IconColor:  [255,255,255,255],
        IconShadow: [0,0,0,16],
        IconWFont:  false,

        //Colors
        BreakLineCol: [180,180,180,32], // 全局分隔线颜色

        BackgroundCol:  [30,30,30,255], // 全局背景色
        BGShadowCol:    [0,0,0,8], // 背景阴影

        HighLightCol:  [56,68,255,255], // 高亮单色
        HighLightLCol: [56,68,255,255], // 高亮双色 左
        HighLightRCol: [255,64,32,255], // 高亮双色 右

        SubpageBGCol:           [255,255,255,255], // 页面背景色
        SubPGSelLineCol:        [0,0,0,0], // 焦点标签的分隔线颜色
        SubPGTitleBGCol:        [2400,240,240,240], // 标签栏背景
        SubPGTitleSelected:     [255,255,255,255], // 焦点标签颜色
        SubPGTitleUnSelected:   [245,245,245,245], // 非焦点标签颜色
         
        unselected:
        {
            element: [[35,35,40,255],[0,0,0,8]],
            font: [[[255,255,255,255], [0,0,0,8]], [[230,230,230,255], [0,0,0,8]]],
            anime: 255
        },
        selected:
        {
            element: [[50,50,50,255],[0,0,0,8]],
            font: [[[255,255,255,255], [0,0,0,0]], [[230,230,230,255], [0,0,0,0]]],
            anime: 0
        },
        opened:
        {
            element: [[43,65,255,255] ,[0,0,0,8]],
            font: [[[255,255,255,255], [0,0,0,8]], [[230,230,230,255], [0,0,0,8]]],
            anime: 0
        },

        navibar:
        {
            unselected:
            {
                element: [[40,40,45,255],[0,0,0,0]],
                anime: 255
            },
            selected:
            {
                element: [[55,55,60,255],[0,0,0,0]],
                anime: 0
            },
            opened:
            {
                element: [[80,80,86,255],[255,255,255,4]],
                anime: 0
            }
        }

    }
}

var Settings =
{
    DefaultTheme: ["Default"],
    Theme: ["Dark"]
}

var GlobalVars = 
{
    ScreenSize:
    {
        x: (Render_GetScreenSize())[0],
        y: (Render_GetScreenSize())[1]
    },
    Windows:
    {
        x: ((Render_GetScreenSize())[0] -((Render_GetScreenSize())[0] - ((Render_GetScreenSize())[0]/10))),
        y: ((Render_GetScreenSize())[1] -((Render_GetScreenSize())[1] - ((Render_GetScreenSize())[1]/10))),
        title: "VANTED.CC | Advanced Features",
    },
    ElementSelected: -1,
    ElementClicked: -1,
    ClickCooldown: 0.2,
    StartTime: 0,
    RunningTime: 0,
    ElementSelected: -1,
    ElementOpened: -1,
    SetElementSelected: function( ElementSelected )
    {
        GlobalVars.ElementSelected = ElementSelected;
    },
    SetElementOpened: function( ElementOpened )
    {
        GlobalVars.ElementOpened = ElementOpened;
    },
    GetElementSelected: function( )
    {
        return GlobalVars.ElementSelected;
    },
    GetElementOpened: function( )
    {
        return GlobalVars.ElementOpened;
    }
}

var th = Theme[Settings.Theme];
var config;

var Windows_x = 300;
var Windows_y = 300;

var Tools =
{
    UpdateGlobalVars: function()
    {   
        //Theme Check
            th = Theme[Settings.Theme];
            if ( GlobalVars.StartTime == 0 )
            {
                if ( Theme[Settings.Theme].ThemeVer != Theme[Settings.DefaultTheme].ThemeVer )
                {
                    Settings.Theme = Settings.DefaultTheme;
                    Tools.OverrideDefaultConfig();
                }
            }
        //RunningTime
            if ( GlobalVars.StartTime == 0 )
            {
                GlobalVars.StartTime = Global_Realtime();
            }
            GlobalVars.RunningTime = Global_Realtime() - GlobalVars.StartTime;
        
    },
    Normalize: function ( value, settings )
    {
        if ( value < settings[0] && settings[0] != null ) { return settings[0] }
        if ( value > settings[1] && settings[1] != null ) { return settings[1] }
        return value;
    },
    GetMousePos: function()
    {
        const MousePos = Input_GetCursorPosition();
        return { x: MousePos[0],y: MousePos[1] };
    },
    InBox: function( settings )
    {

        // settings = [ BaseX, BaseY, Width, Height ]

        const BaseX = settings[0];
        const BaseY = settings[1];
        const Width = settings[2];
        const Height = settings[3];

        const MousePos = this.GetMousePos();
        const MousePosX = MousePos.x;
        const MousePosY = MousePos.y;
        
        return (( MousePosX >= BaseX && MousePosX <= (BaseX+Width)  ) && (  MousePosY >= BaseY && MousePosY <= (BaseY+Height) ));

    },
    GetTextSize: function( sentence, font )
    {
        const Size = Render_TextSize(sentence, font);
        return { x: Size[0],y: Size[1] };
    },
    Switchaddition: function( value, addend, oppsite )
    {
        return value + ( oppsite ? addend : - addend );
    },
    ClickedInBox: [],
    ClickInBox: function( Key, IsInbox )
    {
        
        if ( this.ClickedInBox[Key] == undefined )
        {
            this.ClickedInBox[Key] = false;
        }

        const IsPressed = Input_IsKeyPressed( Key );
    
        if ( IsPressed && IsInbox )
        {
            this.ClickedInBox[Key] = true;
        }
        else if ( !IsPressed && IsInbox && this.ClickedInBox[Key] == true )
        {
            this.ClickedInBox[Key] = false;
            return true;
        }
        if ( !IsPressed )
        {
            this.ClickedInBox[Key] = false;
        }
        return false;
    },
    LastSelectedTime: 0,
    CanSelect: function()
    {
        const Realtime = Global_Realtime();
        if ( Realtime - this.LastSelectedTime >= GlobalVars.ClickCooldown )
        {
            Tools.LastSelectedTime = Realtime;
            return true;
        }
        else
        {
            return false;
        }
    },
    ChangeAlpha: function( Color1, Alpha )
    {
        return [ Color1[0], Color1[1], Color1[2], Tools.Normalize(Alpha,[0,Color1[3]])];
    },
    OverrideDefaultConfig: function()
    {
        config = 
        {
            navibar:
            {
                settings:
                {
                    settings: [ Windows_x+110, Windows_y+5, 60, 3 ],
                    id: 1,
                    stay: false
                },
                unselected:
                {
                    element: th.navibar.unselected.element,
                    anime: th.navibar.unselected.anime
                },
                selected:
                {
                    element: th.navibar.selected.element,
                    anime: th.navibar.selected.anime
                },
                opened:
                {
                    element: th.navibar.opened.element,
                    anime: th.navibar.opened.anime
                }
            },
            title:
            {
                sentence: "VANTED.CC | Advanced Features",
                settings: [ Windows_x+20, Windows_y+20, 240, 30 ],
                border: [true, true, true, true, false ],
                font: [ "font", th.TitleColor,th.TitleShadowCol ],
                tary: [ th.HighLightLCol, th.HighLightRCol, th.BGShadowCol ], 
                color: [[255,255,255,0],[35,35,40,0 ]]
            },
            usertab: 
            {
                settings:
                {
                    sentences: [ "Teddy Wan", "Premium user" ],
                    settings: [ Windows_x+60, Windows_y+80, 240, 60 ],
                    font: [ "font", "font" ],
                    border: [true, true, true, true, false ],
                    texture: "ot/pictures/hp.png",
                    id: 2
                },
                unselected:
                {
                    element: th.unselected.element,
                    font: th.unselected.font,
                    anime: th.unselected.anime
                },
                selected:
                {
                    element: th.selected.element,
                    font: th.selected.font,
                    anime: th.selected.anime
                },
                opened:
                {
                    element: th.opened.element,
                    font: th.opened.font,
                    anime: th.opened.anime
                },
            }
        };
    },
    GetMouse: function() {
        const mouse = Input.GetCursorPosition();
        return {
            x: mouse[0],
            y: mouse[1]
        };
    }
}

const Draw =
{
    _RoundedRec: function( settings )
    {
        /*
        settings = 
        {
            pos: [0,0,0,0],
            color: [0,0,0,0],
            angle: [ false, false, false, false ]
        };
        */

        /*
        DRAW.RoundedRec( {
            pos: [100,100,240,80],
            color: [20,20,25,255],
            angle: [ true, true, true, true ]
        } ) 
        */

        const pos_x = settings.pos[0];
        const pos_y = settings.pos[1];
        const width = settings.pos[2];
        const height = settings.pos[3];
        const color = settings.color;
        const angle = settings.angle;
        
        var color_angle = color;
        var color_side = color;
        var color_body = color;

        if ( !angle[0] && !angle[1] &&!angle[2] &&!angle[3] )
        {
            Render_FilledRect( pos_x, pos_y, width, height, color );
        }
        else
        {
            Render_FilledRect( pos_x + 6, pos_y, width - 12, height, color );
            const odd_override = ( height%2 == 1 ? 1 : 0 );
            if ( !angle[0] && !angle[2] )
            {
                Render_FilledRect( pos_x , pos_y, 6, height, color_side );
            }
            else
            {
                if ( angle[0] )
                {
                    Render_FilledRect( pos_x + 4, pos_y + 1, 2, 1, color_angle ); // 1
                    Render_FilledRect( pos_x + 3, pos_y + 2, 3, 1, color_angle ); // 2
                    Render_FilledRect( pos_x + 2, pos_y + 3, 4, 1, color_angle ); // 3
                    Render_FilledRect( pos_x + 1, pos_y + 4, 5, 2, color_angle ); // 4
                    Render_FilledRect( pos_x , pos_y + 6, 6, height/2 - 6, color_side );
                }
                else
                {
                    Render_FilledRect( pos_x , pos_y, 6, height/2, color_side );
                }
                if ( angle[2] )
                {
                    Render_FilledRect( pos_x + 1, pos_y + height - 6, 5, 2, color_angle ); // 4
                    Render_FilledRect( pos_x + 2, pos_y + height - 4, 4, 1, color_angle ); // 3
                    Render_FilledRect( pos_x + 3, pos_y + height - 3, 3, 1, color_angle ); // 2
                    Render_FilledRect( pos_x + 4, pos_y + height - 2, 2, 1, color_angle ); // 1
                    Render_FilledRect( pos_x, pos_y+ height/2, 6, height/2 - 6 + odd_override, color_side );
                }
                else
                {
                    Render_FilledRect( pos_x, pos_y+ height/2, 6, height/2 + odd_override, color_side );
                }
            }

            if ( !angle[1] && !angle[3] )
            {
                Render_FilledRect( pos_x + width - 6, pos_y, 6, height, color_side );
            }
            else
            {
                if ( angle[1] )
                {
                    Render_FilledRect( pos_x + width - 6, pos_y + 1, 2, 1, color_angle ); // 1
                    Render_FilledRect( pos_x + width - 6, pos_y + 2, 3, 1, color_angle ); // 2
                    Render_FilledRect( pos_x + width - 6, pos_y + 3, 4, 1, color_angle ); // 3
                    Render_FilledRect( pos_x + width - 6, pos_y + 4, 5, 2, color_angle ); // 4
                    Render_FilledRect( pos_x + width - 6, pos_y + 6, 6, height/2 - 6, color_side );
                }
                else
                {
                    Render_FilledRect( pos_x + width - 6, pos_y, 6, height/2, color_side );
                }
                if ( angle[3] )
                {
                    Render_FilledRect( pos_x + width - 6, pos_y+ height - 6, 5, 2, color_angle ); // 4
                    Render_FilledRect( pos_x + width - 6, pos_y+ height - 4, 4, 1, color_angle ); // 3
                    Render_FilledRect( pos_x + width - 6, pos_y+ height - 3, 3, 1, color_angle ); // 2
                    Render_FilledRect( pos_x + width - 6, pos_y+ height - 2, 2, 1, color_angle ); // 1
                    Render_FilledRect( pos_x + width - 6, pos_y+ height/2, 6, height/2 - 6 + odd_override, color_side );
                }
                else
                {
                    Render_FilledRect( pos_x + width - 6, pos_y+ height/2, 6, height/2 + odd_override, color_side );
                }
            }
        }
    },
    NRoundedRec: function( settings, shadow )
    {
        /*
        settings = 
        {
            pos: [0,0,100,100],
            color: [0,0,0,255],
            angle: [ false, false, false, false ]
        };
        shadow =
        {
            style: "clasic", // clasic, extended, lite
            color: [0,0,0,255]
        }；
        */

        const pos_x = settings.pos[0];
        const pos_y = settings.pos[1];
        const width = settings.pos[2];
        const height = settings.pos[3];
        const color = settings.color;
        const angle = settings.angle;

        // 绘制阴影

        const shadow_style = shadow.style;
        const shadow_color = shadow.color;

        var length = 0;

        switch( shadow_style )
        {
            case "clasic":
                length = 6;
                break;
            case "extended":
                length = 8;
                break;
            case "lite":
                length = 4;
                break;
            default:
                length = 0;
                break;
        }

        var shadow_pre_color_alpha = shadow_color[3] / 2;

        for ( var i = 1; i <= length; ++i )
        {
            shadow_pre_color_alpha /= 2;
            this._RoundedRec( {
                pos: [pos_x-i,pos_y-i,width+(i*2),height+(i*2)],
            color: [shadow_color[0],shadow_color[1],shadow_color[2],shadow_pre_color_alpha],
                angle: angle
            } );
        }

        this._RoundedRec( settings );

    },
    CosRoundedRec: function( settings )
    {
        // settings = [ [ PosX, PosY, Width, Height ], Color, [LeftUp, LeftDown, RightUp, RightDown, Smooth ] ]; 
        
        if ( settings[1] <= 0 )
        {
            return;
        }
        
        const  PosX = settings[0][0];
        const  PosY = settings[0][1];
        const  Width = settings[0][2];
        const  Height = settings[0][3];
        const  Color = settings[1];
        const  LeftUp = settings[2][0];
        const  LeftDown = settings[2][1];
        const  RightUp = settings[2][2];
        const  RightDown = settings[2][3];
        const  Smooth = settings[2][4];
        if ( Width < 6 || Height < 6 )
        {
            return;
        }
        var SideColor = Color;
        var ApexColor = Color;
        var EdgeColor = Color;
        if ( _DEBUG.SHOW_FILLED_EDGE.TOGGLE ){SideColor = _DEBUG.SHOW_FILLED_EDGE.COLOR1;ApexColor = _DEBUG.SHOW_FILLED_EDGE.COLOR2;EdgeColor = _DEBUG.SHOW_FILLED_EDGE.COLOR3;}
        Render_FilledRect( PosX+4, PosY, Width-8, Height, Color);
        if ( LeftUp )
        {
            Render_FilledRect( PosX+3, PosY+1, 1, 5, SideColor);
            Render_FilledRect( PosX+2, PosY+1.5, 1, 5, SideColor);
            Render_FilledRect( PosX+1, PosY+2.5, 1, 4, SideColor);
            Render_FilledRect( PosX, PosY+4, 1, 2, SideColor);
            Render_FilledRect( PosX, PosY+6, 4, (Height-12)/2, EdgeColor);
        }
        else
        {
            Render_FilledRect( PosX, PosY, 4, Height/2, ApexColor);
        }
        if( LeftDown )
        {
            Render_FilledRect( PosX+3, PosY+Height-6, 1, 5, SideColor);
            Render_FilledRect( PosX+2, PosY+Height-6, 1, 5, SideColor);
            Render_FilledRect( PosX+1, PosY+Height-6, 1, 4, SideColor);
            Render_FilledRect( PosX, PosY+Height-6, 1, 2, SideColor);
            Render_FilledRect( PosX, PosY+(Height/2), 4, (Height-10)/2, EdgeColor);
        }
        else
        {
            Render_FilledRect( PosX, PosY+(Height/2), 4, (Height/2)+0.5, ApexColor);
        }
        if( RightUp )
        {
            Render_FilledRect( PosX+Width-4, PosY+1, 1, 5, SideColor);
            Render_FilledRect( PosX+Width-3, PosY+1.5, 1,5, SideColor);
            Render_FilledRect( PosX+Width-2, PosY+2.5, 1, 4, SideColor);
            Render_FilledRect( PosX+Width-1, PosY+4, 1, 2, SideColor);
            Render_FilledRect( PosX+Width-4, PosY+6, 4, (Height-12)/2, EdgeColor);
        }
        else
        {
            Render_FilledRect( PosX+Width-4, PosY, 4, Height/2, ApexColor);
        }
        if ( RightDown )
        {
            Render_FilledRect( PosX+Width-4, PosY+Height-6, 1, 5, SideColor);
            Render_FilledRect( PosX+Width-3, PosY+Height-6, 1, 5, SideColor);
            Render_FilledRect( PosX+Width-2, PosY+Height-6, 1, 4, SideColor);
            Render_FilledRect( PosX+Width-1, PosY+Height-6, 1, 2, SideColor);
            Render_FilledRect( PosX+Width-4, PosY+(Height)/2, 4, (Height-10)/2, EdgeColor);
        }
        else
        {
            Render_FilledRect( PosX+Width-4, PosY+(Height/2), 4, (Height/2)+0.5, ApexColor);
        }
        if ( Smooth )
        {
            Render_FilledRect( PosX+6, PosY-1, Width-12, 1, ApexColor);
            Render_FilledRect( PosX+6, PosY+Height, Width-12, 1, ApexColor);
            Render_FilledRect( PosX-1, PosY+8, 1, Height-16, ApexColor);
            Render_FilledRect( PosX+Width, PosY+8, 1, Height-16, ApexColor);
        }
    },
    String: function( sentence, settings )
    {
        // settings = [ [ PosX, PosY, MinWidth, MinHeight ], [FontColor,ShadowColor], Font, Style ];
        const PosX = settings[0][0];
        const PosY = settings[0][1];
        var MinWidth = settings[0][2];
        var MinHeight = settings[0][3];
        const FontColor = settings[1][0];
        const ShadowColor  = settings[1][1];
        const Font = settings[2];
        const Style = settings[3];
        if ( FontColor[3] >0 )
        {
            var TextSize = Tools.GetTextSize( sentence, Font );
            var NeedWidth = TextSize.x;
            var NeedHeight = TextSize.y;
            if ( ShadowColor[3] >0 )
            {
                Render_String( PosX+2, PosY+2, Style, sentence, ShadowColor, Font );
                NeedWidth = NeedWidth + 2;
                NeedHeight = NeedHeight + 4;
            }
            MinWidth = ( NeedWidth > MinWidth ? NeedWidth : MinWidth );
            MinHeight = ( NeedHeight + 2 > MinHeight ? NeedHeight + 2 : MinHeight );
            Render_String( PosX, PosY, Style, sentence, FontColor, Font );
            if ( _DEBUG.SHOW_FILLED_EDGE.TOGGLE ) Render_Rect( PosX, PosY, MinWidth, MinHeight, _DEBUG.SHOW_FILLED_EDGE.COLOR1 ); // DEBUG
        }
        return [ [ PosX, PosY, MinWidth, MinHeight ], [FontColor,ShadowColor], Font, Style ];
    },
    LoadingAnimation( startime, settings )
    {

        // settings = [[PosX,PosY],MainColor,AnimeSpeed]
        
        const PosX = settings[0][0];
        const PosY = settings[0][1];
        const MainColor = settings[1];
        const AnimeSpeed = settings[2];

        Render_Circle( PosX, PosY-1, 2, MainColor);
        Render_Circle( PosX-7, PosY+3, 2, MainColor);
        Render_Circle( PosX+7, PosY+3, 2, MainColor);
        Render_Circle( PosX-7, PosY+10, 2, MainColor);
        Render_Circle( PosX+7, PosY+10, 2, MainColor);
        Render_Circle( PosX, PosY+14, 2, MainColor);
        
        const PosAnime = Math.floor(((Global_Realtime() - startime ) * (18*AnimeSpeed)) % 6);

        switch( PosAnime )
        {
            case 0:
                Render_FilledCircle( PosX, PosY-1, 2, MainColor);
                break;
            case 1:
                Render_FilledCircle( PosX+7, PosY+3, 2, MainColor);
                break;
            case 2:
                Render_FilledCircle( PosX+7, PosY+10, 2, MainColor);
                break;
            case 3:
                Render_FilledCircle( PosX, PosY+14, 2, MainColor);
                break;
            case 4:
                Render_FilledCircle( PosX-7, PosY+10, 2, MainColor);
                break;
            case 5:
                Render_FilledCircle( PosX-7, PosY+3, 2, MainColor);
                break;
        }
    },
    OString: function( sentence, settings )
    {
        /*
        settings = [ [ PosX, PosY ], Color, Font, Style ];
        */
        var PosX = settings[0][0];
        var PosY = settings[0][1];
        var Color = settings[1];
        var Font = settings[2];
        var Style = settings[3];

        Render_String( PosX, PosY, Style, sentence, Color, Font );

    }
    
}

const CreateElement = 
{
    NaviBar: function( config )
    {
        /*
        var config =
        {
            settings:
            {
                settings: [ PosX, PosY, MinWidth, MinHeight ],
                id: SelfID,
                stay: StayInBox
            },
            unselected:
            {
                element: [BackgroundColor,ShadowColor],
                anime: AlphaNow
            },
            selected:
            {
                element: [BackgroundColor,ShadowColor],
                anime: AlphaNow
            },
            opened:
            {
                element: [BackgroundColor,ShadowColor],
                anime: AlphaNow
            }
        }
        */

        const PosX      = config.settings.settings[0];
        const PosY      = config.settings.settings[1];
        var MinWidth    = config.settings.settings[2];
        var MinHeight   = 4;

        const SelfID = config.settings.id;

        const StayInBox = config.settings.stay;

        const unselected_BackgroundColor = config.unselected.element[0];
        const unselected_ShadowColor = config.unselected.element[1];
        const unselected_AlphaNow = config.unselected.anime;

        const selected_BackgroundColor = config.selected.element[0];
        const selected_ShadowColor = config.selected.element[1];
        const selected_AlphaNow = config.selected.anime;
        
        const opened_BackgroundColor = config.opened.element[0];
        const opened_ShadowColor = config.opened.element[1];
        const opened_AlphaNow = config.opened.anime;
        
        const IsSelectedOn = Tools.InBox( [PosX-2, PosY-2, MinWidth+4, MinHeight+4] );

        if ( IsSelectedOn )
        {
            GlobalVars.SetElementSelected(SelfID);

            if ( (Input_IsKeyPressed( 0x01 ) && IsSelectedOn && StayInBox ) )
            {
                GlobalVars.SetElementOpened(SelfID);
            }
            else
            {
                GlobalVars.SetElementOpened( -1 );
                if ( !Input_IsKeyPressed( 0x01 ) )
                {
                    StayInBox = true;
                }
            }
        }
        else
        {
            if ( GlobalVars.GetElementSelected() == SelfID )
            {
                GlobalVars.SetElementSelected(-1);
            }
            if ( GlobalVars.GetElementOpened() == SelfID )
            {
                GlobalVars.SetElementOpened(-1);
            }
            if ( Input_IsKeyPressed( 0x01 ) )
            {
                StayInBox = false;
            }
            else
            {
                StayInBox = true;
            }
        }

        var transitiondic = false;

        if ( GlobalVars.GetElementSelected() == SelfID )
        {
            transitiondic = true;
        }
        
        if ( Math.floor(Global_Realtime()*1000) % 1 == 0 )
        {
            selected_AlphaNow = Tools.Normalize( Tools.Switchaddition( selected_AlphaNow,20,transitiondic ) ,[0,selected_BackgroundColor[3]] );
        }
        
        if ( GlobalVars.GetElementOpened() == SelfID )
        {
            opened_AlphaNow = 255;
        }
        else
        {
            opened_AlphaNow = 0;
        }

        const temp_draw =
        {
            navibar: function( tempconfig )
            {
                /*
                var tempconfig = 
                {
                    settings: [TPosX,TPosY,TMinWidth,TMinHeight],
                    color: [TBackgroundColor,TShadowColor]
                }
                */

                const TPosX = tempconfig.settings[0];
                const TPosY = tempconfig.settings[1];
                const TMinWidth = tempconfig.settings[2];
                const TMinHeight = tempconfig.settings[3];
                
                const TBackgroundColor = tempconfig.color[0];
                const TShadowColor = tempconfig.color[1];                

                if ( TShadowColor[3] > 0 )
                {
                    Render_FilledRect( TPosX-3, TPosY+1, 1, TMinHeight-2, TShadowColor);
                    Render_FilledRect( TPosX-2, TPosY, 1, TMinHeight, TShadowColor);
                    Render_FilledRect( TPosX-1, TPosY-1, 1, TMinHeight+2, TShadowColor);


                    Render_FilledRect( TPosX, TPosY-2, TMinWidth, TMinHeight+4, TShadowColor);
                    
                    Render_FilledRect( TPosX+TMinWidth+2, TPosY+1, 1, TMinHeight-2, TShadowColor);
                    Render_FilledRect( TPosX+TMinWidth+1, TPosY, 1, TMinHeight, TShadowColor);
                    Render_FilledRect( TPosX+TMinWidth, TPosY-1, 1, TMinHeight+2, TShadowColor);
                }
                
                Render_FilledRect( TPosX, TPosY+1, 1, TMinHeight-2, TBackgroundColor);
                Render_FilledRect( TPosX+1, TPosY, TMinWidth-2, TMinHeight, TBackgroundColor);
                Render_FilledRect( TPosX+TMinWidth-1, TPosY+1, 1, TMinHeight-2, TBackgroundColor);

            }
        }
        
        if ( unselected_AlphaNow > 0 )
        {
            temp_draw.navibar
            ( {
                settings: [PosX,PosY,MinWidth,MinHeight],
                color: [Tools.ChangeAlpha(unselected_BackgroundColor,unselected_AlphaNow),unselected_ShadowColor]
            } )
        }
        if ( selected_AlphaNow > 0)
        {
            temp_draw.navibar
            ( {
                settings: [PosX,PosY,MinWidth,MinHeight],
                color: [Tools.ChangeAlpha(selected_BackgroundColor,selected_AlphaNow),selected_ShadowColor]
            } )
        }
        if ( opened_AlphaNow > 0)
        {
            temp_draw.navibar
            ( {
                settings: [PosX,PosY,MinWidth,MinHeight],
                color: [Tools.ChangeAlpha(opened_BackgroundColor,opened_AlphaNow),opened_ShadowColor]
            } )
        }

        if ( _DEBUG.SHOW_FILLED_EDGE.TOGGLE ) Render_Rect( PosX, PosY, MinWidth, MinHeight, _DEBUG.SHOW_FILLED_EDGE.COLOR2 ); // DEBUG

        return {
            settings:
            {
                settings: [ PosX, PosY, MinWidth, MinHeight ],
                id: SelfID,
                stay: StayInBox
            },
            unselected:
            {
                element: [unselected_BackgroundColor,unselected_ShadowColor],
                anime: unselected_AlphaNow
            },
            selected:
            {
                element: [selected_BackgroundColor,selected_ShadowColor],
                anime: selected_AlphaNow
            },
            opened:
            {
                element: [opened_BackgroundColor,opened_ShadowColor],
                anime: opened_AlphaNow
            }
        }
    },
    Title: function( config )
    {
        /*
        var config = 
        {
            sentence: Content,
            settings: [ PosX, PosY, MinWidth, MinHeight ],
            border: [LeftUp, LeftDown, RightUp, RightDown, Smooth ],
            font: [ Font, FontColor, FontShadowColor ],
            tary: [ TrayLColor, TrayRColor, TrayShadowColor ],
            color: [BackgroundColor,ShadowColor]
        }
        */
        const Content = config.sentence;
        const PosX      = config.settings[0];
        const PosY      = config.settings[1];
        var MinWidth    = config.settings[2];
        var MinHeight   = config.settings[3];
        const Border = config.border;
        const Font              = config.font[0];
        const FontColor         = config.font[1];
        const FontShadowColor   = config.font[2];
        const TrayLColor        = config.tary[0];
        const TrayRColor        = config.tary[1];
        const TrayShadowColor   = config.tary[2];
        const BackgroundColor = config.color[0];
        const ShadowColor = config.color[1];
        
        const FontSize = Tools.GetTextSize(Content,Font);

        var MaxWidth = FontSize.x + 10 ;
        var MaxHeight = FontSize.y + 16;

        MinWidth = ( MaxWidth > MinWidth ? MaxWidth : MinWidth );
        MinHeight = ( MaxHeight > MinHeight ? MaxHeight : MinHeight );
        
        if ( ShadowColor[3] > 0 )
        {
            Draw.CosRoundedRec( [ [PosX+2,PosY+2,MinWidth,MinHeight],ShadowColor , Border] ); //绘制背景阴影
        }
        Draw.CosRoundedRec( [ [PosX,PosY,MinWidth,MinHeight],BackgroundColor , Border] ); //绘制背景
        
        Draw.String( Content,[ [ PosX+5, PosY, MinWidth, MinHeight ], [FontColor,FontShadowColor], Font, 0 ] ); // 绘制字符

        if ( TrayShadowColor[3] > 0 )
        {
            Render_GradientRect( PosX, PosY+MinHeight-4, MinWidth, 2, 1, [TrayLColor[0],TrayLColor[1],TrayLColor[2],32], [TrayRColor[0],TrayRColor[1],TrayRColor[2],32]); // 主题色
        }
        Render_GradientRect( PosX, PosY+MinHeight-6, MinWidth, 2, 1, TrayLColor, TrayRColor); // 主题色

        if ( _DEBUG.SHOW_FILLED_EDGE.TOGGLE ) Render_Rect( PosX, PosY, MinWidth, MinHeight, _DEBUG.SHOW_FILLED_EDGE.COLOR2 ); // DEBUG

        return {
            sentence: Content,
            settings: [ PosX, PosY, MinWidth, MinHeight ],
            border: Border,
            font: [ Font, FontColor, FontShadowColor ],
            tary: [ TrayLColor, TrayRColor, TrayShadowColor ],
            color: [BackgroundColor,ShadowColor]
        };

    },
    UserTab: function( config )
    {
        /*
        var config = 
        {
            settings:
            {
                sentences: [ Content, SubContent ],
                settings: [ PosX, PosY, MinWidth, MinHeight ],
                font: [ ContentFont, SubContentFont ],
                border: [LeftUp, LeftDown, RightUp, RightDown, Smooth ],
                texture: TexturePath,
                id: SelfID,
                stay: StayInBox
            },
            unselected:
            {
                element: [BackgroundColor,ShadowColor],
                font: [[ FontColor, FontShadowColor ],[ SubFontColor, SubFontShadowColor ]],
                anime: AlphaNow
            },
            selected:
            {
                element: [BackgroundColor,ShadowColor],
                font: [[ FontColor, FontShadowColor ],[ SubFontColor, SubFontShadowColor ]],
                anime: AlphaNow
            },
            opened:
            {
                element: [BackgroundColor,ShadowColor],
                font: [[ FontColor, FontShadowColor ],[ SubFontColor, SubFontShadowColor ]],
                anime: AlphaNow
            },

        }
        */
    
        const Content       = config.settings.sentences[0];
        const SubContent    = config.settings.sentences[1];

        const PosX      = config.settings.settings[0];
        const PosY      = config.settings.settings[1];
        var MinWidth    = config.settings.settings[2];
        var MinHeight   = config.settings.settings[3];
        
        const ContentFont = config.settings.font[0];
        const SubContentFont = config.settings.font[1];

        const Border = config.settings.border;

        const TexturePath = config.settings.texture;

        const SelfID = config.settings.id;
        
        const StayInBox = config.settings.stay;

        const unselected_BackgroundColor = config.unselected.element[0];
        const unselected_ShadowColor = config.unselected.element[1];
        const unselected_FontColor = config.unselected.font[0][0];
        const unselected_FontShadowColor = config.unselected.font[0][1];
        const unselected_SubFontColor = config.unselected.font[1][0];
        const unselected_SubFontShadowColor = config.unselected.font[1][1];
        const unselected_AlphaNow = config.unselected.anime;

        const selected_BackgroundColor = config.selected.element[0];
        const selected_ShadowColor = config.selected.element[1];
        const selected_FontColor = config.selected.font[0][0];
        const selected_FontShadowColor = config.selected.font[0][1];
        const selected_SubFontColor = config.selected.font[1][0];
        const selected_SubFontShadowColor = config.selected.font[1][1];
        const selected_AlphaNow = config.selected.anime;
        
        const opened_BackgroundColor = config.opened.element[0];
        const opened_ShadowColor = config.opened.element[1];
        const opened_FontColor = config.opened.font[0][0];
        const opened_FontShadowColor = config.opened.font[0][1];
        const opened_SubFontColor = config.opened.font[1][0];
        const opened_SubFontShadowColor = config.opened.font[1][1];
        const opened_AlphaNow = config.opened.anime;
        
        const ContentLength = Tools.GetTextSize( Content ,ContentFont ).x;
        const SubContentLength = Tools.GetTextSize( SubContent ,SubContentFont ).x;

        const MaxLength = ( ContentLength > SubContentLength ? ContentLength : SubContentLength ) + 10;

        var MaxWidth = 55 + MaxLength + 10;
        var MaxHeight = ( MinHeight > 60 ? MinHeight : 60 );

        MinWidth = ( MaxWidth > MinWidth ? MaxWidth : MinWidth );
        MinHeight = MaxHeight;
        
        const IsSelectedOn = Tools.InBox( [PosX, PosY, MinWidth, MinHeight] );
        const IsClickedOn = Tools.ClickInBox( 0x01,IsSelectedOn );

        if ( IsSelectedOn )
        {
            GlobalVars.SetElementSelected(SelfID);
            if ( IsClickedOn && StayInBox )
            {
                if ( GlobalVars.GetElementOpened() == SelfID )
                {
                    GlobalVars.SetElementOpened( -1 );
                }
                else
                {
                    GlobalVars.SetElementOpened(SelfID);
                }
            }
            else
            {
                if ( !Input_IsKeyPressed( 0x01 ) )
                {
                    StayInBox = true;
                }
            }
        }
        else
        {
            if ( GlobalVars.GetElementSelected() == SelfID )
            {
                GlobalVars.SetElementSelected(-1);
            }
            if ( Input_IsKeyPressed( 0x01 ) )
            {
                StayInBox = false;
            }
            else
            {
                StayInBox = true;
            }
        }

        var transitiondic = false;

        if ( GlobalVars.GetElementSelected() == SelfID )
        {
            transitiondic = true;
        }
        
        if ( Math.floor(Global_Realtime()*1000) % 1 == 0 )
        {
            selected_AlphaNow = Tools.Normalize( Tools.Switchaddition( selected_AlphaNow,20,transitiondic ) ,[0,selected_BackgroundColor[3]] );
            unselected_AlphaNow = Tools.Normalize( Tools.Switchaddition( unselected_AlphaNow,20,!transitiondic ) ,[0,unselected_BackgroundColor[3]] );
        }
        
        if ( GlobalVars.GetElementOpened() == SelfID )
        {
            unselected_AlphaNow = 0;
            selected_AlphaNow = 255;
            opened_AlphaNow = 255;
        }
        else
        {
            opened_AlphaNow = 0;
        }

        const temp_draw = 
        {
            usertab: function( tempconfig )
            {
                /*
                var tempconfig = 
                {
                    sentences: [ TContent, TSubContent ],
                    settings: [TPosX,TPosY,TMinWidth,TMinHeight],
                    color: [TBackgroundColor,TitleFontColor,SubFontColor],[TShadowColor,TFontShadowColor,TSubFontShadowColor],
                    border: [LeftUp, LeftDown, RightUp, RightDown, Smooth ],
                    font: [TTitleFont,TSubFont]
                }
                */

                const TContent = tempconfig.sentences[0];
                const TSubContent = tempconfig.sentences[1];

                const TPosX = tempconfig.settings[0];
                const TPosY = tempconfig.settings[1];
                const TMinWidth = tempconfig.settings[2];
                const TMinHeight = tempconfig.settings[3];
                
                const TBackgroundColor = tempconfig.color[0][0];
                const TitleFontColor = tempconfig.color[0][1];
                const SubFontColor = tempconfig.color[0][2];

                const TShadowColor = tempconfig.color[1][0];
                const TFontShadowColor = tempconfig.color[1][1];
                const TSubFontShadowColor = tempconfig.color[1][2];
                
                const TBorder = tempconfig.border;

                const TTitleFont = tempconfig.font[0];
                const TSubFont = tempconfig.font[1];

                if ( TShadowColor[3] > 0 )
                {
                    Draw.CosRoundedRec( [ [TPosX+2,TPosY+2,TMinWidth,TMinHeight],TShadowColor , TBorder] ); //绘制背景阴影
                }
                Draw.CosRoundedRec( [ [TPosX,TPosY,TMinWidth,TMinHeight],TBackgroundColor , TBorder] ); //绘制背景
                Draw.String( TContent,[[TPosX+68,TPosY + ((TMinHeight/2) - ( Tools.GetTextSize(TContent,TTitleFont).y ) ) - 4 ],[TitleFontColor,TFontShadowColor],TTitleFont,0] ); //用户名
                Draw.String( TSubContent,[[TPosX+68,TPosY + ((TMinHeight/2) + ( Tools.GetTextSize(TContent,TSubFont).y / 2 ) - 6 ) ],[SubFontColor,TSubFontShadowColor],TSubFont,0] ); //补充信息

            }
        }
        
        
        if ( unselected_AlphaNow > 0 )
        {
            temp_draw.usertab
            ( {
                sentences: [ Content, SubContent ],
                settings: [PosX,PosY,MinWidth,MinHeight],
                color: 
                    [[
                        Tools.ChangeAlpha(unselected_BackgroundColor,unselected_AlphaNow),
                        unselected_FontColor,
                        unselected_SubFontColor
                    ],[
                        Tools.ChangeAlpha(unselected_ShadowColor,unselected_AlphaNow),
                        unselected_FontShadowColor,
                        unselected_SubFontShadowColor
                    ]],
                border: Border,
                font: [ContentFont,SubContentFont]
            } );
        }
        if ( selected_AlphaNow > 0 )
        {
            temp_draw.usertab
            ( {
                sentences: [ Content, SubContent ],
                settings: [PosX,PosY,MinWidth,MinHeight],
                color: 
                    [[
                        Tools.ChangeAlpha(selected_BackgroundColor,selected_AlphaNow),
                        selected_FontColor,
                        selected_SubFontColor
                    ],[
                        Tools.ChangeAlpha(selected_ShadowColor,selected_AlphaNow),
                        selected_FontShadowColor,
                        selected_SubFontShadowColor
                    ]],
                border: Border,
                font: [ContentFont,SubContentFont]
            } );
        }
        if ( opened_AlphaNow > 0 )
        {
            temp_draw.usertab
            ( {
                sentences: [ Content, SubContent ],
                settings: [PosX,PosY,MinWidth,MinHeight],
                color: 
                    [[
                        Tools.ChangeAlpha(opened_BackgroundColor,opened_AlphaNow),
                        opened_FontColor,
                        opened_SubFontColor
                    ],[
                        Tools.ChangeAlpha(opened_ShadowColor,opened_AlphaNow),
                        opened_FontShadowColor,
                        opened_SubFontShadowColor
                    ]],
                border: Border,
                font: [ContentFont,SubContentFont]
            } );
        }
        

        Render_TexturedRect( PosX+10 ,PosY+((MinHeight-40)/2),40, 40, Render_AddTexture(TexturePath) );

        if ( _DEBUG.SHOW_FILLED_EDGE.TOGGLE ) Render_Rect( PosX, PosY, MinWidth, MinHeight, _DEBUG.SHOW_FILLED_EDGE.COLOR2 ); // DEBUG

        return {
            settings:
            {
                sentences: [ Content, SubContent ],
                settings: [ PosX, PosY, MinWidth, MinHeight ],
                font: [ ContentFont, SubContentFont ],
                border: Border,
                texture: TexturePath,
                id: SelfID,
                stay: StayInBox
            },
            unselected:
            {
                element: [unselected_BackgroundColor,unselected_ShadowColor],
                font: [[ unselected_FontColor, unselected_FontShadowColor ],[ unselected_SubFontColor, unselected_SubFontShadowColor ]],
                anime: unselected_AlphaNow
            },
            selected:
            {
                element: [selected_BackgroundColor,selected_ShadowColor],
                font: [[ selected_FontColor, selected_FontShadowColor ],[ selected_SubFontColor, selected_SubFontShadowColor ]],
                anime: selected_AlphaNow
            },
            opened:
            {
                element: [opened_BackgroundColor,opened_ShadowColor],
                font: [[ opened_FontColor, opened_FontShadowColor ],[ opened_SubFontColor, opened_SubFontShadowColor ]],
                anime: opened_AlphaNow
            },

        }

    },
    MainTabs: function( config )
    {

    },
    OMainTabs: function( settings, titles, icons )
    {
        // titles = [ "Title #1","Title #2",..."Title #N" ];
        // settings = [[ PosX, PosY, MinWidth, MinHeight ],[ TitleFont, TitleFontColor, TitleShadowColor ],[BackgroundColor, BGShadowColor, LineColor]];
        // icons = [ IconFont,[IconCode,Iconcolor,IconShadowCol],[IconCode,Iconcolor,IconShadowCol]... ];

        const TitlesArrLength = titles.length;
        const SettingsArrLength = settings.length;
        const IconsArrLength = icons.length;

        if ( 
            TitlesArrLength != (IconsArrLength - 1) ||
            TitlesArrLength <= 0 ||
            IconsArrLength <= 1
            )
        {
            return null;
        }

        const PosX = settings[0][0];
        const PosY = settings[0][1];
        var MinWidth = settings[0][2];
        var MinHeight = settings[0][3];
        const TitleFont = settings[1][0];
        const TitleFontColor = settings[1][1];
        const TitleShadowColor = settings[1][2];
        const BackgroundColor = settings[2][0];
        const BGShadowColor = settings[2][1];
        const LineColor = settings[2][2];

        var max_length = 240;

        if ( BGShadowColor[3] > 0 && false)
        {
            for ( var TabNow = 0; TabNow < TitlesArrLength; ++TabNow )
            {
                const IsTop = ( (TabNow == 0) ? false : true );
                const IsBottom = ((TabNow == (TitlesArrLength - 1)) ? false : true  );
                Draw.CosRoundedRec( [ [PosX+2,PosY+(40*TabNow)+2,MinWidth,40], BGShadowColor, [!IsTop, !IsBottom, !IsTop, !IsBottom, false ] ] ); //绘制背景
                if ( MinHeight < (40*(TabNow+1)) ) { MinHeight = (40*(TabNow+1)) }
            }
        }

        Draw.NRoundedRec({
            pos: [PosX,PosY,MinWidth,40*(TitlesArrLength)],
            color: [0,0,0,0],
            angle: [true, true, true, true, false ]
        },
        {
            style: "lite", // clasic, extended, lite
            color: [0,0,0,4]
        } )

        for ( var TabNow = 0; TabNow < TitlesArrLength; ++TabNow )
        {
            const IsTop = ( (TabNow == 0) ? false : true );
            const IsBottom = ((TabNow == (TitlesArrLength - 1)) ? false : true  );
            //Draw.CosRoundedRec( [ [PosX,PosY+(40*TabNow),MinWidth,40], BackgroundColor, [!IsTop, !IsBottom, !IsTop, !IsBottom, false ] ] ); //绘制背景
            Draw.NRoundedRec({
                pos: [PosX,PosY+(40*TabNow),MinWidth,40],
                color: BackgroundColor,
                angle: [!IsTop, !IsTop, !IsBottom, !IsBottom, false ]
            },
            {
                style: "lite", // clasic, extended, lite
                color: [0,0,0,0]
            } )
        }

        for ( var TabNow = 1; TabNow < TitlesArrLength; ++TabNow )
        {
            Render_Line( PosX+40,PosY+(40*TabNow),PosX+MinWidth,PosY+(40*TabNow), LineColor );//绘制分隔线
        }

        for ( var TabNow = 0; TabNow < TitlesArrLength; ++TabNow )
        {
            if ( TitleShadowColor[3] > 0 )
            {
                Draw.OString( titles[TabNow],[[PosX+45+2,PosY+(40*TabNow)+10+2],TitleShadowColor,TitleFont,0] ); //绘制文字背景
            }
            Draw.OString( titles[TabNow],[[PosX+45,PosY+(40*TabNow)+10],TitleFontColor,TitleFont,0] ); //绘制文字
        }

        const IconFont = icons[0];

        for ( var TabNow = 0; TabNow < IconsArrLength-1; ++TabNow )
        {
            if( icons[TabNow+1][2][3] > 0 )
            {
                Draw.OString( icons[TabNow+1][0],[[PosX+15+2,PosY+(40*TabNow)+10+2],icons[TabNow+1][2],IconFont,0] ); //绘制图标背景
            }
            Draw.OString( icons[TabNow+1][0],[[PosX+15,PosY+(40*TabNow)+10],icons[TabNow+1][1],IconFont,0] ); //绘制图标
        }

        if ( MinWidth < max_length ) { max_length = max_length }

        if ( _DEBUG.SHOW_FILLED_EDGE.TOGGLE )
        {
            Render_Rect( PosX, PosY, MinWidth, MinHeight, _DEBUG.SHOW_FILLED_EDGE.COLOR2 );//绘制边框
        }

        //Render_Rect(100,100,100,100,[255,0,0,255])

    }

}

var nowalpha = 0;
var nowalpha2 = 0;

var last_mouse = null

var doubleBuffer =
{
    stime: -1,
    stext: true,
    value_1: 0,
    value_1_2: 0,
    value_1_3: 0,
    value_1_4: 0,
    value_2: 0,
    value_2_2: 255,
    init: false,
    init2: false
}

var adm_now_speed = 1;
var adm_now_speed2 = 1;

var switch_page = 1;

function Main()
{
    
    if ( !doubleBuffer.init2 )
    {

        if ( Tools.InBox([Windows_x,Windows_y,60+doubleBuffer.value_1_4,60+doubleBuffer.value_2]) && Input_IsKeyPressed(0x01) )
        {
            const mouse_pos = Tools.GetMouse();

            if ( last_mouse != null )
            {
                Windows_x = Windows_x + (mouse_pos.x - last_mouse.x)
                Windows_y = Windows_y + (mouse_pos.y - last_mouse.y)
                
            }
            last_mouse = mouse_pos;
        }
        else
        {
            last_mouse = null;
        }
    }    

    if ( !doubleBuffer.init )
    {
        if ( Math.floor(Global_Realtime()*1000) % 1 == 0 )
        {
            doubleBuffer.value_1 = Tools.Normalize( Tools.Switchaddition( doubleBuffer.value_1,5,true ) ,[0,255] );
            
            doubleBuffer.value_1_2 = Tools.Normalize( Tools.Switchaddition( doubleBuffer.value_1_2,8,(doubleBuffer.value_1 > 140 && doubleBuffer.stext) ) ,[0,255] );

            doubleBuffer.value_1_3 = Tools.Normalize( Tools.Switchaddition( doubleBuffer.value_1_3,8,(doubleBuffer.value_1_2 > 200) ) ,[0,255] );
                
        }

        var tcolor = th.BackgroundCol;
        tcolor[3] = doubleBuffer.value_1;

        if ( Math.floor(Global_Realtime()*1000) % 1 == 0 && doubleBuffer.value_1 > 200)
        {
            //doubleBuffer.value_2 = Tools.Normalize( Tools.Switchaddition( doubleBuffer.value_2,10,true ) ,[0,400] );

            doubleBuffer.value_1_4 = doubleBuffer.value_1_4 + adm_now_speed2;

            if ( doubleBuffer.value_1_4 < 110 )
            {
                adm_now_speed2 = adm_now_speed2 + 0.5;
            }
            else
            {
                adm_now_speed2 = adm_now_speed2 - 0.5;
            }

            if ( adm_now_speed2 < 1 )
            {
                adm_now_speed2 = 1;
            }
            if ( adm_now_speed2 > 10 )
            {
                adm_now_speed2 = 10;
            }
            if ( doubleBuffer.value_1_4 > 220 )
            {
                doubleBuffer.value_1_4 = 220;
            }

        }

        Draw.CosRoundedRec( [ [Windows_x,Windows_y,60+doubleBuffer.value_1_4,60], tcolor, [false, false, false, false, false ] ] ); //背景

        if ( Settings.Theme == "Default" )
        {
            Draw.LoadingAnimation( 0,[[Windows_x+30,Windows_y+22],[60,60,60,doubleBuffer.value_1_2],1] );
            Render_String( Windows_x+55, Windows_y+18, 0, "|   Now loading...", [40,40,40,doubleBuffer.value_1_3], Render_GetFont("segoeui.ttf", 15, true) );
        }
        else
        {
            Draw.LoadingAnimation( 0,[[Windows_x+30,Windows_y+22],[180,180,180,doubleBuffer.value_1_2],1] );
            Render_String( Windows_x+55, Windows_y+18, 0, "|   Now loading...", [240,240,240,doubleBuffer.value_1_3], Render_GetFont("segoeui.ttf", 15, true) );
        }

        if ( doubleBuffer.stime == -1 )
        {
            doubleBuffer.stime = Global_Realtime();
        }

        if ( Global_Realtime() - doubleBuffer.stime > 3 )
        {
            doubleBuffer.stext = false;

        }

        if ( Global_Realtime() - doubleBuffer.stime > 1.5 )
        {
            Render_AddTexture("ot/pictures/hp.png"); 
        }

        if ( Global_Realtime() - doubleBuffer.stime > 3.5 )
        {
            doubleBuffer.init = true;
        }

        return;
    }
    else if ( !doubleBuffer.init2 )
    {
        if ( Math.floor(Global_Realtime()*1000) % 1 == 0 )
        {
            //doubleBuffer.value_2 = Tools.Normalize( Tools.Switchaddition( doubleBuffer.value_2,10,true ) ,[0,400] );

            doubleBuffer.value_2 = doubleBuffer.value_2 + adm_now_speed;

            if ( doubleBuffer.value_2 < 200 )
            {
                adm_now_speed = adm_now_speed + 1;
            }
            else
            {
                adm_now_speed = adm_now_speed - 1;
            }

            if ( adm_now_speed < 1 )
            {
                adm_now_speed = 1;
            }
            if ( adm_now_speed > 20 )
            {
                adm_now_speed = 20;
            }
            if ( doubleBuffer.value_2 > 400 )
            {
                doubleBuffer.value_2 = 400;
            }

        }
        Draw.CosRoundedRec( [ [Windows_x,Windows_y,280+((620/400)*doubleBuffer.value_2),60+doubleBuffer.value_2], th.BackgroundCol, [false, false, false, false, false ] ] ); //背景

        if ( Global_Realtime() - doubleBuffer.stime > 4.0 )
        {
            doubleBuffer.init2 = true;
        }

        return;

    }

    if ( GlobalVars.GetElementOpened() == 1 )
    {
        const mouse_pos = Tools.GetMouse();

        if ( last_mouse != null )
        {
            Windows_x = Windows_x + (mouse_pos.x - last_mouse.x)
            Windows_y = Windows_y + (mouse_pos.y - last_mouse.y)
            
        }
        last_mouse = mouse_pos;
    }
    else
    {
        last_mouse = null;
    }

    config.navibar.settings.settings = [ Windows_x+ 110, Windows_y+5, 60, 3 ]
    config.title.settings = [ Windows_x+20, Windows_y+25, 240, 30 ];
    config.usertab.settings.settings = [ Windows_x+20, Windows_y+70, 240, 60 ];


    config.title.font = [ "font", th.TitleColor,th.TitleShadowCol ];
    config.title.tary = [ th.HighLightLCol, th.HighLightRCol, th.BGShadowCol ];

    config.usertab.unselected.element = th.unselected.element
    config.usertab.unselected.font = th.unselected.font

    config.usertab.selected.element = th.selected.element
    config.usertab.selected.font = th.selected.font

    config.usertab.opened.element = th.opened.element
    config.usertab.opened.font = th.opened.font

    config.navibar.unselected.element = th.navibar.unselected.element;
    config.navibar.selected.element = th.navibar.selected.element;
    config.navibar.opened.element = th.navibar.opened.element;

    config.title.font[0] = Render_GetFont("segoeuib.ttf", 15, true);
    config.usertab.settings.font[0] = Render_GetFont("segoeuib.ttf", 15, true);
    config.usertab.settings.font[1] = Render_GetFont("segoeui.ttf", 13, true);

    Draw.CosRoundedRec( [ [Windows_x+280,Windows_y-3,623,466], [0,0,0,8], [false, true, false, true, false ] ] ); //背景
    Draw.CosRoundedRec( [ [Windows_x+280,Windows_y-2,622,464], [0,0,0,16], [false, true, false, true, false ] ] ); //背景
    Draw.CosRoundedRec( [ [Windows_x+280,Windows_y-1,621,462], [0,0,0,32], [false, false, false, false, false ] ] ); //背景
    Draw.CosRoundedRec( [ [Windows_x+280,Windows_y,620,460], th.BackgroundCol, [false, false, false, false, false ] ] ); //背景2


    Draw.CosRoundedRec( [ [Windows_x-3,Windows_y-3,286,466], [0,0,0,8], [false, false, false, false, false ] ] ); //背景
    Draw.CosRoundedRec( [ [Windows_x-2,Windows_y-2,284,464], [0,0,0,16], [false, false, false, false, false ] ] ); //背景
    Draw.CosRoundedRec( [ [Windows_x-1,Windows_y-1,282,462], [0,0,0,32], [false, false, false, false, false ] ] ); //背景
    Draw.CosRoundedRec( [ [Windows_x,Windows_y,280,460], th.BackgroundCol, [false, false, false, false, false ] ] ); //背景

    const transitiondic = (GlobalVars.GetElementSelected() == 1);
    const transitiondic2 = (GlobalVars.GetElementOpened() == 1);

    if ( Math.floor(Global_Realtime()*1000) % 1 == 0 )
    {
        nowalpha = Tools.Normalize( Tools.Switchaddition( nowalpha,20,transitiondic ) ,[0,255] );
        nowalpha2 = Tools.Normalize( Tools.Switchaddition( nowalpha2,20,transitiondic2 ) ,[0,255] );
    }

    config.title = CreateElement.Title( config.title );

    Draw.CosRoundedRec( [ [Windows_x + 20 -3,Windows_y + 70-3,246,66], [0,0,0,4], [true, true, true, true, false ] ] ); //背景
    Draw.CosRoundedRec( [ [Windows_x + 20 -1,Windows_y + 70-1,242,62], [0,0,0,8], [true, true, true, true, false ] ] ); //背景

    config.usertab = CreateElement.UserTab( config.usertab );

    const icon = Render_GetFont("SimpleUI.ttf", 15, false);

    if ( Settings.Theme == "Default" )
    {

        const icon_sets = [ icon,["0",[0,0,0,255],[0,0,0,16]],["0",[0,0,0,255],[0,0,0,16]],["0",[0,0,0,255],[0,0,0,16]],["0",[0,0,0,255],[0,0,0,16]]];
        const tabs_sets = ["Rage","AntiAim","Visuals","Misc."];
        var  main_sets = [[ Windows_x + 20, Windows_y + 155, 240, 160 ],[ 0, [0,0,0,255], [0,0,0,8] ],[[250,250,250,255], [0,0,0,8], [0,0,0,32]]];
    
        main_sets[1][0] = Render_GetFont("segoeui.ttf", 13, true);
    
        Draw.CosRoundedRec( [ [Windows_x + 20 -3,Windows_y + 155-3,246,166], [0,0,0,4], [true, true, true, true, false ] ] ); //背景
        Draw.CosRoundedRec( [ [Windows_x + 20 -1,Windows_y + 155-1,242,162], [0,0,0,8], [true, true, true, true, false ] ] ); //背景

        CreateElement.OMainTabs(main_sets,tabs_sets,icon_sets);
    
        

        const icon_sets2 = [ icon,["0",[0,0,0,255],[0,0,0,16]],["0",[0,0,0,255],[0,0,0,16]]];
        const tabs_sets2 = ["About","Settings"];
        var  main_sets2 = [[ Windows_x + 20, Windows_y + 340, 240, 160 ],[ 0, [0,0,0,255], [0,0,0,8] ],[[250,250,250,255], [0,0,0,8], [0,0,0,32]]];
    
        main_sets2[1][0] = Render_GetFont("segoeui.ttf", 13, true);
    
        Draw.CosRoundedRec( [ [Windows_x + 20 -3,Windows_y + 340-3,246,86], [0,0,0,4], [true, true, true, true, false ] ] ); //背景
        Draw.CosRoundedRec( [ [Windows_x + 20 -1,Windows_y + 340-1,242,82], [0,0,0,8], [true, true, true, true, false ] ] ); //背景

        CreateElement.OMainTabs(main_sets2,tabs_sets2,icon_sets2);

    }
    else
    {
        const icon_sets = [ icon,["0",[255,255,255,255],[0,0,0,16]],["0",[255,255,255,255],[0,0,0,16]],["0",[255,255,255,255],[0,0,0,16]],["0",[255,255,255,255],[0,0,0,16]]];
        const tabs_sets = ["Rage","AntiAim","Visuals","Misc."];
        var  main_sets = [[ Windows_x + 20, Windows_y + 155, 240, 160 ],[ 0, [255,255,255,255], [0,0,0,8] ],[[35,35,40,255], [0,0,0,8], [0,0,0,32]]];
    
        main_sets[1][0] = Render_GetFont("segoeui.ttf", 13, true);
    
        CreateElement.OMainTabs(main_sets,tabs_sets,icon_sets);
    
        const icon_sets2 = [ icon,["0",[255,255,255,255],[0,0,0,16]],["0",[255,255,255,255],[0,0,0,16]]];
        const tabs_sets2 = ["About","Settings"];
        var  main_sets2 = [[ Windows_x + 20, Windows_y + 340, 240, 160 ],[ 0, [255,255,255,255], [0,0,0,8] ],[[35,35,40,255], [0,0,0,8], [0,0,0,32]]];
    
        main_sets2[1][0] = Render_GetFont("segoeui.ttf", 13, true);
    
        CreateElement.OMainTabs(main_sets2,tabs_sets2,icon_sets2);
    
    }


    if ( Settings.Theme == "Default" )
    {

        if ( nowalpha2 > 0 )
        {
            Draw.CosRoundedRec( [ [Windows_x,Windows_y,280,460], [245,245,245,nowalpha2], [false, false, false, false, false ] ] ); //背景
        }

        if ( nowalpha > 0 )
        {
            Draw.CosRoundedRec( [ [Windows_x,Windows_y,280,14], [250,250,250,nowalpha], [true , false, true, false, false ] ] ); //背景
        }

        if ( nowalpha2 > 0 )
        {
            Draw.CosRoundedRec( [ [Windows_x,Windows_y,280,14], [245,245,245,nowalpha2], [false, false, false, false, false ] ] ); //背景
        }

    }
    else
    {
        if ( nowalpha2 > 0 )
        {
            Draw.CosRoundedRec( [ [Windows_x,Windows_y,280,460], [25,25,25,nowalpha2], [false, false, false, false, false ] ] ); //背景
        }

        if ( nowalpha > 0 )
        {
            Draw.CosRoundedRec( [ [Windows_x,Windows_y,280,14], [0,0,0,nowalpha], [true , false, true, false, false ] ] ); //背景
        }

        if ( nowalpha2 > 0 )
        {
            Draw.CosRoundedRec( [ [Windows_x,Windows_y,280,14], [0,0,0,nowalpha2], [false, false, false, false, false ] ] ); //背景
        }
    }

    config.navibar = CreateElement.NaviBar( config.navibar );

    if ( nowalpha2 > 0 )
    {
        //Draw.LoadingAnimation( 0,[[Windows_x+140,Windows_y+40],[150,150,150,nowalpha2],0.3] );
        Render_String( Windows_x+115, Windows_y+20, 0, "Draging...", [120,120,120,nowalpha2], Render_GetFont("segoeui.ttf", 12, true) );
    }

    if ( doubleBuffer.value_2_2 > 0 )
    {

        if ( Math.floor(Global_Realtime()*1000) % 1 == 0 )
        {
            doubleBuffer.value_2_2 = Tools.Normalize( Tools.Switchaddition( doubleBuffer.value_2_2,5,false ) ,[0,255] );
        }

        const tlcolor = [th.BackgroundCol[0],th.BackgroundCol[1],th.BackgroundCol[2],doubleBuffer.value_2_2];

        Draw.CosRoundedRec( [ [Windows_x,Windows_y,280,460], tlcolor, [true, true, true, true, false ] ] ); //背景

    }

    if ( GlobalVars.GetElementOpened() == 2 || true )
    {
        // switch_page

        //Draw.CosRoundedRec( [ [Windows_x+560,Windows_y+430,80,15], [0,0,0,8], [true, true, true, true, false ] ] ); //背景

        Render_FilledCircle( Windows_x+570,Windows_y+437, 4, [180,180,180,255]);
        Render_FilledCircle( Windows_x+580,Windows_y+437, 4, [220,220,220,255]);
        Render_FilledCircle( Windows_x+590,Windows_y+437, 4, [220,220,220,255]);
        Render_FilledCircle( Windows_x+600,Windows_y+437, 4, [220,220,220,255]);

        Render_String( Windows_x+545, Windows_y+425, 0, "<", [140,140,140,255], Render_GetFont("segoeuib.ttf", 15, true) );
        Render_String( Windows_x+615, Windows_y+425, 0, ">", [140,140,140,255], Render_GetFont("segoeuib.ttf", 15, true) );
    
    
    }

    Render_String( Windows_x+25, Windows_y+430, 0, "Powered by VANTED | MSR GAMING", [128,128,128,64], Render_GetFont("segoeui.ttf", 10, true) );
    

}

const ThreadCallback =
{
    Draw: function()
    {
        _DEBUG.SHOW_FILLED_EDGE.TOGGLE = 0;
        Tools.UpdateGlobalVars();
        Main();

        switch( UI.GetValue( ["Config",".CC settings",".CC settings","Theme"] ) )
        {
            case 0:
                Settings.Theme = ["Dark"];
                break;
            case 1:
                Settings.Theme = ["Default"];
                break;
            
        }

    }
}

Cheat.RegisterCallback("Draw","ThreadCallback.Draw");

Tools.OverrideDefaultConfig();
