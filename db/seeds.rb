Player.delete_all
Item.delete_all
Inventory.delete_all

#players table
10.times do
    Player.create({
        name: Faker::FunnyName.name,
        health: 20,
        attack_power: 20
    })
end

#items table
Item.create({name: "LANTERN", health: 0, attack: 0})
Item.create({name: "HEALTH POTION", health: 20, attack: 0})
Item.create({name: "STRENGTH POTION", health: 0, attack: 20})
Item.create({name: "THERMAL POD", health: -10, attack: 40})


#inventories table
10.times do
    Inventory.create({
        player_id: Player.all.sample.id,
        item_id: Item.all.sample.id
    })
end
