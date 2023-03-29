// 首个官匹假蹲js

const version = "Preview Edition [ Alpha ] "

// 30 64 66 53

var offset_min_height = 30
var offset_max_height = 75
var offset_choke_height = 40
var offset_send_height = 40

UI.AddSubTab(["Config", "SUBTAB_MGR"], "Adv-Fakeduck")
UI.AddHotkey(["Config", "SUBTAB_MGR", "Scripts", "SHEET_MGR", "Keys", "JS Keybinds"], "Fakeduck", "Fakeduck")

const path_menu = ["Config", "SUBTAB_MGR", "Adv-Fakeduck",  "Adv-Fakeduck"]

UI.AddDropdown (path_menu, "Height", ["default","higher"], 0);

//UI.AddSliderInt(path_menu, "Min height", 0, 100)
//UI.AddSliderInt(path_menu, "Max height", 0, 100)
//UI.AddSliderInt(path_menu, "Choke height", 0, 100)
//UI.AddSliderInt(path_menu, "Send height", 0, 100)

UI.AddCheckbox( path_menu, "Flip duck" )
UI.AddCheckbox( path_menu, "Fast recovery" )
UI.AddCheckbox( path_menu, "Fast sync" )
UI.AddCheckbox( path_menu, "Break yaw" )
//UI.AddDropdown (path_menu, "Anti-Aim [ Not working yet ]", ["default","low delta","low delta with lby"], 0);

