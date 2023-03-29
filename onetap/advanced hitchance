
UI.AddSubTab(["Rage", "SUBTAB_MGR"], "Adv-Hitchance");
UI.AddCheckbox(["Rage", "Adv-Hitchance",  "Adv-Hitchance"], "Draw hitchance");

var weapon_ui = UI.AddDropdown(["Rage", "Adv-Hitchance",  "Adv-Hitchance"], "Weapon select", [], 0);

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
    },
    TraceBoxs: function ( targetPlayer_index )
    {

        if (this.isAvailable(targetPlayer_index))
        {
            var bulletTrace = [];
            const localPlayer_index = Entity.GetLocalPlayer();
            const startHeadPos = Entity.GetHitboxPosition(localPlayer_index, 0);
            for ( var i = 0; i <= 18; ++i )
            {
                const endBoxPos = Entity.GetHitboxPosition(targetPlayer_index, i);
                const result = Trace.Bullet(targetPlayer_index, localPlayer_index, endBoxPos, startHeadPos);
                if ( result != null )
                {
                    bulletTrace[i] = 
                    {
                        damage: result[1],
                        visible: result[2]
                    }
                }
                else
                {
                    bulletTrace[i] = 
                    {
                        damage: null,
                        visible: null
                    }
                }
            }
            return bulletTrace;
        }
        else
        {
            return null;
        }

    },
    isVisible: function( targetPlayer_index )
    {
        if (this.isAvailable(targetPlayer_index))
        {
            const Data = this.TraceBoxs(targetPlayer_index);
            if ( Data != null )
            {
                var Visible = false;
                for( j = 0; j<=18 ; ++j )
                {
                    Visible = ( Visible == true ? Visible : Data[j].visible );
                }
                return Visible;
            }
        }
        else
        {
            return false;
        }
    },
    weapon_list: {0: "General",1: "Deagle",2: "Dualies",3: "Five Seven", 4: "Glock",7: "AK47",8: "AUG",9: "AWP",10: "FAMAS",11: "G3SG1",13: "GALIL",14: "M249",16: "M4A4",17: "Mac10",19: "P90",23: "MP5",24: "UMP45",25: "XM1014",26: "PP-Bizon",27: "MAG7",28: "Negev",29: "Sawed off",30: "Tec-9",32: "P2000",33: "MP7",34: "MP9",35: "Nova",36: "P250",38: "SCAR20",39: "SG553",40: "SSG08",60: "M4A1-S",61: "USP",63: "CZ-75",64: "Revolver"},
    getWeapon: function (player) {
        if (!Entity.IsAlive(player)) return "General";
        var weapon = Entity.GetProp(player, "CBasePlayer", "m_hActiveWeapon");
        if (weapon === "m_hActiveWeapon") return "General";
        weapon = (Entity.GetProp(weapon, "CBaseAttributableItem", "m_iItemDefinitionIndex") & 0xFFFF);
        if (this.weapon_list[weapon] != undefined) {
            return this.weapon_list[weapon];
        } else {
            return "General";
        }
    },
    getDistance: function( local_index, target_index )
    {
        if ( this.isAvailable( local_index ) && this.isAvailable( target_index ) )
        {
            const HitboxPos = Entity.GetHitboxPosition(local_index, 0);
            const BotEyePos = Entity.GetEyePosition(target_index)
            const ResultX = Math.abs(HitboxPos[0] - BotEyePos[0]);
            const ResultY = Math.abs(HitboxPos[1] - BotEyePos[1]);
            const ResultXX = ResultX * ResultX;
            const ResultYY = ResultY * ResultY;
            const ResultXY = ResultXX + ResultYY;
            const Distance = Math.floor(Math.sqrt( ResultXY ));  // 勾股定理
            return Distance;
        }
        else
        {
            return null;
        }
    },
    getSpeed: function ( target_index ) { //获取速度
        var velocity = Entity.GetProp(target_index, "CBasePlayer", "m_vecVelocity[0]");
        return Math.sqrt(velocity[0] * velocity[0] + velocity[1] * velocity[1]);
    },
    getVelocity: function( target_index )
    {
        return Entity.GetProp(target_index, "CBasePlayer", "m_vecVelocity[0]")
    }
}

function log ( msg )
{
    Cheat.PrintColor([250, 166, 24, 255], " [ VANTED.CC ] " + msg + "\n")
}

const tab_names = ["General", "USP", "Glock", "Five Seven", "Tec-9", "Deagle", "Revolver", "Dualies", "P250", "CZ-75", "Mac10", "P90", "MP5", "MP7", "MP9", "UMP45", "PP-Bizon", "M4A1-S", "M4A4", "AK47", "AUG", "SG553", "FAMAS", "GALIL", "AWP", "SSG08", "SCAR20", "G3SG1", "M249", "XM1014", "MAG7", "Negev", "Sawed off"];

var add_once = false;
var alb_list = [];

