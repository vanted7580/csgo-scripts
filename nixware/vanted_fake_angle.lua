-- Script version
ADVANCED_API_VERSION = 1.5;

-- Netvars
m_fFlags = se.get_netvar("DT_BasePlayer", "m_fFlags");
m_iHealth = se.get_netvar("DT_BasePlayer", "m_iHealth");
m_iTeamNum = se.get_netvar("DT_BaseEntity", "m_iTeamNum");
m_hActiveWeapon = se.get_netvar("DT_BaseCombatCharacter", "m_hActiveWeapon");
m_vecOrigin = se.get_netvar("DT_BaseEntity", "m_vecOrigin");
m_angEyeAngles = se.get_netvar("DT_CSPlayer", "m_angEyeAngles");
m_flSimulationTime = se.get_netvar("DT_BaseEntity", "m_flSimulationTime");
m_flOldSimulationTime = m_flSimulationTime + 0x4;
m_iAccount = se.get_netvar("DT_CSPlayer", "m_iAccount");
m_bBombTicking = se.get_netvar("DT_PlantedC4", "m_bBombTicking")
m_flC4Blow = se.get_netvar("DT_PlantedC4", "m_flC4Blow")
m_nBombSite = se.get_netvar("DT_PlantedC4", "m_nBombSite")
m_lifeState = se.get_netvar("DT_BasePlayer", "m_lifeState");
m_bPinPulled = se.get_netvar("DT_BaseCSGrenade", "m_bPinPulled");
m_fThrowTime = se.get_netvar("DT_BaseCSGrenade", "m_fThrowTime");
m_flLowerBodyYawTarget = se.get_netvar("DT_CSPlayer", "m_flLowerBodyYawTarget");
m_bGunGameImmunity = se.get_netvar("DT_CSPlayer", "m_bGunGameImmunity");
m_flFlashDuration = se.get_netvar("DT_CSPlayer", "m_flFlashDuration");
m_bIsScoped = se.get_netvar("DT_CSPlayer", "m_bIsScoped");
m_flNextAttack = se.get_netvar("DT_BaseCombatCharacter", "m_flNextAttack");
m_zoomLevel = se.get_netvar("DT_WeaponCSBaseGun", "m_zoomLevel");
m_Collision = se.get_netvar("DT_BaseEntity", "m_Collision");
m_flDuckSpeed = se.get_netvar("DT_BasePlayer", "m_flDuckSpeed");
m_flDuckAmount = se.get_netvar("DT_BasePlayer", "m_flDuckAmount");
m_iClip1 = se.get_netvar("DT_BaseCombatWeapon", "m_iClip1");
m_iClip2 = se.get_netvar("DT_BaseCombatWeapon", "m_iClip2");
m_fAccuracyPenalty = se.get_netvar("DT_WeaponCSBase", "m_fAccuracyPenalty");
m_flPostponeFireReadyTime = se.get_netvar("DT_WeaponCSBase", "m_flPostponeFireReadyTime");
m_flNextPrimaryAttack = 0x3238;  -- se.get_netvar("DT_BaseCombatWeapon", "LocalActiveWeaponData", "m_flNextPrimaryAttack");
m_iItemDefinitionIndex = 0x2FAA; -- se.get_netvar("DT_BaseAttributableItem", "m_AttributeManager", "m_Item", "m_iItemDefinitionIndex");
m_vecViewOffset = 0x108;
m_nTickBase = 0x3430; -- se.get_netvar("DT_BasePlayer", "localdata", "m_nTickBase");
m_MoveType = 0x25C;
m_aimPunchAngle = 0x302C;
m_flNextSecondaryAttack = 0x323C; -- se.get_netvar("DT_BaseCombatWeapon", "LocalActiveWeaponData", "m_flNextSecondaryAttack");
m_iShotsFired = 0xA390; -- se.get_netvar("DT_CSPlayer", "cslocaldata", "m_iShotsFired");
m_vecVelocity = {
    [0] = se.get_netvar("DT_BasePlayer", "m_vecVelocity[0]"),
    [1] = se.get_netvar("DT_BasePlayer", "m_vecVelocity[1]"),
	[2] = se.get_netvar("DT_BasePlayer", "m_vecVelocity[2]")
};

-- C definitions
local C = ffi.C;
ffi.cdef[[
	typedef void* FARPROC;
	typedef void* HMODULE;
	typedef const char* LPCSTR;
	typedef wchar_t WCHAR;
	typedef const WCHAR* LPCWSTR;
	FARPROC GetProcAddress(HMODULE hModule, LPCSTR lpProcName);
	HMODULE GetModuleHandleA(LPCSTR lpModuleName);

	struct WeaponInfo_t
	{
		char _0x0000[20];
		__int32 max_clip;	
		char _0x0018[12];
		__int32 max_reserved_ammo;
		char _0x0028[96];
		char* hud_name;			
		char* weapon_name;		
		char _0x0090[60];
		__int32 type;			
		__int32 price;			
		__int32 reward;			
		char _0x00D8[20];
		bool full_auto;		
		char _0x00ED[3];
		__int32 damage;			
		float armor_ratio;		 
		__int32 bullets;	
		float penetration;	
		char _0x0100[8];
		float range;			
		float range_modifier;	
		char _0x0110[16];
		bool silencer;			
		char _0x0121[15];
		float max_speed;		
		float max_speed_alt;
		char _0x0138[76];
		__int32 recoil_seed;
		char _0x0188[32];
	};

	typedef struct { 
		float x,y,z; 
	} vec3_t; 
	
	struct CBaseAnimState
	{
		void* pThis;
		char pad2[91];
		void* pBaseEntity; 
		void* pActiveWeapon; 
		void* pLastActiveWeapon; 
		float m_flLastClientSideAnimationUpdateTime; 
		int m_iLastClientSideAnimationUpdateFramecount; 
		float m_flEyePitch; 
		float m_flEyeYaw; 
		float m_flPitch; 
		float m_flGoalFeetYaw; 
		float m_flCurrentFeetYaw;
		float m_flCurrentTorsoYaw; 
		float m_flUnknownVelocityLean;
		float m_flLeanAmount; 
		char pad4[4];
		float m_flFeetCycle;
		float m_flFeetYawRate;
		float m_fUnknown2;
		float m_fDuckAmount; 
		float m_fLandingDuckAdditiveSomething; 
		float m_fUnknown3;
		vec3_t m_vOrigin;
		vec3_t m_vLastOrigin; 
		float m_vVelocityX; 
		float m_vVelocityY;
		char pad5[4];
		float m_flUnknownFloat1;
		char pad6[8];
		float m_flUnknownFloat2;
		float m_flUnknownFloat3; 
		float m_flUnknown; 
		float speed_2d; 
		float flUpVelocity; 
		float m_flSpeedNormalized; 
		float m_flFeetSpeedForwardsOrSideWays; 
		float m_flFeetSpeedUnknownForwardOrSideways;
		float m_flTimeSinceStartedMoving; 
		float m_flTimeSinceStoppedMoving;
		unsigned char m_bOnGround; 
		unsigned char m_bInHitGroundAnimation;
		char pad7[10];
		float m_flLastOriginZ; 
		float m_flHeadHeightOrOffsetFromHittingGroundAnimation; 
		float m_flStopToFullRunningFraction; 
		char pad8[4];
		float m_flUnknownFraction; 
		char pad9[4];
		float m_flUnknown3;
		char pad10[528];
	};
]]

-- Math variables
NULL = 0;
M_PI = 3.14159265358979323846;
M_PI_2 = 6.2831853071795862;
M_180_PI = 0.0174533;
M_PI_180 = 57.2958;
INT_MAX = 2147483647;
INFINITE = math.huge;

-- Math functions
function round(x)
  return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5);
end

function hasbit(x, p)
    return x % (p + p) >= p
end

function clamp(x, min, max)
	if (x < min) then
		x = min;
	end
	
	if (x > max) then
		x = max;
	end
	
	return x;
end

RandomFloat = ffi.cast("float(*)(float, float)", C.GetProcAddress(C.GetModuleHandleA("vstdlib.dll"), "RandomFloat"));

function IsInfinite(x)
  return x == INFINITE or x == -INFINITE;
end

function IsNaN(x)
  return x ~= x;
end

function NormalizePitch(pitch)
	if (pitch > 89) then
		return 89;
	elseif (pitch < -89) then
		return -89;
	end
	
	return pitch;
end

function NormalizeYaw(yaw)
	if (yaw > 180) then
		return yaw - (round(yaw / 360) * 360.0);
	elseif (yaw < -180) then
		return yaw + (round(yaw / 360) * -360.0);
	end
	
	return yaw;
end

function NormalizeRoll(roll)
	return 0;
end

function NormalizeAngle(vAngle)
	vAngle.pitch = NormalizePitch(vAngle.pitch);
	vAngle.yaw = NormalizeYaw(vAngle.yaw);
	vAngle.roll = NormalizeRoll(vAngle.roll);
	return vAngle;
end

function NormalizeVector(vAngle)
	vAngle.x = NormalizePitch(vAngle.x);
	vAngle.y = NormalizeYaw(vAngle.y);
	vAngle.z = NormalizeRoll(vAngle.z);
	return vAngle;
end

function VectorSubtraction(vFirst, vSecond)
	return vec3_t.new(vFirst.x - vSecond.x, vFirst.y - vSecond.y, vFirst.z - vSecond.z);
end

function VectorAddition(vFirst, vSecond)
	return vec3_t.new(vFirst.x + vSecond.x, vFirst.y + vSecond.y, vFirst.z + vSecond.z);
end

function VectorDivision(vFirst, vSecond)
	return vec3_t.new(vFirst.x / vSecond.x, vFirst.y / vSecond.y, vFirst.z / vSecond.z);
end

function VectorMultiplication(vFirst, vSecond)
	return vec3_t.new(vFirst.x * vSecond.x, vFirst.y * vSecond.y, vFirst.z * vSecond.z);
end

function VectorNumberSubtraction(Vector, Number)
	return vec3_t.new(Vector.x - Number, Vector.y - Number, Vector.z - Number);
end

function VectorNumberAddition(Vector, Number)
	return vec3_t.new(Vector.x + Number, Vector.y + Number, Vector.z + Number);
end

function VectorNumberDivision(Vector, Number)
	return vec3_t.new(Vector.x / Number, Vector.y / Number, Vector.z / Number);
end

function VectorNumberMultiplication(Vector, Number)
	return vec3_t.new(Vector.x * Number, Vector.y * Number, Vector.z * Number);
end

function GetMiddlePoint(vFirst, vSecond)
	return VectorAddition(VectorNumberDivision(VectorSubtraction(vSecond, vFirst), 2), vFirst);
end

function ExtendVector(Vector, Angle, Extension)
	local RadianAngle = Angle * M_180_PI;
	return vec3_t.new(Extension * math.cos(RadianAngle) + Vector.x, Extension * math.sin(RadianAngle) + Vector.y, Vector.z);
end

function CalcAngle(vecSource, vecDestination) 
	if (vecSource.x == nil or vecSource.y == nil or vecSource.z == nil) then
		vecSource = vec3_t.new(vecSource.pitch, vecSource.yaw, vecSource.roll);
	end
	
	if (vecDestination.x == nil or vecDestination.y == nil or vecDestination.z == nil) then
		vecDestination = vec3_t.new(vecDestination.pitch, vecDestination.yaw, vecDestination.roll);
	end

	local vAngle = vec3_t.new(0, 0, 0);	
	local vDelta = vec3_t.new(vecSource.x - vecDestination.x, vecSource.y - vecDestination.y, vecSource.z - vecDestination.z);	
	local hyp = math.sqrt(vDelta.x * vDelta.x + vDelta.y * vDelta.y);
	vAngle.x = math.atan(vDelta.z / hyp) * M_PI_180;
	vAngle.y = math.atan(vDelta.y / vDelta.x) * M_PI_180;
	vAngle.z = 0;
	
	if (vDelta.x >= 0) then
		vAngle.y = vAngle.y + 180;
	end
		
	vAngle = NormalizeVector(vAngle);
	
	return vAngle;
end

