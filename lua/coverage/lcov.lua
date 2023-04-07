
--- Loads a coverage report from an lcov file but does not place signs.
--- @param file string the path to the lcov file
--- @param place boolean true to immediately place signs
M.load = function(file, place)
    -- TODO have a config value for file
    -- local lang_config = config.opts.lang[ftype]
    -- if lang_config == nil then
    --     lang_config = config.opts.lang[lang.config_alias]
    -- end
    -- if lang_config ~= nil and lang_config.coverage_file ~= nil then
    --     watch.start(lang_config.coverage_file, load_lang)
    -- end
    signs.clear()
    parse_lcov_file(file, function(result)
        -- TODO wat this
        -- if config.opts.load_coverage_cb ~= nil then
        --     vim.schedule(function()
        --         config.opts.load_coverage_cb(ftype)
        --     end)
        -- end
        report.cache(result, ftype)
        local sign_list = lang.sign_list(result)
        if place or signs.is_enabled() then
            signs.place(sign_list)
        else
            signs.cache(sign_list)
        end
    end)
end

local parse_lcov_file = function(file, callback)
    vim.notify("heyyy lmao")
end
