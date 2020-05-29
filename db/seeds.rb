Player.delete_all
Item.delete_all
Inventory.delete_all

#players table

Player.create({ name: "tlgger", health: 20, attack_power: 20 })


#items table
Item.create({name: "LANTERN", health: 0, attack: 0})
Item.create({name: "HEALTH POTION", health: 20, attack: 0})
Item.create({name: "STRENGTH POTION", health: 0, attack: 20})
Item.create({name: "THERMAL POD", health: -10, attack: 40})


#inventories table
Inventory.create({ player_id: 122, item_id: 01 })