-- Converts a QAngle into either one or three normalised Vectors
function AngleVectors(vAngles)
	if (vAngles.x == nil or vAngles.y == nil or vAngles.z == nil) then
		vAngles = vec3_t.new(vAngles.pitch, vAngles.yaw, vAngles.roll);
	end

	local sy = math.sin(DEG2RAD(vAngles.y));
	local cy = math.cos(DEG2RAD(vAngles.y));
	
	local sp = math.sin(DEG2RAD(vAngles.x));
	local cp = math.cos(DEG2RAD(vAngles.x));
	
	return vec3_t.new(cp * cy, cp * sy, -sp);
end
	
-- Converts a single Vector into a QAngle.
function VectorAngles(vAngles)
	if (vAngles.x == nil or vAngles.y == nil or vAngles.z == nil) then
		vAngles = vec3_t.new(vAngles.pitch, vAngles.yaw, vAngles.roll);
	end
	
	local tmp, yaw, pitch;
	
	if (vAngles.y == 0 and vAngles.x == 0) then
		yaw = 0;
		if (vAngles.z > 0) then
			pitch = 270;
		else
			pitch = 90;
		end	
	else
		yaw = math.atan2(vAngles.y, vAngles.x) * 180.0 / M_PI;
		if (yaw < 0) then
			yaw = yaw + 360;
		end
		
		tmp = math.sqrt(vAngles.x * vAngles.x + vAngles.y * vAngles.y);
		pitch = math.atan2(-vAngles.z, tmp) * 180.0 / M_PI;
		if (pitch < 0) then
			pitch = pitch + 360;
		end
	end
	
	return vec3_t.new(pitch, yaw, 0);
end

function GetMaxDesyncDelta(Player)
	local Animstate = ffi.cast("struct CBaseAnimState*", ffi.cast("int*", Player:get_address() + 0x3914)[0]);

    if (not Animstate) then
		return 0;
	end
	
	local flRunningSpeed = math.max(0, math.min(Animstate.m_flFeetSpeedForwardsOrSideWays));
	local flYawModifier = (((Animstate.m_flStopToFullRunningFraction * -0.3) - 0.2) * flRunningSpeed) + 1.0;

	if (Animstate.m_fDuckAmount > 0) then
		local speedfactor = math.max( 0, math.min( 1, Animstate.m_flFeetSpeedUnknownForwardOrSideways ) ); 
		flYawModifier = flYawModifier + ( ( Animstate.m_fDuckAmount * speedfactor ) * ( 0.5 - flYawModifier ) )
	end

	return ffi.cast("float*", ffi.cast("int*", Player:get_address() + 0x3914)[0] + 0x334)[0] * flYawModifier;
end


function RAD2DEG(x)
	return (x * M_PI_180);
end

function DEG2RAD(x)  
	return (x * M_180_PI);
end

function VectorDot(vFirst, vSecond)
	return (vFirst.x * vSecond.x + vFirst.y * vSecond.y + vFirst.z * vSecond.z);
end
	
function VectorLengthSqr(Vector)
	return (Vector.x*Vector.x + Vector.y*Vector.y);
end
	
function GetFov(viewAngle, aimAngle)
	if (viewAngle.x == nil or viewAngle.y == nil or viewAngle.z == nil) then
		viewAngle = vec3_t.new(viewAngle.pitch, viewAngle.yaw, viewAngle.roll);
	end
	
	if (aimAngle.x == nil or aimAngle.y == nil or aimAngle.z == nil) then
		aimAngle = vec3_t.new(aimAngle.pitch, aimAngle.yaw, aimAngle.roll);
	end
	
	local Aim = AngleVectors(viewAngle);
	local Ang = AngleVectors(aimAngle);
	
	return RAD2DEG(math.acos(VectorDot(Aim, Ang) / VectorLengthSqr(Aim)));
end

function Distance3D(vFirst, vSecond)
	return (((vFirst.x - vSecond.x) ^ 2) + ((vFirst.y - vSecond.y) ^ 2) + ((vFirst.z - vSecond.z) ^ 2) * 0.5) / 300;
end

function Distance2D(vFirst, vSecond) 
	return ((vFirst.x - vSecond.x) ^ 2) + ((vFirst.y - vSecond.y) ^ 2);
end

function GetCurtime(Player)
	if (not Player or not Player:is_alive()) then
		return globalvars.get_current_time();
	end
	
	return Player:get_prop_int(m_nTickBase) * globalvars.get_interval_per_tick();
end

function GetTickrate()
	return (1.0 / globalvars.get_interval_per_tick());
end

function TIME_TO_TICKS(dt)		
	return (0.5 + dt / globalvars.get_interval_per_tick());
end

function TICKS_TO_TIME(t)
	return (globalvars.get_interval_per_tick() * t);
end

function GetLerpTime()
	local cl_updaterate = se.get_convar("cl_updaterate"):get_int();
	local sv_minupdaterate = se.get_convar("sv_minupdaterate");
	local sv_maxupdaterate se.get_convar("sv_maxupdaterate");
	
	if (sv_minupdaterate and sv_maxupdaterate) then
		cl_updaterate = sv_maxupdaterate:get_int();
	end	
	
	local cl_interp_ratio = se.get_convar("cl_interp_ratio"):get_float();
	
	if (cl_interp_ratio == 0) then
		cl_interp_ratio = 1;
	end
	
	local cl_interp = se.get_convar("cl_interp"):get_float();
	local sv_client_min_interp_ratio = se.get_convar("sv_client_min_interp_ratio");
	local sv_client_max_interp_ratio = se.get_convar("sv_client_max_interp_ratio");
	
	if (sv_client_min_interp_ratio and sv_client_max_interp_ratio and sv_client_min_interp_ratio:get_float() ~= 1) then
		cl_interp_ratio = clamp(cl_interp_ratio, sv_client_min_interp_ratio:get_float(), sv_client_max_interp_ratio:get_float());
	end
	
	return math.max(cl_interp, (cl_interp_ratio / cl_updaterate));
end

function RotateMovement(pCmd, vAngles)
	if (vAngles.x == nil or vAngles.y == nil or vAngles.z == nil) then
		vAngles = vec3_t.new(vAngles.pitch, vAngles.yaw, vAngles.roll);
	end
	
	local viewangles = engine.get_view_angles();
	local rotation = DEG2RAD(viewangles.yaw - vAngles.y);
	
	local cos_rot = math.cos(rotation);
	local sin_rot = math.sin(rotation);
	
	local new_forwardmove = (cos_rot * pCmd.forwardmove) - (sin_rot * pCmd.sidemove);
	local new_sidemove = (sin_rot *  pCmd.forwardmove) + (cos_rot * pCmd.sidemove);
	
	pCmd.forwardmove = new_forwardmove;
	pCmd.sidemove = new_sidemove;
end

-- From ValveSDK https://github.com/ValveSoftware/source-sdk-2013/blob/0d8dceea4310fde5706b3ce1c70609d72a38efdf/sp/src/public/mathlib/mathlib.h#L634
local function anglemod(x)
	x = (360.0 / 65536) * bit32.band(math.floor(x * (65536.0 / 360.0)));
	return x;
end

-- From ValveSDK https://github.com/ValveSoftware/source-sdk-2013/blob/0d8dceea4310fde5706b3ce1c70609d72a38efdf/sp/src/mathlib/mathlib_base.cpp#L3438
function ApproachAngle(target, value, speed)
	target = anglemod(target);
	value = anglemod(value);
	
	local delta = target - value;
	
	-- Speed is assumed to be positive
	speed = math.abs(speed);
	
	if (delta < -180) then
		delta = delta + 360;
	elseif (delta > 180) then
		delta = delta - 360;
	end
	
	if (delta > speed) then
		value = value + speed;
	elseif (delta < -speed) then
		value = value - speed;
	else
		value = target;
	end
	
	return value;
end

-- From ValveSDK https://github.com/ValveSoftware/source-sdk-2013/blob/master/sp/src/mathlib/mathlib_base.cpp#L3466
function AngleDifference(destAngle, srcAngle)
	local delta = math.fmod(destAngle - srcAngle, 360);
	if (destAngle > srcAngle) then
		if (delta >= 180) then
			delta = delta - 360;
		end
	else
		if (delta <= - 180) then
			delta = delta + 360;
		end
	end
	return delta;
end


-- Renderer helpers
local ScreenSize = engine.get_screen_size();
function IsOnScreen(Vector2D)
	if (Vector2D.x < 0 or Vector2D.y < 0) then
		return false;
	elseif (Vector2D.x > ScreenSize.x or Vector2D.y > ScreenSize.y) then
		return false;
	end

	return true;
end

function DrawOutlined3DCircle(vOrigin, Radius, Segments, Color)
	local Step = M_PI_2 / Segments;

	for a = 0, M_PI_2, Step do
		local vStart =  se.world_to_screen(vec3_t.new(Radius * math.cos(a) + vOrigin.x, Radius * math.sin(a) + vOrigin.y, vOrigin.z));
		local vEnd = se.world_to_screen(vec3_t.new(Radius * math.cos(a + Step) + vOrigin.x, Radius * math.sin(a + Step) + vOrigin.y, vOrigin.z));

		if (IsOnScreen(vStart) or IsOnScreen(vEnd)) then
			renderer.line(vStart, vEnd, Color);
		end
	end
end

-- Helper functions
local HasC4Func = ffi.cast("bool(__thiscall*)(void*)", client.find_pattern("client.dll", "56 8B F1 85 F6 74 31"));
function HasC4(Player)
	if (not HasC4Func) then
		client.notify("Invalid HasC4 signature!");
		return;
	end
	
	local cb = ffi.cast("void*", Player:get_address());
	return HasC4Func(cb);
end

local WeaponDataFunc = ffi.cast("int*(__thiscall*)(void*)", client.find_pattern("client.dll", "55 8B EC 81 EC ? ? ? ? 53 8B D9 56 57 8D 8B ? ? ? ? 85 C9 75 04"));
function GetWeaponData(Weapon)
	if (not WeaponDataFunc) then
		client.notify("Invalid GetWeaponData signature!");
		return;
	end

	local cb = ffi.cast("void*", Weapon:get_address());
	return ffi.cast("struct WeaponInfo_t*", WeaponDataFunc(cb));
end

local AnimstateOffset = 0x3914;
function GetAnimstate(Player)
	local PlayerAddress = Player:get_address();
	return ffi.cast("struct CBaseAnimState*", ffi.cast("int*", PlayerAddress + AnimstateOffset)[0]);
end

function IsKnife(Weapon)
	if (GetWeaponData(Weapon).type == 1) then -- NULL is knife
		return true;
	end
	
	return false;
end

function IsNade(Weapon)
	local Type = GetWeaponData(Weapon).type;
	if (Type == 0) then
		return true;
	end
	
	return false;
end

-- Exploits
function IsExploitRecharged(LocalPlayer, Weapon, Exploit)
	if (Exploit == 0 or IsKnife(Weapon) or IsNade(Weapon)) then
		return true;
	end
	
	local m_nShiftedTicks = 9;
	if (Exploit == 2) then
		m_nShiftedTicks = 12;
	end
	
	local m_Tickbase = LocalPlayer:get_prop_int(m_nTickBase);
	if (Exploit > 0) then
		m_Tickbase = LocalPlayer:get_prop_int(m_nTickBase) - m_nShiftedTicks + 1;
	end
		
	local m_flPlayerTime = m_Tickbase * globalvars.get_interval_per_tick();
	if (m_flPlayerTime < Weapon:get_prop_float(m_flNextPrimaryAttack)) then
		return false;
	end
	
	return true;
end

function GetExploitCharge(LocalPlayer, Weapon, Exploit)
	if (Exploit == 0 or IsKnife(Weapon) or IsNade(Weapon)) then
		return 0;
	end

	local m_nShiftedTicks = 9;
	if (Exploit == 2) then
		m_nShiftedTicks = 12;
	end
	
	local m_Tickbase = LocalPlayer:get_prop_int(m_nTickBase);
	if (Exploit > 0) then
		m_Tickbase = LocalPlayer:get_prop_int(m_nTickBase) - m_nShiftedTicks + 1;
	end

	local m_flPlayerTime = m_Tickbase * globalvars.get_interval_per_tick();
	local NextAttack = Weapon:get_prop_float(m_flNextPrimaryAttack);
	if (m_flPlayerTime < NextAttack) then
		return NextAttack - m_flPlayerTime;
	end
	
	return 0;
