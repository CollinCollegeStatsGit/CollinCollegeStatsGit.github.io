local def_id = 1
local ex_id = 1
function Callout(callout)
  if callout.type == "note" then
    callout.title.content[1] = pandoc.Strong(pandoc.Str "Definition")
    callout.title.content[2] = pandoc.Str " "
    callout.title.content[3] = pandoc.Strong(tostring(def_id))
    def_id = def_id + 1
    quarto.log.output(callout.attr.attributes.attributeslist)
  
  elseif callout.type == "tip" then
    callout.title.content[1] = pandoc.Strong(pandoc.Str "Example")
    callout.title.content[2] = pandoc.Str " "
    callout.title.content[3] = pandoc.Strong(tostring(ex_id))
    ex_id = ex_id + 1
  end
  
  return quarto.Callout(callout)
end