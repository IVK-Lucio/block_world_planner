module BlockWorldApp

using Matte

const title = "BLOCK WORLD"

function ui()
    sidebar_layout(
        side_panel(
        text_input("block1", "Enter block 1"; default = ""),
        text_input("block2", "Enter block 2"; default = ""),
button("bt", "set-up World!! "; color="blue", size="normal"),
br(),
h3("SET UP GOAL"),
text_input("goal_block1", "Enter block 1"; default = ""),
text_input("goal_block2", "Enter block 2"; default = ""),
button("bt2", "set-up Goal!! "; color="yellow", size="normal"),
button("bt3", "PLAN "; color="green", size="normal")
        ),
        main_panel(
            h1("REPL RESULT"),
            datatable_output("world_config"),
            h2("GOAL STACK"),
            datatable_output("goal_config"),
            h2("INITIAL STATE"),
            datatable_output("current_state"),
            h2("ACTION PLAN"),
            datatable_output("state")
        )
    )
end

module Server
using DataFrames
table=DataFrame(Blocks=[],state_Description=[])
goal_table=DataFrame(Blocks=[],state_Description=[])
blocks_state=DataFrame(Blocks=[],state_Description=[])
planned_actions=DataFrame(List=[],Blank=[])
################################################


#################################################
function world_config(block1,block2,bt)
    if length(block2)>0 && length(block1) >0 && bt
push!(table,("$block1","$block1 on $block2"))
end
end
###################################################
function goal_config(goal_block1,goal_block2,bt2)
    if length(goal_block1)>0 && length(goal_block1) >0 && bt2
push!(goal_table,("$goal_block1","$goal_block1 on $goal_block2"))
end
end
###################################################
function current_state(bt3)
    if bt3
    table
end
end
#####################################################

function plan_action(bt3)
    if bt3
blok=""
bk_stack=""
for e in 1:size(table)[1]
blok=table[!,1][e]
push!(planned_actions,("Put $blok on Table",""))
end
end
end

####################################################
function state(bt3)
    if bt3
    planned_actions
end
end




#################################################
end

end