end

local FLT_EPSILON = 0x0.000002p0;

local function GetSmoothedVelocity(min_delta, a, b)
	local delta = VectorSubtraction(a, b);
	local delta_length = delta:length();

	if (delta_length <= min_delta) then
		if (-min_delta <= delta_length) then
			return a;
		else
			local iradius = 1 / (delta_length + FLT_EPSILON);
			return VectorNumberSubtraction(b, ((delta * iradius) * min_delta));
		end
	else
		local iradius = 1 / (delta_length + FLT_EPSILON);
		return VectorNumberSubtraction(b, ((delta * iradius) * min_delta));
	end
end

local function GetSafepoints(Player)
    local Animstate = GetAnimstate(Player);
    if (not Animstate) then
		return 0;
	end

	local vVelocity = vec3_t.new(Player:get_prop_float(m_vecVelocity[0]), Player:get_prop_float(m_vecVelocity[1]), Player:get_prop_float(m_vecVelocity[2]));
	local Spd = VectorLengthSqr(vVelocity);
	if (Spd > math.pow(1.2 * 260, 2)) then
		local vVelocityNormalize = NormalizeVector(vVelocity);
		vVelocity = VectorNumberMultiplication(vVelocityNormalize, (1.2 * 260));
	end

	local m_flChokedTime = Player:get_prop_float(m_flSimulationTime) - Player:get_prop_float(m_flOldSimulationTime);
	local v25 = clamp(Animstate.m_fDuckAmount + Animstate.m_fLandingDuckAdditiveSomething, 0, 1); -- 0xA4 -- m_flDuckAmount -- 0xA8 -- m_fLandingDuckAdditiveSomething
	local v26 = Animstate.m_fDuckAmount; -- 0xA4 -- m_flDuckAmount
	local v27 = m_flChokedTime * 6;
	local v28 = v25;

	-- clamp
	if ((v25 - v26) <= 27) then
		if (-v27 <= (v25 - v26)) then
			v28 = v25;
		else
			v25 = v26 - v27;
		end
	else
		v28 = v26 + v27;
	end

	local m_flDuckAmount = clamp(v28, 0, 1);

	local vAnimVelocity = GetSmoothedVelocity(m_flChokedTime * 2000, vVelocity, vec3_t.new(Animstate.m_vVelocityX, Animstate.m_vVelocityY, Animstate.flUpVelocity));
	local Speed = math.min(vAnimVelocity:length(), 260);

	local ActiveWeaponHandle = Player:get_prop_int(m_hActiveWeapon);
	local Weapon = entitylist.get_entity_from_handle(ActiveWeaponHandle);

	local flMaxMovementSpeed = 260;

	if (Weapon) then
		flMaxMovementSpeed = math.max(GetWeaponData(Weapon).max_speed_alt, 0.001);
	end

	local flRunningSpeed = Speed / (flMaxMovementSpeed * 0.520);
	local flDuckingSpeed = Speed / (flMaxMovementSpeed * 0.340);

	flRunningSpeed = clamp(flRunningSpeed, 0, 1);

	local flYawModifier = (((Animstate.m_flStopToFullRunningFraction * -0.3) - 0.2) * flRunningSpeed) + 1.0;

	if (m_flDuckAmount > 0) then
		local flDuckingSpeed = clamp(flDuckingSpeed, 0, 1);
		flYawModifier = flYawModifier + ((m_flDuckAmount * flDuckingSpeed) * (0.5 - flYawModifier));
	end

	-- lol, just rofl
	local m_flMinBodyYaw = ffi.cast("float*", ffi.cast("int*", Player:get_address() + AnimstateOffset)[0] + 0x330)[0];
	local m_flMaxBodyYaw = ffi.cast("float*", ffi.cast("int*", Player:get_address() + AnimstateOffset)[0] + 0x334)[0];

	local flMinBodyYaw = m_flMinBodyYaw * flYawModifier;
	local flMaxBodyYaw = m_flMaxBodyYaw * flYawModifier;

	local flEyeYaw = Animstate.m_flEyeYaw;
	local flEyeDiff = NormalizeYaw(flEyeYaw - Animstate.m_flGoalFeetYaw);

	local m_flFakeGoalFeetYaw = Animstate.m_flGoalFeetYaw;

	if (flEyeDiff <= flMaxBodyYaw) then
		if (flMinBodyYaw > flEyeDiff) then
			m_flFakeGoalFeetYaw = math.abs(flMinBodyYaw) + flEyeYaw;
		end
	else
		m_flFakeGoalFeetYaw = flEyeYaw - math.abs(flMaxBodyYaw);
	end

	m_flFakeGoalFeetYaw = NormalizeYaw(m_flFakeGoalFeetYaw);

	if (Speed > 0 or vVelocity.z > 100) then
		m_flFakeGoalFeetYaw = ApproachAngle(
			flEyeYaw, 
			m_flFakeGoalFeetYaw,
			((Animstate.m_flStopToFullRunningFraction * 20) + 30) * m_flChokedTime
		);
	else
		m_flFakeGoalFeetYaw = ApproachAngle(
			Player:get_prop_float(m_flLowerBodyYawTarget),
			m_flFakeGoalFeetYaw,
			m_flChokedTime * 100
		)
	end

--	client.notify(tostring(m_flFakeGoalFeetYaw + flMinBodyYaw) .. " " .. tostring(m_flFakeGoalFeetYaw + flMaxBodyYaw) .. " " .. tostring(m_flFakeGoalFeetYaw))
	local FinalPoints = 
	{
		flEyeYaw + flMinBodyYaw,
		flEyeYaw + flMaxBodyYaw,
		m_flFakeGoalFeetYaw,
		Player:get_prop_float(m_flLowerBodyYawTarget)
	};

	return FinalPoints;
end

-- Libraries
-- Timers lib https://nixware.cc/threads/7591/
local function get_time()
    return math.floor(globalvars.get_current_time() * 1000)
end

Timer = {}
Timer.timers = {}

local function add_timer(is_interval, callback, ms)
    table.insert(Timer.timers, {
        time = get_time() + ms,
        ms = ms,
        is_interval = is_interval,
        callback = callback
    })

    return #Timer.timers
end

Timer.new_timeout = function (callback, ms)
    local index = add_timer(false, callback, ms)

    return index
end

Timer.new_interval = function(callback, ms)
    local index = add_timer(true, callback, ms)

    return index
end

Timer.listener = function()
    for i = 1, #Timer.timers do
        local timer = Timer.timers[i]
        local current_time = get_time()

        if current_time >= timer.time then
            timer.callback()

            if timer.is_interval then
                timer.time = get_time() + timer.ms
            else
                table.remove(Timer.timers, i)
            end
        end
    end
end

Timer.remove = function(index)
    table.remove(Timer.timers, index)
end

-- MoveType_t
MOVETYPE_NONE = 0; -- Freezes the entity, outside sources can't move it. 
MOVETYPE_ISOMETRIC = 1; -- For players in TF2 commander view etc. Do not use this for normal players! 
MOVETYPE_WALK = 2; -- Default player (client) move type. 
MOVETYPE_STEP = 3; -- NPC movement 
MOVETYPE_FLY = 4; -- Fly with no gravity. 
MOVETYPE_FLYGRAVITY = 5; -- Fly with gravity. 
MOVETYPE_VPHYSICS = 6; -- Physics movetype (prop models etc.) 
MOVETYPE_PUSH = 7; -- No clip to world, but pushes and crushes things.
MOVETYPE_NOCLIP = 8; -- Noclip, behaves exactly the same as console command.
MOVETYPE_LADDER = 9; -- For players, when moving on a ladder. 
MOVETYPE_OBSERVER = 10; -- Spectator movetype. DO NOT use this to make player spectate. 
MOVETYPE_CUSTOM = 11; -- Custom movetype, can be applied to the player to prevent the default movement code from running, while still calling the related hooks
MOVETYPE_LAST = MOVETYPE_CUSTOM;
MOVETYPE_MAX_BITS = 4;

-- Buttons
IN_ATTACK   = 1;       --  (1 << 0)  -- Fire weapon
IN_JUMP 	= 2;       --  (1 << 1)  -- Jump
IN_DUCK     = 4;       --  (1 << 2)  -- Crouch
IN_FORWARD  = 8;       --  (1 << 3)  -- Walk forward
IN_BACK     = 16;      --  (1 << 4)  -- Walk backwards
IN_USE      = 32;      --  (1 << 5)  -- Use (Defuse bomb, etc...)
IN_CANCEL   = 64;      --  (1 << 6)
IN_LEFT     = 128;     --  (1 << 7)  -- Walk left
IN_RIGHT    = 256;     --  (1 << 8)  -- Walk right
IN_MOVELEFT = 512;     --  (1 << 9)
IN_MOVERIGHT= 1024;    --  (1 << 10)
IN_ATTACK2  = 2048;    --  (1 << 11) -- Secondary fire (Revolver, Glock change fire mode, Famas change fire mode), zoom
IN_RUN      = 4096;    --  (1 << 12)
IN_RELOAD   = 8192;    --  (1 << 13) -- Reload weapon
IN_ALT1     = 16384;   --  (1 << 14)
IN_ALT2     = 32768;   --  (1 << 15)
IN_SCORE    = 65536;   --  (1 << 16) -- Used by client.dll for when scoreboard is held down
IN_SPEED    = 131072;  --  (1 << 17) -- Player is holding the speed key
IN_WALK     = 262144;  --  (1 << 18) -- Player holding walk key
IN_ZOOM     = 524288;  --  (1 << 19) -- Zoom key for HUD zoom
IN_WEAPON1  = 1048576; --  (1 << 20) -- weapon defines these bits
IN_WEAPON2  = 2097152; --  (1 << 21) -- weapon defines these bits
IN_BULLRUSH = 4194304; --  (1 << 22)
IN_GRENADE1 = 8388608; --  (1 << 23) -- grenade 1
IN_GRENADE2 = 16777216;--  (1 << 24) -- grenade 2
IN_ATTACK3  = 33554432;--  (1 << 25)

-- EntityFlags
FL_ONGROUND  = 1;  -- (1 << 0), At rest / on the ground
FL_DUCKING   = 2;  -- (1 << 1), Player flag -- Player is fully crouched
FL_ANIMDUCKING=4;  -- (1 << 2), Player flag -- Player is in the process of crouching or uncrouching but could be in transition
--		                                       Fully ducked:  FL_DUCKING &  FL_ANIMDUCKING
--           Previously fully ducked, unducking in progress:  FL_DUCKING & !FL_ANIMDUCKING
--                                           Fully unducked: !FL_DUCKING & !FL_ANIMDUCKING
--           Previously fully unducked, ducking in progress: !FL_DUCKING &  FL_ANIMDUCKING
FL_WATERJUMP = 8;  -- (1 << 3), Player jumping out of water
FL_ONTRAIN   = 16; -- (1 << 4), Player is _controlling_ a train, so movement commands should be ignored on client during prediction.
FL_INRAIN	   = 32; -- (1 << 5), Indicates the entity is standing in rain
FL_FROZEN    = 64; -- (1 << 6), Player is frozen for 3rd person camera
FL_ATCONTROLS= 128;-- (1 << 7), Player can't move, but keeps key inputs for controlling another entity
FL_CLIENT	   = 256;-- (1 << 8), Is a player
FL_FAKECLIENT= 512;-- (1 << 9), Fake client, simulated server side; don't send network messages to them
-- NON-PLAYER SPECIFIC (i.e., not used by GameMovement or the client .dll ) -- Can still be applied to players, though
FL_INWATER = 1024; -- (1 << 10), // In water

-- ClientFrameStage_t
FRAME_UNDEFINED = -1;						-- Haven't run any frames yet
FRAME_START = 0;
FRAME_NET_UPDATE_START = 1;					-- A network packet is being recieved
FRAME_NET_UPDATE_POSTDATAUPDATE_START = 2;  -- Data has been received and we're going to start calling PostDataUpdate
FRAME_NET_UPDATE_POSTDATAUPDATE_END = 3;	-- Data has been received and we've called PostDataUpdate on all data recipients
FRAME_NET_UPDATE_END = 4;					-- We've received all packets, we can now do interpolation, prediction, etc..
FRAME_RENDER_START = 5;						-- We're about to start rendering the scene
FRAME_RENDER_END = 6;						-- We've finished rendering the scene.
	
