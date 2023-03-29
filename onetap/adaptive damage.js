
UI.AddSubTab(["Rage", "SUBTAB_MGR"], "Adaptive Damage");

UI.AddHotkey(["Rage", "General", "General", "Key assignment"], "Damage override", "Damage override");

UI.AddCheckbox(["Rage", "Adaptive Damage",  "Adaptive Damage"], "Draw damage");

var weapon_ui = UI.AddDropdown(["Rage", "Adaptive Damage",  "Adaptive Damage"], "Weapon select", [], 0);

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
    maxDamage: function( targetPlayer_index )
    {
        if (this.isAvailable(targetPlayer_index))
        {
            const Data = this.TraceBoxs(targetPlayer_index);
            if ( Data != null )
            {
                var Damage = 0;
                for( j = 0; j<=18 ; ++j )
                {
                    const dmg = Data[j].damage;
                    Damage = ( Damage > dmg ? Damage : dmg );
                }
                return Damage;
            }
        }
        else
        {
            return -1;
        }
    },
    avgDamage: function( targetPlayer_index )
    {
        if (this.isAvailable(targetPlayer_index))
        {
            const Data = this.TraceBoxs(targetPlayer_index);
            var max = 0;
            var min = 0x7fffffff;
            if ( Data != null )
            {
                var Damage = 0;
                for( j = 0; j<=18 ; ++j )
                {
                    var dmg = Data[j].damage;
                    
                    if ( dmg > 100 )
                    {
                        dmg = 100;
                    }

                    Damage += dmg;

                    if ( dmg > max )
                    {
                        max = dmg;
                    }
                    if ( dmg < min )
                    {
                        min = dmg;
                    }
                }
                return Math.floor((Damage-max-min)/17);
            }
        }
        else
        {
            return -1;
        }
    }
}

var weapon_list = {0: "General",1: "Deagle",2: "Dualies",3: "Five Seven", 4: "Glock",7: "AK47",8: "AUG",9: "AWP",10: "FAMAS",11: "G3SG1",13: "GALIL",14: "M249",16: "M4A4",17: "Mac10",19: "P90",23: "MP5",24: "UMP45",25: "XM1014",26: "PP-Bizon",27: "MAG7",28: "Negev",29: "Sawed off",30: "Tec-9",32: "P2000",33: "MP7",34: "MP9",35: "Nova",36: "P250",38: "SCAR20",39: "SG553",40: "SSG08",60: "M4A1-S",61: "USP",63: "CZ-75",64: "Revolver"};
var tab_names = ["General", "USP", "Glock", "Five Seven", "Tec-9", "Deagle", "Revolver", "Dualies", "P250", "CZ-75", "Mac10", "P90", "MP5", "MP7", "MP9", "UMP45", "PP-Bizon", "M4A1-S", "M4A4", "AK47", "AUG", "SG553", "FAMAS", "GALIL", "AWP", "SSG08", "SCAR20", "G3SG1", "M249", "XM1014", "MAG7", "Negev", "Sawed off"];
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

var add_once = false;
var alb_list = [];

