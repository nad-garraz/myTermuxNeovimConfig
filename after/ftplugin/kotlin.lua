-- Compilar y generar ejecutable
vim.keymap.set('n', '<leader>cc', function()
    vim.cmd 'wa'
    vim.cmd ':silent !make compile'
end, {
    desc = 'Compile Kotlin file',
    buffer = true,
    silent = true,
})

vim.keymap.set('n', '<leader>rr', function()
    vim.cmd 'silent !make run'
end, {
    desc = 'Run Jar executable',
    buffer = true,
    silent = true,
})

vim.keymap.set('n', '<leader>gr', function()
    vim.cmd 'wa'
    vim.cmd 'silent !make gradle-run'
end, {
    desc = 'Gradle run',
    buffer = true,
    silent = true,
})

vim.keymap.set('n', '<leader>gbc', function()
    vim.cmd 'silent !make gradle-show-byte-code'
end, {
    desc = 'Gradle ShowBytecode',
    buffer = true,
    silent = true,
})

vim.keymap.set('n', '<leader>mc', function()
    vim.cmd ':!make clean-all'
end, {
    desc = 'Clean all',
    buffer = true,
})

-- Format with ktlint
vim.keymap.set('n', '<leader>lf', function()
    vim.cmd 'wa'
    vim.cmd('silent !make format-kotlin FILE=' .. vim.fn.expand '%') -- Le pasa el archivo que estoy editando al Makefile
end, {
    desc = 'Format',
    buffer = true,
    silent = true,
})

-- Gradle installDebug
vim.keymap.set('n', '<leader>gid', function()
    vim.cmd 'wa'
    vim.cmd 'silent !make gradle-installDebug'
end, {
    desc = 'Gradel installDebub command',
    buffer = true,
    silent = true,
})

-- Open Log in new window
vim.keymap.set('n', '<leader>log', function()
    vim.cmd '!make open-log'
end, {
    desc = 'Open Log in new window',
    buffer = true,
})

-- Gradle open Android emulator
vim.keymap.set('n', '<leader>oe', function()
    vim.cmd '!make open-emulator'
end, {
    desc = 'Open emulator',
    buffer = true,
})

-- Gradle run test in new floating window
vim.keymap.set('n', '<leader>rt', function()
    vim.cmd 'wa'
    vim.cmd '!make run-test'
end, {
    desc = 'Run tests',
    buffer = true,
})

-- Gradle run android-tests in new floating window
vim.keymap.set('n', '<leader>rat', function()
    vim.cmd 'wa'
    vim.cmd 'silent !make run-android-tests'
end, {
    desc = 'Run android-tests',
    buffer = true,
    silent = true,
})