-- ItemDefinitionIndex
WEAPON_NONE = 0;
WEAPON_DEAGLE = 1;
WEAPON_ELITE = 2;
WEAPON_FIVESEVEN = 3;
WEAPON_GLOCK = 4;
WEAPON_AK47 = 7;
WEAPON_AUG = 8;
WEAPON_AWP = 9;
WEAPON_FAMAS = 10;
WEAPON_G3SG1 = 11;
WEAPON_GALILAR = 13;
WEAPON_M249 = 14;
WEAPON_M4A1 = 16;
WEAPON_MAC10 = 17;
WEAPON_P90 = 19;
WEAPON_MP5SD = 23;
WEAPON_UMP45 = 24;
WEAPON_XM1014 = 25;
WEAPON_BIZON = 26;
WEAPON_MAG7 = 27;
WEAPON_NEGEV = 28;
WEAPON_SAWEDOFF = 29;
WEAPON_TEC9 = 30;
WEAPON_TASER = 31;
WEAPON_HKP2000 = 32;
WEAPON_MP7 = 33;
WEAPON_MP9 = 34;
WEAPON_NOVA = 35;
WEAPON_P250 = 36;
WEAPON_SHIELD = 37;
WEAPON_SCAR20 = 38;
WEAPON_SG556 = 39;
WEAPON_SSG08 = 40;
WEAPON_KNIFEGG = 41;
WEAPON_KNIFE = 42;
WEAPON_FLASHBANG = 43;
WEAPON_HEGRENADE = 44;
WEAPON_SMOKEGRENADE = 45;
WEAPON_MOLOTOV = 46;
WEAPON_DECOY = 47;
WEAPON_INCGRENADE = 48;
WEAPON_C4 = 49;
WEAPON_HEALTHSHOT = 57;
WEAPON_KNIFE_T = 59;
WEAPON_M4A1_SILENCER = 60;
WEAPON_USP_SILENCER = 61;
WEAPON_CZ75A = 63;
WEAPON_REVOLVER = 262208; -- 64
WEAPON_TAGRENADE = 68;
WEAPON_FISTS = 69;
WEAPON_BREACHCHARGE = 70;
WEAPON_TABLET = 72;
WEAPON_MELEE = 74;
WEAPON_AXE = 75;
WEAPON_HAMMER = 76;
WEAPON_SPANNER = 78;
WEAPON_KNIFE_GHOST = 80;
WEAPON_FIREBOMB = 81;
WEAPON_DIVERSION = 82;
WEAPON_FRAG_GRENADE = 83;
WEAPON_SNOWBALL = 84;
WEAPON_BUMPMINE = 85;
WEAPON_BAYONET = 500;
WEAPON_KNIFE_TACTICAL = 509;
WEAPON_KNIFE_SURVIVAL_BOWIE = 514;
WEAPON_KNIFE_PUSH = 516;
WEAPON_KNIFE_GYPSY_JACKKNIFE = 520;
WEAPON_KNIFE_WIDOWMAKER = 523;
WEAPON_KNIFE_BAYONET = 590324;
WEAPON_KNIFE_FLIP = 590329;
WEAPON_KNIFE_GUT = 590330;
WEAPON_KNIFE_KARAMBIT = 590331;
WEAPON_KNIFE_M9_BAYONET = 590332;
WEAPON_KNIFE_HUNTSMAN = 590333;
WEAPON_KNIFE_FALCHION = 590336;
WEAPON_KNIFE_BOWIE = 590338;
WEAPON_KNIFE_BUTTERFLY = 590339;
WEAPON_KNIFE_SHADOW_DAGGERS = 590340;
WEAPON_KNIFE_URSUS = 590343;
WEAPON_KNIFE_NAVAJA = 590344;
WEAPON_KNIFE_STILETTO = 590346;
WEAPON_KNIFE_TALON = 590347;
WEAPON_KNIFE_CSS = 590327;
WEAPON_KNIFE_CORD = 590341;
WEAPON_KNIFE_CANIS = 590342;
WEAPON_KNIFE_OUTDOOR = 590345;
WEAPON_KNIFE_SKELETON = 590349;

-- Hitboxes
HITBOX_HEAD = 0;
HITBOX_NECK = 1;
HITBOX_PELVIS = 2;
HITBOX_STOMACH = 3;
HITBOX_THORAX = 4;
HITBOX_CHEST = 5;
HITBOX_UPPER_CHEST = 6;
HITBOX_RIGHT_THIGH = 7;
HITBOX_LEFT_THIGH = 8;
HITBOX_RIGHT_CALF = 9;
HITBOX_LEFT_CALF = 10;
HITBOX_RIGHT_FOOT = 11;
HITBOX_LEFT_FOOT = 12;
HITBOX_RIGHT_HAND = 13;
HITBOX_LEFT_HAND = 14;
HITBOX_RIGHT_UPPER_ARM = 15;
HITBOX_RIGHT_FOREARM = 16;
HITBOX_LEFT_UPPER_ARM = 17;
HITBOX_LEFT_FOREARM = 18;
HITBOX_MAX = 19;

-- Bspflags
CONTENTS_EMPTY = 0; -- No contents
CONTENTS_SOLID = 0x1; -- an eye is never valid in a solid
CONTENTS_WINDOW = 0x2; -- translucent, but not watery (glass)
CONTENTS_AUX = 0x4;
CONTENTS_GRATE = 0x8; -- alpha-tested "grate" textures.  Bullets/sight pass through, but solids
CONTENTS_SLIME = 0x10;
CONTENTS_WATER = 0x20;
CONTENTS_BLOCKLOS = 0x40; -- block AI line of sight
CONTENTS_OPAQUE = 0x80;
LAST_VISIBLE_CONTENTS = 0x80 -- things that cannot be seen through (may be non-solid though)

ALL_VISIBLE_CONTENTS = bit32.band(LAST_VISIBLE_CONTENTS, (LAST_VISIBLE_CONTENTS-1));
CONTENTS_TESTFOGVOLUME = 0x100;
CONTENTS_UNUSED = 0x200;

-- unused
-- NOTE: If it's visible, grab from the top + update LAST_VISIBLE_CONTENTS
-- if not visible, then grab from the bottom.
CONTENTS_UNUSED6 = 0x400;
CONTENTS_TEAM1 = 0x800;
CONTENTS_TEAM2 = 0x1000;

-- ignore CONTENTS_OPAQUE on surfaces that have SURF_NODRAW
CONTENTS_IGNORE_NODRAW_OPAQUE = 0x2000

-- hits entities which are MOVETYPE_PUSH (doors, plats, etc.)
CONTENTS_MOVEABLE = 0x4000;

-- remaining contents are non-visible, and don't eat brushes
CONTENTS_AREAPORTAL = 0x8000;

CONTENTS_PLAYERCLIP = 0x10000;
CONTENTS_MONSTERCLIP = 0x20000;

-- currents can be added to any other contents, and may be mixed
CONTENTS_CURRENT_0 = 0x40000;
CONTENTS_CURRENT_90 = 0x80000;
CONTENTS_CURRENT_180 = 0x100000;
CONTENTS_CURRENT_270 = 0x200000;
CONTENTS_CURRENT_UP = 0x400000;
CONTENTS_CURRENT_DOWN = 0x800000;

CONTENTS_ORIGIN = 0x1000000 -- removed before bsping an entity

CONTENTS_MONSTER = 0x2000000 -- should never be on a brush, only in game
CONTENTS_DEBRIS =  0x4000000;
CONTENTS_DETAIL = 0x8000000; -- brushes to be added after vis leafs
CONTENTS_TRANSLUCENT = 0x10000000; -- auto set if any surface has trans
CONTENTS_LADDER = 0x20000000;
CONTENTS_HITBOX = 0x40000000; -- use accurate hitboxes on trace


-- NOTE: These are stored in a short in the engine now.  Don't use more than 16 bits
SURF_LIGHT = 0x0001; -- value will hold the light strength
SURF_SKY2D = 0x0002; -- don't draw, indicates we should skylight + draw 2d sky but not draw the 3D skybox
SURF_SKY = 0x0004; -- don't draw, but add to skybox
SURF_WARP = 0x0008; -- turbulent water warp
SURF_TRANS = 0x0010;
SURF_NOPORTAL = 0x0020; -- the surface can not have a portal placed on it
SURF_TRIGGER = 0x0040; -- FIXME: This is an xbox hack to work around elimination of trigger surfaces, which breaks occluders
SURF_NODRAW = 0x0080; -- don't bother referencing the texture

SURF_HINT = 0x0100; -- make a primary bsp splitter

SURF_SKIP = 0x0200; -- completely ignore, allowing non-closed brushes
SURF_NOLIGHT = 0x0400; -- Don't calculate light
SURF_BUMPLIGHT = 0x0800; -- calculate three lightmaps for the surface for bumpmapping
SURF_NOSHADOWS = 0x1000; -- Don't receive shadows
SURF_NODECALS = 0x2000; -- Don't receive decals
SURF_NOCHOP = 0x4000; -- Don't subdivide patches on this surface 
SURF_HITBOX = 0x8000; -- surface is part of a hitbox

-------------------------------------------------------
-- spatial content masks - used for spatial queries (traceline,etc.)
-------------------------------------------------------
MASK_ALL = (0xFFFFFFFF);
-- everything that is normally solid
MASK_SOLID = bit32.bor(CONTENTS_SOLID,  bit32.bor(CONTENTS_MOVEABLE,  bit32.bor(CONTENTS_WINDOW,  bit32.bor(CONTENTS_MONSTER, CONTENTS_GRATE))));
-- everything that blocks player movement
MASK_PLAYERSOLID = bit32.bor(CONTENTS_SOLID, bit32.bor(CONTENTS_MOVEABLE, bit32.bor(CONTENTS_PLAYERCLIP, bit32.bor(CONTENTS_WINDOW, bit32.bor(CONTENTS_MONSTER,CONTENTS_GRATE)))));
-- blocks npc movement
MASK_NPCSOLID = bit32.bor(CONTENTS_SOLID, bit32.bor(CONTENTS_MOVEABLE, bit32.bor(CONTENTS_MONSTERCLIP, bit32.bor(CONTENTS_WINDOW, bit32.bor(CONTENTS_MONSTER, CONTENTS_GRATE)))));
-- water physics in these contents
MASK_WATER = bit32.bor(CONTENTS_WATER, bit32.bor(CONTENTS_MOVEABLE, CONTENTS_SLIME));
-- everything that blocks lighting
MASK_OPAQUE = bit32.bor(CONTENTS_SOLID, bit32.bor(CONTENTS_MOVEABLE, CONTENTS_OPAQUE));
-- everything that blocks lighting, but with monsters added.
MASK_OPAQUE_AND_NPCS = bit32.bor(MASK_OPAQUE, CONTENTS_MONSTER);
-- everything that blocks line of sight for AI
MASK_BLOCKLOS = bit32.bor(CONTENTS_SOLID, bit32.bor(CONTENTS_MOVEABLE, CONTENTS_BLOCKLOS));
-- everything that blocks line of sight for AI plus NPCs
MASK_BLOCKLOS_AND_NPCS = bit32.bor(MASK_BLOCKLOS, CONTENTS_MONSTER);
-- everything that blocks line of sight for players
MASK_VISIBLE = bit32.bor(MASK_OPAQUE, CONTENTS_IGNORE_NODRAW_OPAQUE);
-- everything that blocks line of sight for players, but with monsters added.
MASK_VISIBLE_AND_NPCS = bit32.bor(MASK_OPAQUE_AND_NPCS, CONTENTS_IGNORE_NODRAW_OPAQUE);
-- bullets see these as solid
MASK_SHOT = bit32.bor(CONTENTS_SOLID, bit32.bor(CONTENTS_MOVEABLE, bit32.bor(CONTENTS_MONSTER, bit32.bor(CONTENTS_WINDOW, bit32.bor(CONTENTS_DEBRIS, CONTENTS_HITBOX)))));
-- non-raycasted weapons see this as solid (includes grates)
MASK_SHOT_HULL = bit32.bor(CONTENTS_SOLID, bit32.bor(CONTENTS_MOVEABLE, bit32.bor(CONTENTS_MONSTER, bit32.bor(CONTENTS_WINDOW, bit32.bor(CONTENTS_DEBRIS, CONTENTS_GRATE)))));
-- hits solids (not grates) and passes through everything else
MASK_SHOT_PORTAL = bit32.bor(CONTENTS_SOLID,  bit32.bor(CONTENTS_MOVEABLE, bit32.bor(CONTENTS_WINDOW,CONTENTS_MONSTER)));
-- everything normally solid, except monsters (world+brush only)
MASK_SOLID_BRUSHONLY = bit32.bor(CONTENTS_SOLID, bit32.bor(CONTENTS_MOVEABLE, bit32.bor(CONTENTS_WINDOW, CONTENTS_GRATE)));
-- everything normally solid for player movement, except monsters (world+brush only)
MASK_PLAYERSOLID_BRUSHONLY = bit32.bor(CONTENTS_SOLID, bit32.bor(CONTENTS_MOVEABLE, bit32.bor(CONTENTS_WINDOW, bit32.bor(CONTENTS_PLAYERCLIP, CONTENTS_GRATE))));
-- everything normally solid for npc movement, except monsters (world+brush only)
MASK_NPCSOLID_BRUSHONLY = bit32.bor(CONTENTS_SOLID, bit32.bor(CONTENTS_MOVEABLE, bit32.bor(CONTENTS_WINDOW, bit32.bor(CONTENTS_MONSTERCLIP, CONTENTS_GRATE))));
-- just the world, used for route rebuilding
MASK_NPCWORLDSTATIC = bit32.bor(CONTENTS_SOLID, bit32.bor(CONTENTS_WINDOW, bit32.bor(CONTENTS_MONSTERCLIP, CONTENTS_GRATE)));
-- These are things that can split areaportals
MASK_SPLITAREAPORTAL = bit32.bor(CONTENTS_WATER, CONTENTS_SLIME);