function drawMenu(  )
{
    if ( !add_once )
    {
        
        var j = 0;
        for( var i =0; i<=64; ++i )
        {
            var name = Target.weapon_list[i];
            if ( name != undefined )
            {
                alb_list[j++] = name;
            }
        }
        UI.UpdateList(weapon_ui, alb_list);

        for( var i = 0; i<alb_list.length; ++i )
        {
            const p = "[" +alb_list[i]+ "] ";
            UI.AddCheckbox(["Rage", "Adv-Hitchance",  "Adv-Hitchance"], p + "Enabled");
            UI.AddSliderInt(["Rage", "Adv-Hitchance",  "Adv-Hitchance"], p + "Offset hitchance", 0, 100);
            UI.AddSliderInt(["Rage", "Adv-Hitchance",  "Adv-Hitchance"], p + "Maximum hc shift", 0, 25);
            UI.AddSliderInt(["Rage", "Adv-Hitchance",  "Adv-Hitchance"], p + "Minimum hc shift", -25, 0);
            UI.AddDropdown(["Rage", "Adv-Hitchance",  "Adv-Hitchance"], p + "Adaptive mode", ["default","prefer speed","prefer accuracy"], 0);
            UI.AddDropdown(["Rage", "Adv-Hitchance",  "Adv-Hitchance"], p + "Visable mode", ["dynamic","static"], 0);

            UI.SetEnabled(["Rage", "Adv-Hitchance",  "Adv-Hitchance",p + "Enabled"],0);
            UI.SetEnabled(["Rage", "Adv-Hitchance",  "Adv-Hitchance",p + "Offset hitchance"],0);
            UI.SetEnabled(["Rage", "Adv-Hitchance",  "Adv-Hitchance",p + "Maximum hc shift"],0);
            UI.SetEnabled(["Rage", "Adv-Hitchance",  "Adv-Hitchance",p + "Minimum hc shift"],0);
            UI.SetEnabled(["Rage", "Adv-Hitchance",  "Adv-Hitchance",p + "Adaptive mode"],0);
            UI.SetEnabled(["Rage", "Adv-Hitchance",  "Adv-Hitchance",p + "Visable mode"],0);

        }
        //UI.AddSliderInt(["Rage", "Adv-Hitchance",  "Adv-Hitchance"], "By VANTED QQ1919923581", 0, 0);
        add_once = true;
    }

    const NowOpend = UI.GetValue(["Rage", "Adv-Hitchance",  "Adv-Hitchance","Weapon select"]);

    for( var i = 0; i<alb_list.length; ++i )
    {
        const p = "[" +alb_list[i]+ "] ";
        var state = 0;
        if ( NowOpend == i )
        {
            state = 1;
        }
        UI.SetEnabled(["Rage", "Adv-Hitchance",  "Adv-Hitchance",p + "Enabled"],state);
        const Enabled = UI.GetValue(["Rage", "Adv-Hitchance",  "Adv-Hitchance",p + "Enabled"]);

        if ( !Enabled )
        {
            state = 0;
            UI.SetEnabled(["Rage", "Target", alb_list[i],"Minimum damage"],1);

        }
        else
        {
            UI.SetEnabled(["Rage", "Target", alb_list[i],"Minimum damage"],0);
            UI.SetValue(["Rage", "Target", alb_list[i],"Minimum damage"],0);
        }
        
        UI.SetEnabled(["Rage", "Adv-Hitchance",  "Adv-Hitchance",p + "Offset hitchance"],state);
        UI.SetEnabled(["Rage", "Adv-Hitchance",  "Adv-Hitchance",p + "Maximum hc shift"],state);
        UI.SetEnabled(["Rage", "Adv-Hitchance",  "Adv-Hitchance",p + "Minimum hc shift"],state);
        UI.SetEnabled(["Rage", "Adv-Hitchance",  "Adv-Hitchance",p + "Adaptive mode"],state);
        UI.SetEnabled(["Rage", "Adv-Hitchance",  "Adv-Hitchance",p + "Visable mode"],state);

    }
}

function CreateMove(  )
{

    locapPLayer_index = Entity.GetLocalPlayer();
    
    if ( !Target.isAvailable( locapPLayer_index ) )
    {
        return;
    }

    

}

function drawHitchance(  )
{

    if ( !Target.isAvailable( Entity.GetLocalPlayer() ) )
    {
        return;
    }

    const p = "[" +getCurrentWeapon(Entity.GetLocalPlayer())+ "] ";

    const Enabled = UI.GetValue(["Rage", "Adv-Hitchance",  "Adv-Hitchance",p + "Enabled"]);

    if ( Enabled )
    {
        const DrawHitchance = UI.GetValue(["Rage", "Adv-Hitchance",  "Adv-Hitchance","Draw hitchance"]);
        if ( DrawHitchance )
        {
            var color = [255, 255, 255, 140];
            Render.String(Render.GetScreenSize()[0]/2 - 60, (Render.GetScreenSize()[1]/2)+50, 0, "Hitchance:  ", color, Render.GetFont("segoeuib.ttf",12,true));
    

        }
    }
    
}

Cheat.RegisterCallback("Draw", "drawMenu");
Cheat.RegisterCallback("CreateMove", "CreateMove");
Cheat.RegisterCallback("Draw", "drawHitchance");

log( "Hitchance loaded successfully" )
