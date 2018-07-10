users = team.users
json.id team.id

json.user1 users[0] ? best_in_place(users[0], :name) : ""
json.user2 users[1] ? best_in_place(users[1], :name) : ""
json.user3 users[2] ? best_in_place(users[2], :name) : ""
json.link best_in_place(team, :name)


json.url team_path(team)
json.delete link_to "Supprimer", team, class: "delete-team", method: :delete, data: { confirm: 'Are you sure?' }