-- UNDONE: This is untested, any moving water
MASK_CURRENT = bit32.bor(CONTENTS_CURRENT_0, bit32.bor(CONTENTS_CURRENT_90, bit32.bor(CONTENTS_CURRENT_180, bit32.bor(CONTENTS_CURRENT_270, bit32.bor(CONTENTS_CURRENT_UP, CONTENTS_CURRENT_DOWN)))));

-- everything that blocks corpse movement
-- UNDONE: Not used yet / may be deleted
MASK_DEADSOLID = bit32.bor(CONTENTS_SOLID, bit32.bor(CONTENTS_PLAYERCLIP, bit32.bor(CONTENTS_WINDOW, CONTENTS_GRATE)));
------------------------------------------------------------------------------------------------------------------------------------------

--require "vanted_API_private" 
--require "AdvancedAPI" 

--预设定义

local DEFINE_FREEVER = false; --免费版本

--提醒
client.notify("loading...");

--定义字典
local local_dic_1 = {[1]="a",[2]="b",[3]="c",[4]="d",[5]="e",[6]="f",[7]="g",[8]="h",[9]="i",[10]="j",[11]="k",[12]="l",[13]="m",[14]="n",[15]="o",[16]="p",[17]="q",[18]="r",[19]="s",[20]="t",[21]="u",[22]="v",[23]="w",[24]="x",[25]="y",[26]="z"}
local local_dic_2 = {[1]="A",[2]="B",[3]="C",[4]="D",[5]="E",[6]="F",[7]="G",[8]="H",[9]="I",[10]="J",[11]="K",[12]="L",[13]="M",[14]="N",[15]="O",[16]="P",[17]="Q",[18]="R",[19]="S",[20]="T",[21]="U",[22]="V",[23]="W",[24]="X",[25]="Y",[26]="Z"}
local local_dic_3 = {[1]=",",[2]=".",[3]="?",[4]="!",[5]="+",[6]="-",[7]="*",[8]="/",[9]="_",[10]="=",[11]="`",[12]="~",[13]=" ",[14]="#",[15]="@",[16]="^",[17]="&",[18]=":",[19]="[",[20]="]"}
local local_dic_4 = {[1]="1",[2]="2",[3]="3",[4]="4",[5]="5",[6]="6",[7]="7",[8]="8",[9]="9",[10]="0"}
local VF_DIC_VT = local_dic_2[22] .. local_dic_2[1] .. local_dic_2[14] .. local_dic_2[20] .. local_dic_2[5] .. local_dic_2[4]

--定义常量
VF_PREFIX		=	"[ANTI-AIM]";
LUA_VERSION     =   "v4.1.5";    --版本号
LUA_VERNAME		=	"rebuild";
LUA_NAME		=	"vanted anti-aim"; --改这个是小狗
LUA_UPDATE		= 	"200912";
VF_USERLENTH    =   0;       --用户列表长度
VF_FULLVER		=	LUA_VERSION .. "." .. LUA_UPDATE .. "." .. VF_USERLENTH .. " " .. LUA_VERNAME;
VF_CCSHARE		=	"CC BY-NC 4.0";
VF_VERINFO		=	"version: " .. VF_FULLVER .. "   name: " ..  LUA_NAME .. "   api : advanced api 1.5  " .. VF_CCSHARE;

IF_REBUILDER	= "none"; --修改版本的lua在这里标注你自己的名字

ui.set_float("vanted_fake_angle_version", 4.0);

--注册事件
se.register_event("player_hurt");
se.register_event("round_start");
se.register_event("round_freeze_end");

--定义数据库
local VF_USERNAME_SQL = --用户名
{};

local VF_GROUP_SET = 
{
	["Banned"] 		= -1,
	["Default"]  	=  0,
	["Premium"]  	=  1,
	["Beta"]  		=  2,
	["Developer"]	=  3 
};

local VF_USEGROUP_SQL = --用户组
{
	[1]  	= "Developer",
	[3]  	= "Developer",
	[84] 	= "Beta",
	[45] 	= "Beta",
	[8]		= "Beta",
	[167]	= "Developer"
};

--预加载必要变量
local Screen_Size = engine.get_screen_size();

--定义Key
local KEY_Inverter   = "vanted_fake_angle_key_inverter";
local KEY_Jitter     = "vanted_fake_angle_key_jitter";
local KEY_Override   = "vanted_fake_angle_key_override";
local KEY_Exploit    = "ragebot_active_exploit_bind";
local KEY_Fakeduck   = "antihit_extra_fakeduck_bind";

--定义UI
ui.add_checkbox(    "Enabled"           , "vanted_fake_angle_globle_enable"         , false);
ui.add_combo(       "Extend"            , "vanted_fake_angle_mode_extend"           , {"Disabled","LBY Break: opposite","LBY Break: exploit","LBY Break: exploit opposite","Desync: exploit half","Desync: exploit full"}, 0);
ui.add_combo(       "On Shot"           , "vanted_fake_angle_mode_on_shot"          , {"Disabled","Desync","Fast Recovery","Break Tick"}, 0);
ui.add_combo(       "Disenable Flag"    , "vanted_fake_angle_mode_disenable_flag"   , {"Disabled","Freezing"}, 0);
ui.add_keybind(     "Inverter"          , "vanted_fake_angle_key_inverter"          , ui.get_int("antihit_antiaim_flip_bind_key"), 2);
ui.add_keybind(     "Jitter"            , "vanted_fake_angle_key_jitter"            , 0, 2);
ui.add_slider_float("Offset Yaw"        , "vanted_fake_angle_angle_offset_yaw"      , -180.0, 180.0, 0.0);
ui.add_slider_float("Jitter Range"      , "vanted_fake_angle_angle_jitter_yaw"      , -180.0, 180.0, 0.0);
ui.add_combo(       "Jitter Mode"       , "vanted_fake_angle_mode_jitter"           , {"Default","Motion","Random"}, 0);
ui.add_combo(       "Auto Inverter"     , "vanted_fake_angle_mode_auto_inverter"    , {"Disabled", "On Shot"}, 0);
ui.add_combo(       "Flip Inverter"     , "vanted_fake_angle_mode_flip_inverter"    , {"Disabled","Low Speed","In Air","Always"}, 0);
ui.add_combo(       "Anti-Resolver"     , "vanted_fake_angle_mode_anti_resolver"    , {"Disabled", "Break Yaw","Auto: Overlap"}, 0);
ui.add_slider_int(  "Normal Limit"      , "vanted_fake_angle_choke_normal_limit"    , 1, 16, 1);
ui.add_slider_int(  "Normal Limit Max"  , "vanted_fake_angle_choke_normal_limit_max", 1, 16, 1);
ui.add_combo(       "Fakelag Mode"      , "vanted_fake_angle_mode_fakelag"          , {"Default","Switch","Random"}, 0);
ui.add_slider_int(  "Trigger Limit"     , "vanted_fake_angle_choke_trigger_limit"   , 1, 16, 1);
ui.add_combo(       "Triggers"          , "vanted_fake_angle_mode_trigger"          , {"Disabled", "In Air","On Shot","Standing"}, 0);
ui.add_slider_int(  "Override Limit"    , "vanted_fake_angle_choke_override_limit"  , 1, 16, 1);
ui.add_keybind(     "Override"          , "vanted_fake_angle_key_override"          , 0, 1);
ui.add_combo(       "Indicator"   		, "vanted_fake_angle_mode_indicator"        , {"Disabled", "Triggers"}, 1);
ui.add_combo(       "Scale"             , "vanted_fake_angle_display_scale"         , {"100%", "125%", "150%"}, 0);
ui.add_slider_int(  "Position X"        , "vanted_fake_angle_display_position_x"    , 0, Screen_Size.x, 2);
ui.add_slider_int(  "Position Y"        , "vanted_fake_angle_display_position_y"    , 0, Screen_Size.y, (Screen_Size.y / 2) + 80);
ui.add_combo(       "CMP"               , "vanted_fake_angle_mode_cmp"              , {"Auto", "Force"}, 0);

--定义UI变量
local GlobleEnable          = ui.get_bool(  "vanted_fake_angle_globle_enable"           );
local ModeExtend            = ui.get_int(   "vanted_fake_angle_mode_extend"             );
local ModeOnShot            = ui.get_int(   "vanted_fake_angle_mode_on_shot"            );
local ModeDisenableFlag     = ui.get_int(   "vanted_fake_angle_mode_disenable_flag"     );
local AngleOffsetYaw        = ui.get_float( "vanted_fake_angle_angle_offset_yaw"        );
local AngleJitterYaw        = ui.get_float( "vanted_fake_angle_angle_jitter_yaw"        );
local ModeJitter            = ui.get_int(   "vanted_fake_angle_mode_jitter"             );
local ModeAutoInverter      = ui.get_int(   "vanted_fake_angle_mode_auto_inverter"      );
local ModeFlipInverter      = ui.get_int(   "vanted_fake_angle_mode_flip_inverter"      );
local ModeAntiResolver      = ui.get_int(   "vanted_fake_angle_mode_anti_resolver"      );
local ChokeNormalLimit      = ui.get_int(   "vanted_fake_angle_choke_normal_limit"      );
local ChokeNormalLimitMax   = ui.get_int(   "vanted_fake_angle_choke_normal_limit_max"  );
local ModeFakelag           = ui.get_int(   "vanted_fake_angle_mode_fakelag"            );
local ChokeTriggerLimit     = ui.get_int(   "vanted_fake_angle_choke_trigger_limit"     );
local ModeTrigger           = ui.get_int(   "vanted_fake_angle_mode_trigger"            );
local ChokeOverrideLimit    = ui.get_int(   "vanted_fake_angle_choke_override_limit"    );
local ModeIndicator         = ui.get_int(   "vanted_fake_angle_mode_indicator"          );
local DisplayScale          = ui.get_int(   "vanted_fake_angle_display_scale"           );
local DisplayPositionX      = ui.get_int(   "vanted_fake_angle_display_position_x"      );
local DisplayPositionY      = ui.get_int(   "vanted_fake_angle_display_position_y"      );
local DisplayColorUi        = ui.get_color( "misc_ui_color"                             );
local ModeCmp               = ui.get_int(   "vanted_fake_angle_mode_cmp"                );
local KeyInverter   = 0;
local KeyJitter     = 0;
local KeyOverride   = 0;
local KeyExploit    = 0;
local KeyFakeduck   = 0;
--定义接口
--[[
local CAPI_FAKE_ANGLE_COS_fAngle	= "vanted_fake_angle_capi_fangle";
local CAPI_FAKE_ANGLE_COS_lbyAgnle1	= "vanted_fake_angle_capi_lbyagnle1";
local CAPI_FAKE_ANGLE_COS_lbyAgnle2	= "vanted_fake_angle_capi_lbyagnle2";

ui.set_int("vanted_fake_angle_capi_fangle"		, 58);
ui.set_int("vanted_fake_angle_capi_lbyagnle1"	, 0);
ui.set_int("vanted_fake_angle_capi_lbyagnle2"	, 0);
]]

