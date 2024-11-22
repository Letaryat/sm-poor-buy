#include <sourcemod>
#include <cstrike>
#include <sdktools>
new weaponIndex;
bool g_bBuyTimeExpired;

public Plugin:myinfo =
{
	name = "Poor-buy",
	author = "Letaryat",
	description = "Buying unavailable weapons (USP-S, M4A1S, CZ75a, R8) via chat commands",
	version = "1.0"
}

public void OnPluginStart()
{
	RegConsoleCmd("sm_m4a1s", Command_M4A1, "Kupuje M4A1S");
	RegConsoleCmd("sm_usp", Command_USP, "Kupuje USP");
	RegConsoleCmd("sm_cz75a", Command_CZ, "Kupuje CZ75a");
	RegConsoleCmd("sm_r8", Command_REW, "Kupuje Rewolwer");
	RegConsoleCmd("sm_kup", Menu_Kup);
	HookEvent("buytime_ended", BuyTime_Ended, EventHookMode_PostNoCopy);
	HookEvent("round_start", RoundStartEvent, EventHookMode_PostNoCopy);

}

public void BuyTime_Ended(Event event, const char[] name, bool dontBroadcast)
{
	g_bBuyTimeExpired = true;
}
public void RoundStartEvent(Event event, const char[] name, bool dontBroadcast)
{
	g_bBuyTimeExpired = false;
}

