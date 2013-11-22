care = Care.new
care.description = "Office visit"
care.save

plan = Plan.new
plan.title = "Crappy PPO"
plan.provider = "Blue Sabotage"
plan.category = "PPO"
plan.cost = 153
plan.save

need = Need.new
need.description = "Allergy shots"
need.frequency = 12
need.cost = 80
care.needs << need
need.save

cc = CaresPlans.new
cc.cover_percent = 25
cc.covered = true
cc.plan = plan
cc.care = care
cc.save