local api_choke_override = -1;

ui.set_int("vanted_api_fake_angle_choke", -1);

--定义基础变量
g_SYNC_VF_STATE = 0 --验证状态

--定义全局变量
local ClientChoked;
local Local_Player;
local Local_Speed;
local Local_Flags;
local ActiveWeaponHandle;
local iWeapon;

local F_Jitter_Side = 0;
local F_Jitter_Last = 0.0;

local VF_CYTIME_CNT = 0; --循环周期
local VF_CYTIME_AGN = false; --循环标记

local EV_Freez_Time = false; --开局关闭假身

local OS_CNT_AT = 0; --触发射击
local OS_CNT_FL = 0; --射击假卡

local FP_ATFP_ST = false; --射击切换假身
local FP_ATFP_MV = false; --移动切换假身

local FL_SWITCH_STATE = 0; --假卡状态
local FL_SWITCH_LAST  = 0; --记录状态

local fAngle_ATR_cnt = 0; --反解析触发

local CMP_cnt_last = 0; --记录cmp

local DP_APLHA		= 0;
local DP_APSWITCH	= false;
local DP_APRATE		= 5.0;	

local DP_KEYSTATE = 
{
	[0] = "always" ,
	[1] = "holding",
	[2] = "toggled",
	[3] = "disable"
}

local font_msyh = renderer.setup_font("C:/windows/fonts/msyh.ttc", 50, 0)

--前置函数
local function TOINT(n) --转换到整形
    local s = tostring(n);
    local i, j = s:find('%.');
    if i then
        return tonumber(s:sub(1, i-1));
    else
        return n;
    end
end
local function SEND_MSG ( msg ) --向客户端发送消息
    client.notify(tostring(msg));
end
local function CAN_SHOOT ( iWeapon,  Local_Player)  --射击检查
    local PrimaryAttack = iWeapon:get_prop_float(m_flNextPrimaryAttack);
	if (PrimaryAttack > GetCurtime(Local_Player)) then
		return false;
	end
	local WeaponIndex = iWeapon:get_prop_int(m_iItemDefinitionIndex);
	local PostponeFireReadyTime = iWeapon:get_prop_float(m_flPostponeFireReadyTime);
    if (WeaponIndex == WEAPON_REVOLVER and PostponeFireReadyTime > GetCurtime(Local_Player)) then
		return false;
	end
	return true;
end
local function GET_GROUP ( username ) --获取用户组

	if ( username == "get_local" or username == 0 ) then
		username = client.get_username();
	end

	local mark = 0;

	for step = VF_USERLENTH,1,-1 do
		if VF_USERNAME_SQL[step] == username then
			mark = step;
			break;
		end
	end

	local group = VF_USEGROUP_SQL[mark];

	if ( mark == 0 ) then
		return "Default";
	end

	if ( group == nil ) then
		return "Premium";
	else
		return group;
	end

end
local function GETKEYSTATE ( KeyName ) --获取按键状态:str

	return "[ " .. DP_KEYSTATE [ ui.get_int(KeyName .. "_type") ] .. " ] " ;

end
local function IS_PRESSED ( KeyName )   --获取按键状态

	if (KeyName == KEY_Fakeduck) then
		if (not ui.get_bool("antihit_extra_fakeduck")) then
			return false;
		end
	end

	if (KeyName == KEY_Exploit) then
		if (ui.get_int("ragebot_active_exploit") == 0) then
			return false;
		end
	end

    local KeyBind_key   =   ui.get_int(KeyName .. "_key");
    local KeyBind_type  =   ui.get_int(KeyName .. "_type");
	local KeyBind_state =   ui.get_bind_state(KeyName);
	
    if (KeyBind_key == 0 and KeyBind_type ~= 0) or (KeyBind_type == 3) then
        return false;
    end
    if KeyBind_type == 0 then
        return true;
    end
    if (KeyBind_state) then
        return true;
    else
        return false;
    end
end
local function IS_USING ( PLAYER_CMD , iWeapon)  --抬头判读
	if ((hasbit(PLAYER_CMD.buttons, IN_ATTACK) or hasbit(PLAYER_CMD.buttons, IN_ATTACK2)) or not iWeapon:get_prop_bool(m_bPinPulled) and IsNade(iWeapon)) then
		local ThrowTime = iWeapon:get_prop_float(m_fThrowTime);
		if (ThrowTime > 0.1) then 
			return true;
		end
    end
    local MoveType = Local_Player:get_prop_int(m_MoveType);
	if (MoveType == MOVETYPE_LADDER or MoveType == MOVETYPE_NOCLIP) then
		return true;
	end
	if (hasbit(PLAYER_CMD.buttons, IN_USE)) then
		return true;
    end
    if (CAN_SHOOT(iWeapon, Local_Player)) then
        if (IsKnife(iWeapon)) then
            if (hasbit(PLAYER_CMD.buttons, IN_ATTACK)) or (hasbit(PLAYER_CMD.buttons, IN_ATTACK2)) then
                return true;
            end
        end
        local Ammo = iWeapon:get_prop_int(m_iClip1);
		if (Ammo > 0 or Ammo == -1) then 
			if hasbit(PLAYER_CMD.buttons, IN_ATTACK) then
                return true;
            end
		end
    end
    return false;
end
local function IS_INAIR ( Local_Flags ) --空中 
    return not hasbit(Local_Flags, FL_ONGROUND);
end
local function IS_ALIVE (  ) --存活 
	if ( engine.is_connected( ) ) then
		return ( entitylist.get_local_player():get_prop_int(m_iHealth) >= 1 );
	else
		return false;
	end
end
local function DISPLAY_TEXT ( text, size, vec2, font, edge, color, color_edge)

	local x = vec2.x;
	local y = vec2.y;

	if ( edge ) then
		renderer.text(text, font, vec2_t.new(x+1, y+1), size, color_edge);
		renderer.text(text, font, vec2_t.new(x+1, y-1), size, color_edge);
		renderer.text(text, font, vec2_t.new(x-1, y-1), size, color_edge);
		renderer.text(text, font, vec2_t.new(x-1, y+1), size, color_edge);
	end

	renderer.text(text, font, vec2_t.new(x, y), size, color);

end
local function real_alpha( alpha , alpha_limit ) --透明度规范化

	if ( alpha_limit == "max_aplha" ) then
		alpha_limit = 255;
	end

	if ( alpha < 0 ) then
		return 0;
	elseif ( alpha > 255 ) then
		return 255;
	elseif ( alpha <= alpha_limit ) then
		return alpha;
	else
		return alpha_limit;
	end
    
end
--常驻辅助函数
local function VERIFY_USERNAME ( )  --验证用户

	if (g_SYNC_VF_STATE == 0 or VF_CYTIME_AGN == true) then
		
        local LocalPlayer   = client.get_username();
		local group_id		= VF_GROUP_SET[GET_GROUP ( "get_local" )];

		if (group_id >= 0) then
			
			if (VF_CYTIME_AGN==false ) then

				if (IF_REBUILDER ~= "none") then
					SEND_MSG(VF_PREFIX .. ": developer build version [" .. IF_REBUILDER .. "]");
				else
					SEND_MSG(VF_PREFIX .. ": official version");
				end

				if (group_id >= 1) then

					LocalPlayer = LocalPlayer .. " [ " .. GET_GROUP ( "get_local" ) .. " ] ";

					SEND_MSG(VF_PREFIX .. ": welcome, " .. LocalPlayer);

					g_SYNC_VF_STATE = 2;
					
					if ( group_id >= 2) then --beta
		
						ui.add_checkbox	("====- extra -===="	, "vanted_fake_angle_vis1", false);
						ui.add_checkbox	("Beta function"		, "vanted_fake_angle_vis2", false);
						ui.add_combo	("Beta Info"			, "vanted_fake_angle_beta_info", {"Disabled","Basic info"}, 1)
						--beta
						if ( group_id >= 3) then --dev
							ui.add_checkbox	("Developing function"	, "vanted_fake_angle_vis3", false);
							--dev
								--ui.add_combo	("Working in progress"	, "", {"Working in progress"}, 0)
						end

						ui.add_checkbox	("====- extra -===="	, "vanted_fake_angle_vis4", false);

					end
				else

					LocalPlayer = "unknow";

					if (DEFINE_FREEVER) then

						SEND_MSG(VF_PREFIX .. ": warning, unknow user");

						g_SYNC_VF_STATE = 1;
					else

						g_SYNC_VF_STATE = -1;
					
					end

				end

				SEND_MSG(VF_PREFIX .. ": finished");
				
			end

		else
			
			g_SYNC_VF_STATE = -1;
			
			SEND_MSG( VF_PREFIX .. ": failed");

			LocalPlayer = "unknow";

			if ( group_id == -1 ) then
				SEND_MSG(VF_PREFIX .. ": you have been banned from this script");
			end
		end

		if (VF_CYTIME_AGN==false) then

			

			ui.add_combo("Hello! User:" , "", {LocalPlayer}, 0)
			ui.add_combo("Version ", "", {VF_FULLVER,"Created by" .. VF_DIC_VT}, 0);

		end

		VF_CYTIME_AGN = false;
		
	end
	
	if (VF_CYTIME_CNT <= 1024) then
			
		VF_CYTIME_CNT = VF_CYTIME_CNT + 1;
	else
		
		VF_CYTIME_AGN = true;
		VF_CYTIME_CNT = 0;
		
	end

    return;