public Action:Command_M4A1(client, args)
{
	if(!IsPlayerAlive(client)){
		PrintToChat(client, "\x04[M4A1S] \x02 Musisz zyc");
	}
	else
	{	
	if(g_bBuyTimeExpired){
		PrintToChat(client, "\x04[M4A1S] \x02 Koniec kupowania!");
	}
	if(!GetEntProp(client, Prop_Send, "m_bInBuyZone"))
	{
	    PrintToChat(client, "\x04[M4A1S] \x02 Nie jestes w strefie kupowania!!");
	}
	else
	{
		int clientMoney = GetEntProp(client, Prop_Send, "m_iAccount");
		if(clientMoney >= 2900)
		{
		if(GetClientTeam(client) == 3)
		{
			if ((weaponIndex = GetPlayerWeaponSlot(client, 0)) != -1)
			CS_DropWeapon(client, weaponIndex, true, false);
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
	}
	return Plugin_Handled;
}

public Action:Command_USP(client, args)
{
	if(!IsPlayerAlive(client)){
		PrintToChat(client, "\x04[USP] \x02 Musisz zyc");
	}
	else
	{	
	if(g_bBuyTimeExpired){
		PrintToChat(client, "\x04[USP] \x02 Koniec kupowania!");
	}
	if(!GetEntProp(client, Prop_Send, "m_bInBuyZone"))
	{
	    PrintToChat(client, "\x04[USP] \x02 Nie jestes w strefie kupowania!!");
	}
	else
	{
		int clientMoney = GetEntProp(client, Prop_Send, "m_iAccount");
		if(clientMoney >= 200)
		{
		if(GetClientTeam(client) == 3)
		{
			if ((weaponIndex = GetPlayerWeaponSlot(client, 1)) != -1)
			CS_DropWeapon(client, weaponIndex, true, false);
			GivePlayerItem(client, "weapon_usp_silencer");
			PrintToChat(client, "\x04[USP]\x06 Kupiles USP");
		}
		else
			{
			PrintToChat(client, "\x04[USP]\x02 Nie jestes w odpowiedniej druzynie");
			}
		}
		else
		{
			PrintToChat(client, "\x04[USP]\x02 Nie masz wystarczajaco pieniedzy");
		}
	}
	}
	return Plugin_Handled;
}

public Action:Command_CZ(client, args)
{
	if(!IsPlayerAlive(client)){
	PrintToChat(client, "\x04[CZ75A] \x02 Musisz zyc");
	}
	else
	{	
	if(g_bBuyTimeExpired){
		PrintToChat(client, "\x04[CZ75A] \x02 Koniec kupowania!");
	}
	if(!GetEntProp(client, Prop_Send, "m_bInBuyZone"))
	{
	    PrintToChat(client, "\x04[CZ75A] \x02 Nie jestes w strefie kupowania!!");
	}
	else
	{
		int clientMoney = GetEntProp(client, Prop_Send, "m_iAccount");
		if(clientMoney >= 500)
		{
		if ((weaponIndex = GetPlayerWeaponSlot(client, 1)) != -1)
		CS_DropWeapon(client, weaponIndex, true, false);
		SetEntProp(client, Prop_Send, "m_iAccount", clientMoney - 500);
		GivePlayerItem(client, "weapon_cz75a");
		PrintToChat(client, "\x04[CZ75A]\x06 Kupiles CZ75a");
		}
		else
		{
			PrintToChat(client, "\x04[CZ75A]\x02 Nie masz wystarczajaco pieniedzy");
		}
	}
	}
	return Plugin_Handled;
}

public Action:Command_REW(client, args)
{
	if(!IsPlayerAlive(client)){
	PrintToChat(client, "\x04[R8] \x02 Musisz zyc");
	}
	else
	{	
	if(g_bBuyTimeExpired){
		PrintToChat(client, "\x04[R8] \x02 Koniec kupowania!");
	}
	if(!GetEntProp(client, Prop_Send, "m_bInBuyZone"))
	{
	    PrintToChat(client, "\x04[R8] \x02 Nie jestes w strefie kupowania!!");
	}
	else{
		int clientMoney = GetEntProp(client, Prop_Send, "m_iAccount");
		if(clientMoney >= 600)
		{
		if ((weaponIndex = GetPlayerWeaponSlot(client, 1)) != -1)
		CS_DropWeapon(client, weaponIndex, true, false);
		SetEntProp(client, Prop_Send, "m_iAccount", clientMoney - 600);
		GivePlayerItem(client, "weapon_revolver");
		PrintToChat(client, "\x04[R8]\x06 Kupiles Rewolwer");
		}
		else
		{
			PrintToChat(client, "\x04[R8]\x02 Nie masz wystarczajaco pieniedzy");
		}
	}
	}
	return Plugin_Handled;
}


public int Menu_Callback(Menu menu, MenuAction action, int param1, int param2)
{
	switch(action)
	{
		case MenuAction_Start:
		{
			PrintToServer("Display Menu");
		}
		
		case MenuAction_Select:
		{
			char info[32];
			menu.GetItem(param2, info, sizeof(info));
			PrintToServer("Client: %d wybral %s", param1, info);
			if(StrEqual(info, "m4a1s"))
			{
				FakeClientCommand(param1, "sm_m4a1s");
			}
			if(StrEqual(info, "usp"))
			{
				FakeClientCommand(param1, "sm_usp");
			}
			if(StrEqual(info, "cz75a"))
			{
				FakeClientCommand(param1, "sm_cz75a");
			}
			if(StrEqual(info, "r8"))
			{
				FakeClientCommand(param1, "sm_r8");
			}
		}
		
		case MenuAction_End:
		{
			delete menu;
		}
		
	}
	return 0;
}


public Action Menu_Kup(client, args)
{
	if(!IsPlayerAlive(client)){
		PrintToChat(client, "\x04[Menu] \x02 Musisz zyc");
	}
	else
	{
		if(g_bBuyTimeExpired){
			PrintToChat(client, "\x04[Menu] \x02 Koniec kupowania!");
		}
		if(!GetEntProp(client, Prop_Send, "m_bInBuyZone"))
		{
			PrintToChat(client, "\x04[Menu] \x02 Nie jestes w strefie kupowania!!");
		}
		else{
		  Menu menu = new Menu(Menu_Callback);
		  menu.SetTitle("Bronska");
		  if(GetClientTeam(client) == 3){
			menu.AddItem("usp", "USP");
			menu.AddItem("m4a1s", "M4A1S");
		  } 
		  menu.AddItem("cz75a", "CZ75a");
		  menu.AddItem("r8", "R8");
		  menu.ExitButton = true;
		  menu.Display(client, 30);
		}
	}
	return Plugin_Handled;
}
