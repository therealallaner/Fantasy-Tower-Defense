extends PanelContainer
class_name ButtonTextures


var GoldExponent: int = 25

@export var again: Texture
@export var bagogold: Texture
@export var stonks: Texture
@export var melee: Texture
@export var ranged: Texture
@export var tower: Texture
@export var commander: Texture
@export var captain: Texture
@export var support: Texture

var againdesc: String = "Reroll Wave Rewards"

var bagogolddesc: String = "Gain $" + str(GoldExponent)

var stonksdesc: String = "Increase End of Round Income"

var meleedesc: String = "Increase Melee Unit damage by 1
Current damage is: " + str(Global.InfantryDmg)

var rangeddesc: String = "Increase Ranged Unit damage by 1
Current damage is: " + str(Global.XbowDmg)

var towerdesc: String = "Heal the Tower by 10 HP"

var commanderdesc: String = "Increase Max Commander Troop Capacity"

var captaindesc: String = "Unlocks the Captain Unit"

var supportdesc: String = "Adds an extra Captain slot to your Commanders"
