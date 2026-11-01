cubes = {}

for i = 1, 500 do
    local bias = math.random(75, 125) / 100
    table.insert(cubes, {
        x = math.random(0, 1920),
        y = math.random(0, 1080),
        speed = math.random(5, 1000) * bias
    })
end

function love.load()
    love.window.setMode(1920, 1080)
end

function love.update(dt)
    for _, cube in ipairs(cubes) do
        cube.x = (cube.x + cube.speed * dt) % 1920 -- delete for falling snow effect, turn the plus into a minus to change the diagonal direction to bottom left
        cube.y = (cube.y + cube.speed * dt) % 1080 -- delete for horizontal effect, turn the plus into a minus to change the diagonal direction to top right
    end
end

function love.draw()
    for _, cube in ipairs(cubes) do
        love.graphics.rectangle("fill", cube.x, cube.y, 10, 10)
        -- love.graphics.print(cube.speed, cube.x, cube.y + 15)
        -- ^^^^^^^^^^^^^^^^^^ uncomment to show cube speed
    end
end