function DrawMenu(  )
{
    if ( !add_once )
    {
        
        var j = 0;
        for( var i =0; i<=64; ++i )
        {
            var name = weapon_list[i];
            if ( name != undefined )
            {
                alb_list[j++] = name;
            }
        }
        UI.UpdateList(weapon_ui, alb_list);

        for( var i = 0; i<alb_list.length; ++i )
        {
            const p = "[" +alb_list[i]+ "] ";
            UI.AddCheckbox(["Rage", "Adaptive Damage",  "Adaptive Damage"], p + "Enabled");
            UI.AddSliderInt(["Rage", "Adaptive Damage",  "Adaptive Damage"], p + "Min visible damage", 0, 120);
            UI.AddSliderInt(["Rage", "Adaptive Damage",  "Adaptive Damage"], p + "Max visible damage", 0, 120);
            UI.AddSliderInt(["Rage", "Adaptive Damage",  "Adaptive Damage"], p + "Min wall damage", 0, 120);
            UI.AddSliderInt(["Rage", "Adaptive Damage",  "Adaptive Damage"], p + "Max wall damage", 0, 120);
            UI.AddSliderInt(["Rage", "Adaptive Damage",  "Adaptive Damage"], p + "Damage override", 0, 120);

            UI.SetEnabled(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Enabled"],0);
            UI.SetEnabled(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Min visible damage"],0);
            UI.SetEnabled(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Max visible damage"],0);
            UI.SetEnabled(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Min wall damage"],0);
            UI.SetEnabled(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Max wall damage"],0);
            UI.SetEnabled(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Damage override"],0);

        }
        //UI.AddSliderInt(["Rage", "Adaptive Damage",  "Adaptive Damage"], "By VANTED QQ1919923581", 0, 0);
        add_once = true;
    }

    const NowOpend = UI.GetValue(["Rage", "Adaptive Damage",  "Adaptive Damage","Weapon select"]);

    for( var i = 0; i<alb_list.length; ++i )
    {
        const p = "[" +alb_list[i]+ "] ";
        var state = 0;
        if ( NowOpend == i )
        {
            state = 1;
        }
        UI.SetEnabled(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Enabled"],state);
        const Enabled = UI.GetValue(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Enabled"]);

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
        
        UI.SetEnabled(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Min visible damage"],state);
        UI.SetEnabled(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Max visible damage"],state);
        UI.SetEnabled(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Min wall damage"],state);
        UI.SetEnabled(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Max wall damage"],state);
        UI.SetEnabled(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Damage override"],state);

    }
}

var sync_damage = 0;
var sync_damage1 = 0;

var chase_time = -1;
var adp_time = -1;


function CreateMove(  )
{

    locapPLayer_index = Entity.GetLocalPlayer();
    
    if ( !Target.isAvailable( locapPLayer_index ) )
    {
        sync_damage = 0;
        sync_damage1 = 0;
        return;
    }

    const p = "[" +getCurrentWeapon(locapPLayer_index)+ "] ";

    const Enabled = UI.GetValue(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Enabled"]);

    if ( Enabled )
    {

        
        const Overrided = UI.GetValue(["Rage", "General", "General", "Key assignment", "Damage override"]);


        if ( Overrided )
        {

            const Damage_override = UI.GetValue(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Damage override"]);
            
            const enemies = Entity.GetEnemies();

            for( var i = 0; i<enemies.length; ++i )
            {
                Ragebot.ForceTargetMinimumDamage(enemies[i], Damage_override);
            }

        }
        else
        {
            const Min_visible_damage = UI.GetValue(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Min visible damage"]);
            const Max_visible_damage = UI.GetValue(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Max visible damage"]);
            const Min_wall_damage = UI.GetValue(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Min wall damage"]);
            const Max_wall_damage = UI.GetValue(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Max wall damage"]);

            const enemies = Entity.GetEnemies();

            var target_cnt = 0;
            
            var sync_damage_tmp = 0;
            var sync_damage_tmp1 = 0;

            for( var i = 0; i<enemies.length; ++i )
            {
                if ( Target.isAvailable( enemies[i] ) && Target.maxDamage( enemies[i] ) > 0 )
                {

                    if ( Target.maxDamage( enemies[i] ) <= 0 )
                    {
                        Ragebot.ForceTargetMinimumDamage(enemies[i], Min_visible_damage);
                    }
                    else
                    {
                        const TargetAvailableDamage = Target.avgDamage( enemies[i] );

                        const TargetIsVisible = Target.isVisible( enemies[i] );
    
                        var FinalDamage = 0;
    
                        var Min_damage = 0;
                        var Max_damage = 0;  
    
                        if ( TargetIsVisible )
                        {
                            Min_damage = Min_visible_damage;
                            Max_damage = Max_visible_damage;
                        }
                        else
                        {
                            Min_damage = Min_wall_damage;
                            Max_damage = Max_wall_damage;
                        }
    
                        FinalDamage = ((TargetAvailableDamage + ( ( Min_damage + Max_damage ) / 2 )) / 2);
    
                        if ( FinalDamage > Max_damage )
                        {
                            FinalDamage = Max_damage;
                        }
                        if ( FinalDamage < Min_damage )
                        {
                            FinalDamage = Min_damage;
                        }
    
                        if ( !TargetIsVisible )
                        {
                            if ( FinalDamage > TargetAvailableDamage )
                            {
                                FinalDamage = TargetAvailableDamage;
                            }
                            if ( FinalDamage > Max_damage )
                            {
                                FinalDamage = Max_damage;
                            }
                            if ( FinalDamage < Min_damage )
                            {
                                FinalDamage = Min_damage;
                            }
                        }
                        else
                        {
                            if ( FinalDamage < TargetAvailableDamage )
                            {
                                FinalDamage = TargetAvailableDamage;
                            }
                            if ( FinalDamage > Max_damage )
                            {
                                FinalDamage = Max_damage;
                            }
                        }
    
                        var enemy_health = Entity.GetProp(enemies[i], "CCSPlayer", "m_iHealth")
    
                        if ( enemy_health < Max_damage && TargetAvailableDamage >= enemy_health )
                        {
                            FinalDamage = enemy_health + 2;
                            chase_time = Global.Realtime();
                        }
    
                        adp_time = Global.Realtime();
    
                        sync_damage_tmp += FinalDamage;
                        sync_damage_tmp1 += TargetAvailableDamage;
    
                        target_cnt += 1;
    
                        Ragebot.ForceTargetMinimumDamage(enemies[i], FinalDamage);
    
                    }
                }
            }

            if ( target_cnt != 0 && sync_damage_tmp != 0 )
            {
                sync_damage = Math.floor(sync_damage_tmp/target_cnt);
                sync_damage1 = Math.floor(sync_damage_tmp1/target_cnt);
            }
        }
        
    }

}

function drawDamage(  )
{

    if ( !Target.isAvailable( Entity.GetLocalPlayer() ) )
    {
        return;
    }

    const p = "[" +getCurrentWeapon(Entity.GetLocalPlayer())+ "] ";

    const Enabled = UI.GetValue(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Enabled"]);

    if ( Enabled )
    {
        const DrawDamage = UI.GetValue(["Rage", "Adaptive Damage",  "Adaptive Damage","Draw damage"]);
        if ( DrawDamage )
        {

            const Overrided = UI.GetValue(["Rage", "General", "General", "Key assignment", "Damage override"]);

            if ( Overrided )
            {
                const Damage_override = UI.GetValue(["Rage", "Adaptive Damage",  "Adaptive Damage",p + "Damage override"]);
                var color = [255, 255, 255, 240];
                Render.String(Render.GetScreenSize()[0]/2 - 60, (Render.GetScreenSize()[1]/2)+50, 0, "Damage override:  " + Damage_override.toString(), color, Render.GetFont("segoeuib.ttf",12,true));
            }
            else
            {
                var color = [255, 255, 255, 140];
                if ( adp_time != -1 )
                {
                    color = [255,255,255,240];
                    if ( Global.Realtime() - adp_time > 4 )
                    {
                        adp_time = -1;
                    }
                }
                if ( chase_time != -1 )
                {
                    color = [40,255,60,240];
                    if ( Global.Realtime() - chase_time > 4 )
                    {
                        chase_time = -1;
                    }
                }
                Render.String(Render.GetScreenSize()[0]/2 - 60, (Render.GetScreenSize()[1]/2)+50, 0, "Adaptive Damage:  " + sync_damage.toString() + "-" + sync_damage1.toString(), color, Render.GetFont("segoeuib.ttf",12,true));
            
            }

        }
    }
    
}

Cheat.RegisterCallback("Draw", "DrawMenu");
Cheat.RegisterCallback("CreateMove", "CreateMove");
Cheat.RegisterCallback("Draw", "drawDamage");
