#include <sourcemod>
#include <cstrike>
#include <sdktools>
new weaponIndex;

public Plugin:myinfo =
{
	name = "Poor-buy",
	author = "Letaryat",
	description = "Buying unavailable weapons (M4A1S, CZ75a, R8) via chat commands",
	version = "1.0"
}

public void OnPluginStart()
{
	RegConsoleCmd("sm_m4a1s", Command_M4A1, "Kupuje M4A1S");
	RegConsoleCmd("sm_cz75a", Command_CZ, "Kupuje CZ75a");
	RegConsoleCmd("sm_r8", Command_REW, "Kupuje Rewolwer");
}

public Action:Command_M4A1(client, args)
{
	if(!IsPlayerAlive(client))
		PrintToChat(client, "\x04[M4A1S] \x02 Musisz zyc");
	else
	{	
		int clientMoney = GetEntProp(client, Prop_Send, "m_iAccount"); 
		if(clientMoney >= 2900)
		{
		if(GetClientTeam(client) == 3)
		{
			SetEntProp(client, Prop_Send, "m_iAccount", clientMoney - 2900);
			GivePlayerItem(client, "weapon_m4a1_silencer");
			PrintToChat(client, "\x04[M4A1S]\x06 Kupiles M4A1S");
		}
		else
			{
			PrintToChat(client, "\x04[M4A1S]\x02 Nie jestes w odpowiedniej druzynie");
			}
		}
		else
		{
			PrintToChat(client, "\x04[M4A1S]\x02 Nie masz wystarczajaco pieniedzy");
		}
	}
	return Plugin_Handled;
}

public Action:Command_CZ(client, args)
{
	if(!IsPlayerAlive(client))
		PrintToChat(client, "\x04[CZ75A] \x02 Musisz zyc");
	else
	{	
		int clientMoney = GetEntProp(client, Prop_Send, "m_iAccount");
		if(clientMoney >= 500)
		{
		if ((weaponIndex = GetPlayerWeaponSlot(client, 1)) != -1)
		RemovePlayerItem(client, weaponIndex);
		SetEntProp(client, Prop_Send, "m_iAccount", clientMoney - 500);
		GivePlayerItem(client, "weapon_cz75a");
		PrintToChat(client, "\x04[CZ75A]\x06 Kupiles CZ75a");
		}
		else
		{
			PrintToChat(client, "\x04[CZ75A]\x02 Nie masz wystarczajaco pieniedzy");
		}
	}
	return Plugin_Handled;
}

public Action:Command_REW(client, args)
{
	if(!IsPlayerAlive(client))
		PrintToChat(client, "\x04[R8] \x02 Musisz zyc");
	else
	{	
		int clientMoney = GetEntProp(client, Prop_Send, "m_iAccount");
		if(clientMoney >= 600)
		{
		if ((weaponIndex = GetPlayerWeaponSlot(client, 1)) != -1)
		RemovePlayerItem(client, weaponIndex);
		SetEntProp(client, Prop_Send, "m_iAccount", clientMoney - 600);
		GivePlayerItem(client, "weapon_revolver");
		PrintToChat(client, "\x04[R8]\x06 Kupiles Rewolwer");
		}
		else
		{
			PrintToChat(client, "\x04[R8]\x02 Nie masz wystarczajaco pieniedzy");
		}
	}
	return Plugin_Handled;
}

