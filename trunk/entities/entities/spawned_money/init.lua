AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self.Entity:SetModel("models/props/cs_assault/money.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	
	local phys = self.Entity:GetPhysicsObject()
	self.nodupe = true
	self.ShareGravgun = true

	if phys and phys:IsValid() then phys:Wake() end
end


function ENT:Use(activator,caller)
	local amount = self.Amount

	activator:AddMoney(amount)
	Notify(activator, 0, 4, "You have found " .. CUR .. self.Amount .. "!")
	self:Remove()
end

/*function ENT:PhysicsCollide( data, physobj )
	if physobj and physobj:IsValid() then physobj:Sleep() end
end*/

function DarkRPCreateMoneyBag(pos, amount)
	local moneybag = ents.Create("spawned_money")
	moneybag:SetPos(pos)
	moneybag.Amount = amount
	moneybag:Spawn()
	moneybag:Activate()
end