const Target =
{
    isAvailable: function ( targetPlayer_index )
    {
        if (Entity.IsValid(targetPlayer_index) == true && Entity.IsAlive(targetPlayer_index) && Entity.IsDormant(targetPlayer_index) == false)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}

function print( msg )
{
    Cheat.PrintChat( msg.toString() )
}
function log ( msg )
{
    Cheat.PrintColor([250, 166, 24, 255], " [ VANTED.CC ] " + msg + "\n")
}
function GetValue( name )
{
    return UI.GetValue(["Config", "Adv-Fakeduck",  "Adv-Fakeduck",name])
}
function SetEnabled( name, value )
{
    UI.SetEnabled(["Config", "Adv-Fakeduck",  "Adv-Fakeduck",name], value)
}
function add_to_arr ( arr, value )
{
    for ( var i = arr.length-1; i > 0; -- i )
    {
        arr[i] = arr[i-1]
    }
    arr[0] = value
    return arr
} 
function cb_arr_str ( arr, now )
{
    if ( now == (arr.length - 1) )
    {
        return (arr[now]).toString()
    }
    return (arr[now]).toString()+"-"+cb_arr_str(arr,now+1)
}

var globalvars = 
{
    dir: false,
    choke_cnt: 0,
    choke_cnt_refres: false,
    choke_cnt_arr: [0,0,0,0,0,0],
    fix_overdirve: false,
    fix_overdirve_time: 0,
    fake_lag_last: 0,
    lby_last: 0,
    fast_crouch_last: 1,
    flip_last: -1,
    flip_enabled: false,
    while_shot: false,
    fast_sync: -1,
    last_server: ""
}

function CreateMove()
{
    const local_player = Entity.GetLocalPlayer()
   
    const key = UI.GetValue(["Config", "SUBTAB_MGR", "Scripts", "SHEET_MGR", "Keys", "JS Keybinds", "Fakeduck"])

    if ( key )
    {

        switch ( GetValue("Height") )
        {
            case 0:
                offset_min_height = 30
                offset_max_height = 70
                offset_choke_height = 40
                offset_send_height = 40
            break
            case 1:
                offset_min_height = 30
                offset_max_height = 75
                offset_choke_height = 40
                offset_send_height = 40
            break
        }

        AntiAim.SetOverride(1)

        //const min_height = GetValue("Min height") / 100
        //const max_height = GetValue("Max height") / 100
        //const choke_height = GetValue("Choke height") / 100
        //const send_height = GetValue("Send height") / 100

        const min_height = offset_min_height / 100
        const max_height = offset_max_height / 100
        const choke_height = offset_choke_height / 100
        const send_height = offset_send_height / 100 
        const now_height = 1-Entity.GetProp(local_player, "CCSPlayer", "m_flDuckAmount")
        const player_cmd = UserCMD.GetButtons()

        if ( Globals.ChokedCommands() > globalvars.choke_cnt )
        {
            globalvars.choke_cnt = Globals.ChokedCommands();
        }

        if ( globalvars.while_shot )
        {
            globalvars.dir = false
            globalvars.while_shot = false
            if ( GetValue("Fast recovery") )
            {
                if ( GetValue("Fast sync") )
                {
                    globalvars.fast_sync = 2
                }
                else
                {
                    globalvars.fast_sync = 1
                }
            }
        }

        if ( globalvars.dir == false )
        {
            UserCMD.SetButtons(player_cmd | (1 << 2)) // duck
            if ( globalvars.fast_sync > 0 ) // fast recovery
            {
                UserCMD.Send()
                if ( GetValue("Break yaw") && globalvars.fast_sync == 2 ) // break yaw
                {
                    UI.ToggleHotkey(["Rage", "Anti Aim", "General", "Key assignment", "AA Direction inverter"])
                    var sign = 1
                    if ( Math.random() > 0.5 )
                    {   
                        sign = -sign
                    }
                    AntiAim.SetFakeOffset( Math.random() * 12 * sign )
                    AntiAim.SetRealOffset( - Math.random() * 64 * sign )
                    if ( Math.random() > 0.5 )
                    {   
                        sign = -sign
                    }
                    AntiAim.SetLBYOffset( - Math.random() * 180 * sign )
                }
                globalvars.fast_sync = globalvars.fast_sync - 1
            }
            else
            {
                if ( globalvars.fast_sync == 0)
                {
                    if ( now_height < 0.15 )
                    {
                        globalvars.fast_sync = -1
                    }
                    else
                    {
                        UserCMD.Send()
                    }
                }
                else if ( now_height < min_height )
                {
                    globalvars.choke_cnt_arr = add_to_arr( globalvars.choke_cnt_arr, globalvars.choke_cnt )
                    globalvars.choke_cnt = 0
                    globalvars.dir = true
                    UserCMD.Choke()
                }
                else if ( now_height > send_height )
                {
                    height_fix = ( ( now_height >= 0.573 && now_height <= 0.575) && Globals.ChokedCommands() >= 6 )
                    if ( Globals.ChokedCommands() < 6 ||  height_fix)
                    {
                        UserCMD.Choke()
                    }
                    else
                    {
                        UserCMD.Send()
                    }
                }
                else if ( Math.abs( now_height - send_height ) <= 0.05 && Globals.ChokedCommands() != 0 )
                {
                    UserCMD.Send()
                }
                else
                {
                    UserCMD.Choke()
                }
            }
            
        }
        else if ( globalvars.dir == true )
        {
            UserCMD.SetButtons(player_cmd | (1 << 22))
            if ( now_height >= max_height ) 
            {
                globalvars.dir = false
                UserCMD.Choke()
            }
            if ( now_height < choke_height )
            {
                UserCMD.Choke()
            }
            else if ( Math.abs( now_height - choke_height ) <= 0.05 )
            {
                UserCMD.Send()
            }
            else
            {
                UserCMD.Choke()
            }
        }
    }
    else
    {
        //AntiAim.SetOverride(0)
        const player_cmd = UserCMD.GetButtons()
        UserCMD.SetButtons(player_cmd | (1 << 22))
        globalvars.choke_cnt_arr = add_to_arr( globalvars.choke_cnt_arr, 0 )
        globalvars.while_shot = false
    }
}

const FS = // From Futuresense By AD1337
{
    DEG2RAD: function(degree) {
        return (Math.PI / 180) * degree;
    },
    ANGLE2VEC: function(angle) {
        pitch = angle[0];
        yaw = angle[1];
        return [Math.cos(this.DEG2RAD(pitch))*Math.cos(this.DEG2RAD(yaw)), Math.cos(this.DEG2RAD(pitch))* Math.sin(this.DEG2RAD(yaw)), -Math.sin(this.DEG2RAD(pitch))];
    },
    getWallDistance: function(entity, angle) {
        vector = this.ANGLE2VEC(angle);
        origin = Entity.GetRenderOrigin(entity);
        origin[2] += Entity.GetProp(entity, "CBasePlayer", "m_vecViewOffset[2]")[0];
        end = [origin[0] + vector[0] * 8192, origin[1] + vector[1] * 8192, origin[2] + vector[2] * 8192];
        result = Trace.Line(entity, origin, end);
        if (!result[1] == 1) {
            wall = [origin[0] + vector[0] * result[1] * 8192, origin[1] + vector[1] * result[1] * 8192, origin[2] + vector[2] * result[1] * 8192];
            distance = Math.sqrt(Math.pow(origin[0] - wall[0], 2) + Math.pow(origin[1] - wall[1], 2) + Math.pow(origin[2] - wall[2], 2));
            return distance;
        } else {
            return 0;
        }
    }
}

function Fire() {
    if (Entity.IsLocalPlayer(Entity.GetEntityFromUserID(Event.GetInt("userid")))) {
        globalvars.while_shot = true
    }
}

function Camera()
{

    const key = UI.GetValue(["Config", "SUBTAB_MGR", "Scripts", "SHEET_MGR", "Keys", "JS Keybinds", "Fakeduck"])
   
    if ( key ) {

        eyePos = Entity.GetEyePosition(Entity.GetLocalPlayer());
        origin = Entity.GetRenderOrigin(Entity.GetLocalPlayer());
        eyePos[2] = origin[2] + 50;
        cameraPos = Local.GetCameraPosition();
        if (UI.GetValue(["Misc.", "Keys", "General", "Key assignment", "Thirdperson"]) === 1) {
            angles = Local.GetViewAngles();
            angles[0] = angles[0] * -1;
            if (angles[1] > 0) {
                angles[1] = angles[1] - 180;
            } else {
                angles[1] = 180 + angles[1];
            }
            back = FS.getWallDistance(Entity.GetLocalPlayer(), angles);
            angles = FS.ANGLE2VEC(angles);

            thirdDistance = UI.GetValue(["Misc.", "View", "General", "Thirdperson Distance"]);

            Local.SetCameraPosition([eyePos[0] + angles[0] * thirdDistance, eyePos[1] + angles[1] * thirdDistance, eyePos[2] + angles[2] * thirdDistance ]);
        } 
    }
    
}

function Draw()
{

    const key = UI.GetValue(["Config", "SUBTAB_MGR", "Scripts", "SHEET_MGR", "Keys", "JS Keybinds", "Fakeduck"])
   
    server_now = World.GetServerString()

    if ( server_now != globalvars.last_server )
    {
        globalvars.last_server = server_now
        if ( globalvars.last_server != "valve" )
        {
            log( "Disabling mm fakeduck" )
        }
    }

    if ( GetValue("Fast recovery") )
    {
        SetEnabled( "Fast sync", 1 )
        if ( GetValue("Fast sync") )
        {
            SetEnabled( "Break yaw", 1 )
        }
        else
        {
            SetEnabled( "Break yaw", 0 )
        } 
    }
    else
    {
        SetEnabled( "Fast sync", 0 )
        SetEnabled( "Break yaw", 0 )
    }

    if ( globalvars.last_server != "valve" )
    {
        if ( UI.GetValue( ["Rage", "Anti Aim", "General", "Key assignment", "Fake duck"] ) != key )
        {
            UI.ToggleHotkey(["Rage", "Anti Aim", "General", "Key assignment", "Fake duck"])
        }
        return
    }

    if ( key )
    {
        
        if ( GetValue( "Flip duck" ) == 1 )
        {
            if ( globalvars.flip_last == -1 )
            {
                globalvars.flip_last = UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA Direction inverter"])
            }
            if ( Globals.ChokedCommands() == 0 && globalvars.dir != globalvars.flip_last )
            {
                UI.ToggleHotkey(["Rage", "Anti Aim", "General", "Key assignment", "AA Direction inverter"])
                globalvars.flip_last = globalvars.dir
            }
        }

        if (UI.GetValue(["Rage", "Fake Lag", "SHEET_MGR", "Enabled"]) == 1)
        {
            globalvars.fake_lag_last = 1
            UI.SetValue(["Rage", "Fake Lag", "SHEET_MGR", "Enabled"],0)    
        }
        UI.SetEnabled(["Rage", "Fake Lag", "SHEET_MGR", "Enabled"],0)

        if (UI.GetValue(["Rage", "Anti Aim", "SHEET_MGR", "Lower body yaw mode"]) > 0 )
        {
            globalvars.lby_last = UI.GetValue(["Rage", "Anti Aim", "SHEET_MGR", "Lower body yaw mode"])
            UI.SetValue(["Rage", "Anti Aim", "SHEET_MGR", "Lower body yaw mode"],0) 
        }
        UI.SetEnabled(["Rage", "Anti Aim", "SHEET_MGR", "Lower body yaw mode"],0)

        if (UI.GetValue(["Misc.", "Movement", "SHEET_MGR", "Fast crouch"]) == 0 )
        {
            globalvars.fast_crouch_last = 0
            UI.SetValue(["Misc.", "Movement", "SHEET_MGR", "Fast crouch"],1)
        }
        UI.SetEnabled(["Misc.", "Movement", "SHEET_MGR", "Fast crouch"],0)
    }
    else
    {

        if ( globalvars.flip_last != -1 && globalvars.flip_last != UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA Direction inverter"]))
        {
            if ( Globals.ChokedCommands() == 0 )
            {   
                UI.ToggleHotkey(["Rage", "Anti Aim", "General", "Key assignment", "AA Direction inverter"])
                globalvars.flip_last = -1
            }
        }

        if ( globalvars.fake_lag_last == 1 )
        {
            UI.SetValue(["Rage", "Fake Lag", "SHEET_MGR", "Enabled"],1)
            globalvars.fake_lag_last = 0
        }
        UI.SetEnabled(["Rage", "Fake Lag", "SHEET_MGR", "Enabled"],1) 

        if ( globalvars.lby_last > 0 )
        {
            UI.SetValue(["Rage", "Anti Aim", "SHEET_MGR", "Lower body yaw mode"],globalvars.lby_last)
            globalvars.lby_last = 0
        }
        UI.SetEnabled(["Rage", "Anti Aim", "SHEET_MGR", "Lower body yaw mode"],1) 

        if ( globalvars.fast_crouch_last == 0 )
        {
            UI.SetValue(["Misc.", "Movement", "SHEET_MGR", "Fast crouch"],0)
            globalvars.fast_crouch_last = 1
        }
        UI.SetEnabled(["Misc.", "Movement", "SHEET_MGR", "Fast crouch"],1)
    }
}

Cheat.RegisterCallback("CreateMove", "CreateMove");
Cheat.RegisterCallback("weapon_fire", "Fire");
Cheat.RegisterCallback("CreateMove", "Camera");
Cheat.RegisterCallback("Draw", "Draw");

UI.AddSliderInt(path_menu, "Version: " + version , 0, 0)

log( "Fakeduck loaded successfully" )