end
local function REFRESH_GLOBLE_VAR ( )   --刷新全局变量
    
    GlobleEnable        = ui.get_bool(  "vanted_fake_angle_globle_enable"           );
    ModeExtend          = ui.get_int(   "vanted_fake_angle_mode_extend"             );
    ModeOnShot          = ui.get_int(   "vanted_fake_angle_mode_on_shot"            );
    ModeDisenableFlag   = ui.get_int(   "vanted_fake_angle_mode_disenable_flag"     );
    AngleOffsetYaw      = ui.get_float( "vanted_fake_angle_angle_offset_yaw"        );
    AngleJitterYaw		= ui.get_float( "vanted_fake_angle_angle_jitter_yaw"        );
    ModeJitter			= ui.get_int(   "vanted_fake_angle_mode_jitter"             );
    ModeAutoInverter	= ui.get_int(   "vanted_fake_angle_mode_auto_inverter"      );
    ModeFlipInverter	= ui.get_int(   "vanted_fake_angle_mode_flip_inverter"      );
    ModeAntiResolver	= ui.get_int(   "vanted_fake_angle_mode_anti_resolver"      );
    ChokeNormalLimit	= ui.get_int(   "vanted_fake_angle_choke_normal_limit"      );
    ChokeNormalLimitMax	= ui.get_int(   "vanted_fake_angle_choke_normal_limit_max"  );
    ModeFakelag			= ui.get_int(   "vanted_fake_angle_mode_fakelag"            );
    ChokeTriggerLimit	= ui.get_int(   "vanted_fake_angle_choke_trigger_limit"     );
    ModeTrigger			= ui.get_int(   "vanted_fake_angle_mode_trigger"            );
    ChokeOverrideLimit	= ui.get_int(   "vanted_fake_angle_choke_override_limit"    );
    ModeIndicator		= ui.get_int(   "vanted_fake_angle_mode_indicator"          );
    DisplayScale		= ui.get_int(   "vanted_fake_angle_display_scale"           );
    DisplayPositionX	= ui.get_int(   "vanted_fake_angle_display_position_x"      );
    DisplayPositionY	= ui.get_int(   "vanted_fake_angle_display_position_y"      );
	DisplayColorUi		= ui.get_color( "misc_ui_color"                             );
    ModeCmp				= ui.get_int(   "vanted_fake_angle_mode_cmp"                );

	--api

	api_choke_override = ui.get_int("vanted_api_fake_angle_choke");

	ui.set_bool("vanted_api_fake_angle_enable", true);

	--

	if ( VF_GROUP_SET[GET_GROUP ( "get_local" )] >= 2 ) then
		ui.set_bool("vanted_fake_angle_vis1", false);
		ui.set_bool("vanted_fake_angle_vis2", false);
		ui.set_bool("vanted_fake_angle_vis3", false);
		ui.set_bool("vanted_fake_angle_vis4", false);
	end

    if (g_SYNC_VF_STATE == -1) then
        if (GlobleEnable == true) then
            VF_CYTIME_AGN = true;
        end
		ui.set_bool("vanted_fake_angle_globle_enable", false);
		return;
    end

	if (g_SYNC_VF_STATE == 1) then

		local msg = false;

		if (ModeExtend >= 2) then

			ui.set_int("vanted_fake_angle_mode_extend", 0);
			ModeExtend = 0;
			msg = true;

		end

		if (ModeOnShot >= 1) then

			ui.set_int("vanted_fake_angle_mode_on_shot", 0);
			ModeOnShot = 0;
			msg = true;

		end

		if (ModeTrigger >= 2) then

			ui.set_int("vanted_fake_angle_mode_trigger", 0);
			ModeTrigger = 0;
			msg = true;

		end

		if (ModeAntiResolver >= 1) then

			ui.set_int("vanted_fake_angle_mode_anti_resolver", 0);
			ModeAntiResolver = 0;
			msg = true;

		end

		if (msg == true) then
			SEND_MSG(VF_PREFIX .. ": you don't have permission to do this" );
		end

	end

	if (GlobleEnable == true) then

		if (ModeDisenableFlag == 1) then
			ui.set_bool("antihit_fakelag_disable_stand", 1);
		else
			ui.set_bool("antihit_fakelag_disable_stand", false);
		end

		if (ModeFakelag == 0) then
			ui.set_int("vanted_fake_angle_choke_normal_limit_max", 1)
		elseif (ModeFakelag > 0) then
			if (ChokeNormalLimitMax < ChokeNormalLimit) then
				ui.set_int("vanted_fake_angle_choke_normal_limit_max", ChokeNormalLimit)
			end
		end

		ui.set_int("antihit_fakelag_enable", 0);
		ui.set_int("antihit_antiaim_pitch",0);
		ui.set_int("antihit_antiaim_yaw",0);
		ui.set_int("antihit_antiaim_flip_bind_key",ui.get_int(KEY_Inverter .. "_key"));
		ui.set_int("vanted_fake_angle_key_inverter_type",2)
		ui.set_bool("antihit_antiaim_at_targets",false);

		if (not engine.is_connected()) then
			ui.set_int("antihit_antiaim_enable", 0);
			ui.set_bool("antihit_fakelag_disable_stand", false);
		end

		--cmp

		if (ModeCmp == 1) then
			ui.set_int("ragebot_active_exploit",0);
			ui.set_int("ragebot_active_exploit_bind_type",3);
		end

		if (CMP_cnt_last ~= ModeCmp) then
			if (ModeCmp == 0) then
				SEND_MSG(VF_PREFIX .. ": CMP Auto");
			elseif (ModeCmp == 1) then
				SEND_MSG(VF_PREFIX .. ": CMP Force");
			end
		end

		CMP_cnt_last = ModeCmp;

		--

	end

    return;
end
local function ON_SHOT ( INFO ) --射击触发

    if (not GlobleEnable) then return end

	--if ( INFO.manual == true) then return end
 
    if (ModeOnShot >= 1) then 
        OS_CNT_AT = 1;
    end
    if (ModeTrigger == 2) then 
        OS_CNT_FL = 1;
    end
    if (ModeAutoInverter == 1) then
        FP_ATFP_ST = not FP_ATFP_ST;
	end
	if (ModeAntiResolver == 2) then
		fAngle_ATR_cnt = 1;
	end
    return;
end
local function ON_HARMED ( player_event ) --事件触发

    if not GlobleEnable then return end

    local EV_NAME = player_event:get_name();
    if (EV_NAME == "player_hurt") then --玩家受伤时
        local me = engine.get_local_player();
        local attacker = engine.get_player_for_user_id(player_event:get_int("attacker", 0));
        local victim_index = engine.get_player_for_user_id(player_event:get_int("userid", 0));
        local damage = player_event:get_int("dmg_health", 0);
        if (me ~= attacker and me == victim_index) then 
			if (ModeAntiResolver == 2) then
				fAngle_ATR_cnt = 1;
			end
        end
	end
	return;
end
local function ON_FREEZ ( player_event ) --冷却
	--if (ModeDisenableFlag == 1) then
        local EV_NAME = player_event:get_name();
        if EV_NAME == "round_start" then
            EV_Freez_Time = true;
        elseif EV_NAME == "round_freeze_end" then 
            EV_Freez_Time = false;
        end
    --end
    return;
end
local function ON_UNLOAD ( ) --卸载

	ui.set_int("antihit_antiaim_enable", 0)

	--api

	ui.set_bool("vanted_api_fake_angle_enable", false);

	--

	SEND_MSG(VF_PREFIX .. ": script unloaded");
	
end
--常驻主函数
local function WATERMARK ( ) --水印

	if ( not GlobleEnable ) then return end

	if ( ui.get_int("vanted_fake_angle_beta_info") and g_SYNC_VF_STATE <= 0)then return end

	if ( g_SYNC_VF_STATE == 1 and (ModeIndicator ~= 1 or engine.is_connected())) then return end

	local group = GET_GROUP ( "get_local" );

	if (g_SYNC_VF_STATE <= 1) then
		group = "unknow";
	end

	DISPLAY_TEXT( (VF_VERINFO .. "   group: " .. group), 15, vec2_t.new((Screen_Size.x / 2) - 270, Screen_Size.y - 20), font_msyh, true, color_t.new(255, 255, 255, 255),color_t.new(0, 0, 0, 255));

end
local function DISPLAY ( ) --指示器

	if ( not GlobleEnable ) then return end

	if ( ModeIndicator == 1 ) then

		if ( DP_APSWITCH == false) then --	切换透明度
			DP_APLHA = real_alpha ( DP_APLHA + DP_APRATE , "max_aplha" );
		elseif ( DP_APSWITCH == true ) then
			DP_APLHA = real_alpha ( DP_APLHA - DP_APRATE , "max_aplha" );
		end	

		local x = DisplayPositionX;
		local y = DisplayPositionY;

		local color_font = color_t.new ( 255, 255, 255, real_alpha ( DP_APLHA , "max_aplha" ) )
		local color_edge = color_t.new (   0,   0,   0, real_alpha ( DP_APLHA , "max_aplha" ) )
	
		local scale		= 0.00;
		local size		= 0,00;
		local added		= 0.00;
	
		if ( DisplayScale == 0 ) then
			scale	 = 1.00;
			size	 = 18;
		elseif ( DisplayScale == 1 ) then
			scale	 = 1.25;
			size	 = 22;
		elseif ( DisplayScale == 2 ) then
			scale	 = 1.50;
			size	 = 27;
		end
	
		KeyInverter   = IS_PRESSED(KEY_Inverter);
		KeyJitter     = IS_PRESSED(KEY_Jitter);
		KeyOverride   = IS_PRESSED(KEY_Override);
		KeyExploit    = IS_PRESSED(KEY_Exploit);
		KeyFakeduck   = IS_PRESSED(KEY_Fakeduck);

		if ( not engine.is_connected ( ) and not ui.is_visible( ) ) then
			DP_APSWITCH = true;
		else
			DP_APSWITCH = false;
		end

		renderer.rect_filled(vec2_t.new(x, y), vec2_t.new(x + ( 200 * scale ), y + ( 20 * scale )), color_t.new (0, 0, 0, real_alpha ( DP_APLHA , 180 ) ) )	
		renderer.rect_filled(vec2_t.new(x, y-scale), vec2_t.new(x + ( 200 * scale ), y), color_t.new ( DisplayColorUi.r , DisplayColorUi.g , DisplayColorUi.b , real_alpha ( DP_APLHA , "max_aplha" ) ) )
		DISPLAY_TEXT( "Triggers", size, vec2_t.new(( ( x + 70 ) * scale ) , y - scale), font_msyh, true, color_font, color_edge);
		
		if ( IS_ALIVE( ) ) then

			added = 20 * scale;

			if ( KeyExploit == true ) then
				
				renderer.rect_filled(vec2_t.new(x, y + added), vec2_t.new(x + ( 200 * scale), y + ( 20 * scale ) + added) , color_t.new (0, 0, 0, real_alpha ( DP_APLHA , 80 ) ))	
		
				DISPLAY_TEXT( GETKEYSTATE ( KEY_Exploit ) .. "active exploit", size, vec2_t.new(x + ( 2 * scale) , y - scale + added), font_msyh, true, color_font, color_edge);
				
				added = added + ( 20 * scale );

			end

			if ( KeyOverride == true ) then	

				renderer.rect_filled(vec2_t.new(x, y + added), vec2_t.new(x + ( 200 * scale), y + ( 20 * scale ) + added) , color_t.new (0, 0, 0, real_alpha ( DP_APLHA , 80 ) ))	
		
				DISPLAY_TEXT( GETKEYSTATE ( KEY_Override ) .. "override fakelag", size, vec2_t.new(x + ( 2 * scale) , y - scale + added), font_msyh, true, color_font, color_edge);
				
				added = added + ( 20 * scale );

			end

			if ( KeyInverter == true ) then
				
				renderer.rect_filled(vec2_t.new(x, y + added), vec2_t.new(x + ( 200 * scale), y + ( 20 * scale ) + added) , color_t.new (0, 0, 0, real_alpha ( DP_APLHA , 80 ) ))	
		
				DISPLAY_TEXT( GETKEYSTATE ( KEY_Inverter ) .. "anti-aim inverter", size, vec2_t.new(x + ( 2 * scale) , y - scale + added), font_msyh, true, color_font, color_edge);
				
				added = added + ( 20 * scale );

			end

			if ( KeyJitter == true ) then
				
				renderer.rect_filled(vec2_t.new(x, y + added), vec2_t.new(x + ( 200 * scale), y + ( 20 * scale ) + added) , color_t.new (0, 0, 0, real_alpha ( DP_APLHA , 80 ) ))	
		
				DISPLAY_TEXT( GETKEYSTATE ( KEY_Jitter ) .. "jitter", size, vec2_t.new(x + ( 2 * scale) , y - scale + added), font_msyh, true, color_font, color_edge);
				
				added = added + ( 20 * scale );

			end

			if ( KeyFakeduck == true ) then
				
				renderer.rect_filled(vec2_t.new(x, y + added), vec2_t.new(x + ( 200 * scale), y + ( 20 * scale ) + added) , color_t.new (0, 0, 0, real_alpha ( DP_APLHA , 80 ) ))	
		
				DISPLAY_TEXT( GETKEYSTATE ( KEY_Fakeduck ) .. "fakeduck", size, vec2_t.new(x + ( 2 * scale) , y - scale + added), font_msyh, true, color_font, color_edge);
				
				added = added + ( 20 * scale );

			end
		end
	else
		DP_APLHA = 0;
	end

