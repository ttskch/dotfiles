-- hammerspoon-keystroke-macro
-- A simple keystroke macro module for Hammerspoon.
--
-- Features:
--   * Toggle-style recording (same hotkey starts/stops)
--   * Keystrokes pass through during recording while being captured for replay
--   * Recording again overwrites the previously saved macro
--
-- Notes:
--   * Hammerspoon must be granted "Accessibility" permission
--   * To prevent the start/stop hotkey itself from being captured, events
--     within TRIM_WINDOW seconds at the beginning/end are discarded

local M = {}

local recording = false
local capturing = {}
local recorder = nil
local recordStartedAt = 0
local savedEvents = nil

-- Threshold (seconds) for discarding hotkey-originated events at start/end.
local TRIM_WINDOW = 0.15

-- Interval between posted events during replay (microseconds).
-- 0 may cause the receiving side to miss modifier state changes.
-- 3000 (3ms) is a safe default. For slower targets, increase to 5000-10000.
local REPLAY_INTERVAL_US = 3000

local function notify(msg)
    hs.alert.closeAll()
    hs.alert.show(msg, 1.0)
end

local function startRecording()
    if recording then
        notify("⚠ Already recording")
        return
    end
    capturing = {}
    recording = true
    recordStartedAt = hs.timer.absoluteTime()
    notify("● REC")
    recorder = hs.eventtap.new({
        hs.eventtap.event.types.keyDown,
        hs.eventtap.event.types.keyUp,
        hs.eventtap.event.types.flagsChanged,
    }, function(event)
        local now = hs.timer.absoluteTime()
        if (now - recordStartedAt) / 1e9 < TRIM_WINDOW then
            return false
        end
        table.insert(capturing, { event = event:copy(), timestamp = now })
        return false
    end)
    recorder:start()
end

local function stopRecording()
    if not recording then return end
    recording = false
    if recorder then
        recorder:stop()
        recorder = nil
    end
    local stopAt = hs.timer.absoluteTime()
    while #capturing > 0
          and (stopAt - capturing[#capturing].timestamp) / 1e9 < TRIM_WINDOW do
        table.remove(capturing)
    end
    savedEvents = capturing
    notify("■ Saved")
end

function M.toggle()
    if recording then stopRecording() else startRecording() end
end

function M.play()
    if recording then
        notify("⚠ Stop recording first")
        return
    end
    if not savedEvents or #savedEvents == 0 then
        notify("No macro")
        return
    end
    notify("▶ Play")
    for _, item in ipairs(savedEvents) do
        item.event:post()
        hs.timer.usleep(REPLAY_INTERVAL_US)
    end
end

-- Register hotkeys. Pass opts to override defaults:
--   toggleHotkey = {<modifiers table>, <key>}
--   playHotkey   = {<modifiers table>, <key>}
function M.setup(opts)
    opts = opts or {}
    local toggleHotkey = opts.toggleHotkey or {{"cmd", "shift", "alt"}, "R"}
    local playHotkey   = opts.playHotkey   or {{"cmd", "shift", "alt"}, "P"}
    hs.hotkey.bind(toggleHotkey[1], toggleHotkey[2], M.toggle)
    hs.hotkey.bind(playHotkey[1], playHotkey[2], M.play, nil, M.play)
    return M
end

return M
