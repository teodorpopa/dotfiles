local utils = require("utils")

local modules = utils.map({
	"window",
	"font",
	"theme",
	"tab",
	"keys",
}, utils.req)

return utils.merge(table.unpack(modules))
