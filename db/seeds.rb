List.destroy_all
Task.destroy_all

lists = List.create([{title: "Groceries", complete: 0},{title: "Work", complete: 0},{title: "Home", complete: 0}])
lists[0].tasks << Task.create({label: "broccoli"})
lists[0].tasks << Task.create({label: "eggs"})
lists[0].tasks << Task.create({label: "bacon"})
lists[0].tasks << Task.create({label: "bread"})
lists[0].tasks << Task.create({label: "pasta"})
lists[0].tasks << Task.create({label: "milk"})
lists[0].tasks << Task.create({label: "orange juice"})
lists[0].tasks << Task.create({label: "steaks"})
lists[0].tasks << Task.create({label: "potatoes"})