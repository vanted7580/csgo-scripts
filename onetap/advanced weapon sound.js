const path = "C:\\onetap\\weapon sounds\\";
var weapon_list = {
    1: "Deagle",
    2: "Dualies",
    3: "Five Seven",
    4: "Glock",
    7: "AK47",
    8: "AUG",
    9: "AWP",
    10: "FAMAS",
    11: "G3SG1",
    13: "GALIL",
    14: "M249",
    16: "M4A4",
    17: "Mac10",
    19: "P90",
    23: "MP5",
    24: "UMP45",
    25: "XM1014",
    26: "PPBizon",
    27: "MAG7",
    28: "Negev",
    29: "Sawed off",
    30: "Tec9",
    32: "P2000",
    33: "MP7",
    34: "MP9",
    35: "Nova",
    36: "P250",
    38: "SCAR20",
    39: "SG553",
    40: "SSG08",
    60: "M4A1S",
    61: "USP",
    63: "CZ75",
    64: "Revolver"
};

var weapon_holding;
var last_shot_time = 0;
var init = false

UI.AddSubTab(["Config", "SUBTAB_MGR"], "Sounds");

function getCurrentWeapon(player) {
    if (!Entity.IsAlive(player)) return "General";
    var weapon = Entity.GetProp(player, "CBasePlayer", "m_hActiveWeapon");
    if (weapon === "m_hActiveWeapon") return "General";
    weapon = (Entity.GetProp(weapon, "CBaseAttributableItem", "m_iItemDefinitionIndex") & 0xFFFF);
    if (weapon_list[weapon] != undefined) {
        return weapon_list[weapon];
    } else {
        return "General";
    }
}

function play_sounds(  )
{
    if ( UI.GetValue(["Config","Sounds","Sounds",weapon_holding]) )
    {
        UI.SetValue(["Misc.","Helpers","Weapon sound volume"],0);
        Sound.Play(path + weapon_holding + ".wav");
        last_shot_time = Global.Realtime();
    }
}

function main(  )
{

    weapon_holding = getCurrentWeapon(Entity.GetLocalPlayer());
    
    if ( !init )
    {
        //Cheat.Print(weapon_list[1]);
        for( var i =1;i<=64;++i )
        {
            var name = weapon_list[i];
            if ( name != undefined )
            {
                UI.AddCheckbox(["Config","Sounds","Sounds"],name);
            }
        }
        init = true;
    }
    
    if ( Global.Realtime() - last_shot_time > 0.1)
    {
        UI.SetValue(["Misc.","Helpers","Weapon sound volume"],100);
    }
    
}

Cheat.RegisterCallback("ragebot_fire","play_sounds");
Cheat.RegisterCallback("Draw","main");
