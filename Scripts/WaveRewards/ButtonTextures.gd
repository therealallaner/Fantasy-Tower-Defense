extends PanelContainer
class_name ButtonTextures


@export var again: Texture
@export var bagogold: Texture
@export var stonks: Texture
@export var melee: Texture
@export var ranged: Texture
@export var tower: Texture
@export var commander: Texture
@export var captain: Texture

var againdesc: String = "Reroll Wave Rewards"

var bagogolddesc: String = "Gain $25"

var stonksdesc: String = "Increase End of Round Income"

var meleedesc: String = "Increase Melee Unit damage by 1
Current damage is: " + str(Global.InfantryDmg)

var rangeddesc: String = "Increase Ranged Unit damage by 1
Current damage is: " + str(Global.XbowDmg)

var towerdesc: String = "Heal the Tower by 10 HP"

var commanderdesc: String = "Increase Max Commander Troop Capacity"

var captaindesc: String = "Unlocks the Captain Unit"