end
local function CREATE_FAKE_ANGLE ( PLAYER_CMD ) --假身

	if ( not engine.is_connected ( ) ) then return end

    if ( not GlobleEnable ) then return end

	if ( not IS_ALIVE( ) ) then return end

	if ( g_SYNC_VF_STATE<=0) then return end
	
    if ( EV_Freez_Time == true ) then return end

	KeyInverter   = IS_PRESSED(KEY_Inverter);
    KeyJitter     = IS_PRESSED(KEY_Jitter);
    KeyOverride   = IS_PRESSED(KEY_Override);
    KeyExploit    = IS_PRESSED(KEY_Exploit);
    KeyFakeduck   = IS_PRESSED(KEY_Fakeduck);

    ClientChoked =   clientstate.get_choked_commands();
    Local_Player  =   entitylist.get_local_player();
    Local_Speed   =   Local_Player:get_prop_vector(m_vecVelocity[0]):length();
    Local_Flags   =   Local_Player:get_prop_int(m_fFlags);
    ActiveWeaponHandle    =   Local_Player:get_prop_int(m_hActiveWeapon);
	iWeapon   =   entitylist.get_entity_from_handle(ActiveWeaponHandle);
	
	if ( IS_USING( PLAYER_CMD , iWeapon) ) then return end

	--On Shot
    if (ModeOnShot >= 1) then 
        if (KeyExploit == false and KeyFakeduck == false) then
            if (ModeOnShot == 1) then 
                if (OS_CNT_AT >= 1 and OS_CNT_AT <= 2) then
                    if ClientChoked >= 15 then
                        OS_CNT_AT = 2;
                    end
                    if (OS_CNT_AT == 1) then
                        PLAYER_CMD.send_packet = false;
                        local yaw = 58
                        if (KeyInverter == true) then
                           yaw = -58;
                        end
                        PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw + AngleOffsetYaw + yaw;
                    elseif (OS_CNT_AT == 2) then
                        PLAYER_CMD.send_packet = true;
                        PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw + AngleOffsetYaw;
                    end
                    OS_CNT_AT = OS_CNT_AT + 1;
                    return;
                end
			elseif (ModeOnShot == 2) then 
				--if (OS_CNT_AT >= 1 and OS_CNT_AT <= 2) then
					if (OS_CNT_AT == 1) then
						PLAYER_CMD.send_packet = true;
						PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw + AngleOffsetYaw;
						OS_CNT_AT = OS_CNT_AT + 1;
						return;
					end
				--end
			elseif (ModeOnShot == 3) then 
				if (OS_CNT_AT >= 1 and OS_CNT_AT <= 2) then
					if (OS_CNT_AT == 1) then
						PLAYER_CMD.tick_count = 2147483647;
						PLAYER_CMD.send_packet = false;
						if globle_key_inverter then
							PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw + AngleOffsetYaw + 58;
						else
							PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw + AngleOffsetYaw - 58;
						end
					elseif (OS_CNT_AT == 2) then
						PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw + AngleOffsetYaw;
						PLAYER_CMD.send_packet = true;
					end
					OS_CNT_AT = OS_CNT_AT + 1;
					return;
				end
            end
        end
    end

    --YAW

    PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw + AngleOffsetYaw --初始yaw

    --Jitter

    local F_Jitter_Angle = 0; --覆盖抖动角度

    if (KeyJitter == true) then
        if (ModeJitter == 0) then
            if (ClientChoked == 0) then
                if  (F_Jitter_Side == 0)  then
                    F_Jitter_Side = 1;
                else
                    F_Jitter_Side = 0;
                end
                F_Jitter_Last = AngleJitterYaw / 2;
            end
            if  (F_Jitter_Side == 0)  then
                F_Jitter_Angle = F_Jitter_Last;
            else
                F_Jitter_Angle = - F_Jitter_Last;
            end
            PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw + F_Jitter_Angle;
        elseif (ModeJitter == 1) then
            if (ClientChoked == 0) then
                if  (F_Jitter_Side <= 3)  then
                    F_Jitter_Side = F_Jitter_Side + 1;
                else
                    F_Jitter_Side = 0;
                end
                F_Jitter_Last = AngleJitterYaw / 2;
            end
            if (F_Jitter_Side == 0 or F_Jitter_Side == 2)  then
                F_Jitter_Angle = 0;
            elseif  (F_Jitter_Side == 1)  then
                F_Jitter_Angle = F_Jitter_Last;
            else
                F_Jitter_Angle = -F_Jitter_Last;
            end
            PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw + F_Jitter_Angle;
        elseif (ModeJitter == 2) then
            if (ClientChoked == 0) then
                local ABS_Angle = math.abs(AngleJitterYaw)
                F_Jitter_Last =  math.random(-(ABS_Angle/2),(ABS_Angle/2));
            end
            F_Jitter_Angle = F_Jitter_Last;
            PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw + F_Jitter_Angle;
        end
    end

    --触发fakelag

	if (KeyExploit == true or KeyFakeduck == true) then --触发开启默认aa
		ui.set_int("antihit_antiaim_enable", 1)
		return;
	else
		ui.set_int("antihit_antiaim_enable", 0)
	end

    if (ModeFakelag >= 1) then --假卡模式
        if (ModeFakelag == 1) then
            if (ClientChoked == 0) then
                if (FL_SWITCH_STATE == 0) then
                    FL_SWITCH_STATE = 1;
                else
                    FL_SWITCH_STATE = 0;
                end
            end
            if (FL_SWITCH_STATE == 0) then
                ChokeNormalLimit = ChokeNormalLimitMax;
            end
        elseif (ModeFakelag == 2) then
            if (ClientChoked == 0) then
                FL_SWITCH_LAST = math.random(ChokeNormalLimit,ChokeNormalLimitMax);
            end
            ChokeNormalLimit = FL_SWITCH_LAST;
        end
    end
    
    if (ModeTrigger >= 1) then --触发假卡
        if (KeyExploit ==false and KeyFakeduck == false) then
            if (ModeTrigger == 1) then --空中
                if (IS_INAIR(Local_Flags)) then
                    ChokeNormalLimit = ChokeTriggerLimit;
                end
            elseif (ModeTrigger == 2) then --射击
                if (OS_CNT_FL >= 1 and OS_CNT_FL <= ChokeTriggerLimit) then
                    ChokeNormalLimit = ChokeTriggerLimit;
                    OS_CNT_FL = OS_CNT_FL + 1;
                end
            elseif (ModeTrigger == 3) then --站立
                if (Local_Speed <= 3 and not IS_INAIR(Local_Flags)) then
                    ChokeNormalLimit = ChokeTriggerLimit;
                end
            end
        end
    end

    if (KeyOverride == true) then --手动假卡
        ChokeNormalLimit = ChokeOverrideLimit;
    end

    --切换假身

    if (ModeAutoInverter == 1) then --射击切换
        if (FP_ATFP_ST == true) then
            KeyInverter = not KeyInverter;
        end
    end

    if (ModeFlipInverter >= 1) then --移动切换
        if (ClientChoked == 0) then
            FP_ATFP_MV = not FP_ATFP_MV;
        end
        if (ModeFlipInverter == 1) then
            if (Local_Speed > 3 and Local_Speed < 110 and not IS_INAIR(Local_Flags)) then
                KeyInverter = FP_ATFP_MV;
            end
        elseif (ModeFlipInverter == 2) then
            if (Local_Speed > 3 and IS_INAIR(Local_Flags)) then
                KeyInverter = FP_ATFP_MV;
            end
        elseif (ModeFlipInverter == 3) then
            if (Local_Speed > 3) then
                KeyInverter = FP_ATFP_MV;
            end
        end
    end

    if ( Local_Speed <= 3 and ModeExtend >= 1) then --判断触发分离
		
		ui.set_int("antihit_antiaim_enable", 0)
		
		if (ModeExtend >= 1 and ModeExtend <= 3) then
            local choke_yaw_1 = 0;
            local choke_yaw_2 = 0;
            if (ModeExtend == 1) then
                choke_yaw_1 = 58 --58
                choke_yaw_2 = 96 --96
            elseif (ModeExtend==2) then
                choke_yaw_1 = 180
                choke_yaw_2 = 116
            elseif (ModeExtend == 3) then
                choke_yaw_1 = 116
                choke_yaw_2 = 94
            end
            if (KeyInverter == true) then
                choke_yaw_1 = -choke_yaw_1;
                choke_yaw_2 = -choke_yaw_2;
            end
            if (ClientChoked == 0) then
                PLAYER_CMD.send_packet = false;
                PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw - choke_yaw_1;
            elseif (ClientChoked <= 1) then
                PLAYER_CMD.send_packet = false;
                PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw + choke_yaw_2;
            else
                PLAYER_CMD.send_packet = true;
            end
		elseif (ModeExtend >= 4 and ModeExtend <= 5) then
            local choke_yaw = 0;
            if (ModeExtend == 4) then
                choke_yaw = 176
            elseif (ModeExtend==5) then
                choke_yaw = 180
            end
            if (KeyInverter == true) then
                choke_yaw = -choke_yaw;
			end
			if (ModeTrigger == 3) then
				ChokeNormalLimit = ChokeTriggerLimit;
			else
				ChokeNormalLimit = 1;
			end
            if (ClientChoked < ChokeNormalLimit) then
                PLAYER_CMD.send_packet = false;
                PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw + choke_yaw;
            else
                PLAYER_CMD.send_packet = true;
            end
        end
    else
        local Is_Choked = false;
		local fAngle = 58;
		if (ModeAntiResolver > 0 ) then
			if (not IS_INAIR(Local_Flags) and Local_Speed >= 3 and Local_Speed <= 150) then
				if (ModeAntiResolver == 1) then
					if (fAngle_ATR_cnt > 0 and fAngle_ATR_cnt < 2) then
						fAngle_ATR_cnt = fAngle_ATR_cnt + 1
						PLAYER_CMD.send_packet = true
						return
					end
					if (ClientChoked ~= 0) then
						local angle = 0
						if (math.random(0,28-(ChokeNormalLimit/2)) == 0) then
							angle = math.random(29,58);
							fAngle_ATR_cnt =  1;
						end
						if (math.random(0,3) == 0) then
							angle = -angle;
						end
						if (KeyInverter == true) then
							PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw - angle;
						else
							PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw + angle;
						end
					end
				elseif (ModeAntiResolver == 2) then
					if (fAngle_ATR_cnt >= 1 and fAngle_ATR_cnt <= 32) then
						fAngle = 58;
						fAngle_ATR_cnt = fAngle_ATR_cnt + 1;
					else
						fAngle = 0;
					end
				else
					fAngle = 58
				end
			end
		else
			fAngle = 58
		end
		if (Local_Speed <= 3) then
			if (ModeTrigger == 3) then
				ChokeNormalLimit = ChokeTriggerLimit;
			else
				ChokeNormalLimit = 1;
			end
		end
		if ( api_choke_override >= 0 ) then

			if ( api_choke_override == 0) then return end;
	
			ChokeNormalLimit = api_choke_override;
			
		end
        if (ClientChoked < ChokeNormalLimit) then
            PLAYER_CMD.send_packet = false;
            Is_Choked = true;
        end
        if (KeyInverter == true) then
            fAngle = -fAngle
		end
		
		if ((Local_Speed < 3 and ModeExtend == 0)) then --触发开启默认aa
			ui.set_int("antihit_antiaim_enable", 1)
			return;
		else
			ui.set_int("antihit_antiaim_enable", 0)
		end
    	if (Is_Choked == true) then
            PLAYER_CMD.viewangles.yaw = PLAYER_CMD.viewangles.yaw + fAngle;
		end
    end
end
--回调
client.register_callback("paint"			, VERIFY_USERNAME);
client.register_callback("paint"			, REFRESH_GLOBLE_VAR);
client.register_callback("shot_fired"		, ON_SHOT);
client.register_callback("fire_game_event"	, ON_HARMED);
client.register_callback("fire_game_event"	, ON_FREEZ)
client.register_callback("paint_d3d"		, WATERMARK);
client.register_callback("paint_d3d"		, DISPLAY);
client.register_callback("create_move"		, CREATE_FAKE_ANGLE);
client.register_callback("unload"			, ON_UNLOAD);

--末置功能
SEND_MSG(VF_PREFIX .. ": script loaded");
SEND_MSG(VF_PREFIX .. ": ADVANCED_API_VERSION: " .. ADVANCED_API_VERSION);

--[[
	[
		
		You are free to:

			Share — copy and redistribute the material in any medium or format

			Adapt — remix, transform, and build upon the material

			The licensor cannot revoke these freedoms as long as you follow the license terms.

		Under the following terms:

			Attribution — You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.

			NonCommercial — You may not use the material for commercial purposes.

			No additional restrictions — You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.

		Notices:

			You do not have to comply with the license for elements of the material in the public domain or where your use is permitted by an applicable exception or limitation.
			
			No warranties are given. The license may not give you all of the permissions necessary for your intended use. For example, other rights such as publicity, privacy, or moral rights may limit how you use the material.

	]
--]]

--[[
	注：黑历史啊啊啊啊啊啊啊啊啊啊啊
]]
